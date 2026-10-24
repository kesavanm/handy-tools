#!/bin/bash

# Define the backup directory
BACKUP_DIR="$HOME/mate_rice_backup"
URL_FILE="$BACKUP_DIR/repo_urls.txt"

# List of required packages for your setup
REQUIRED_PKGS=("mate-desktop-environment" "plank" "compiz" "albert" "cairo-clock" "conky-all" "git")

show_usage() {
    echo "Usage: $0 [export|import]"
    echo "  export : Backs up MATE and configuration files (Leaves assets to Git)"
    echo "  import : Restores configurations and git clones assets"
    exit 1
}

check_and_install_packages() {
    echo "[*] Checking for missing application packages..."
    MISSING_PKGS=()

    for pkg in "${REQUIRED_PKGS[@]}"; do
        if ! dpkg -s "$pkg" >/dev/null 2>&1; then
            MISSING_PKGS+=("$pkg")
        fi
    done

    if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
        echo "The following required packages are missing from your system:"
        for missing in "${MISSING_PKGS[@]}"; do
            echo "  - $missing"
        done
        echo ""
        read -p "Would you like to install them via apt now? (y/N): " choice
        case "$choice" in 
            [yY][eE][sS]|[yY]) 
                echo "[*] Updating package database and installing dependencies..."
                sudo apt update
                sudo apt install -y "${MISSING_PKGS[@]}"
                ;;
            *)
                echo "[!] Warning: Proceeding without installing missing packages. Configuration may fail."
                ;;
        esac
    else
        echo "[✓] All required application packages are already installed."
    fi
}

# Check for exactly one valid argument
if [ "$#" -ne 1 ]; then
    show_usage
fi

ACTION=$1

case "$ACTION" in
    export)
        echo "=== STARTING EXPORT (CONFIGS ONLY) ==="
        mkdir -p "$BACKUP_DIR"

        # 1. Core MATE & Compiz via dconf
        echo "[*] Exporting MATE and Compiz dconf settings..."
        dconf dump /org/mate/ > "$BACKUP_DIR/mate_dconf.conf"
        dconf dump /org/compiz/ > "$BACKUP_DIR/compiz_dconf.conf"

        # 2. Asset Instructions Note
        if [ ! -f "$URL_FILE" ]; then
            echo "[!] No repo_urls.txt found. Creating a template at $URL_FILE"
            echo "THEMES_REPO=" >> "$URL_FILE"
            echo "ICONS_REPO=" >> "$URL_FILE"
            echo "FONTS_REPO=" >> "$URL_FILE"
            echo "--> Please fill out your Git URLs in $URL_FILE to automate asset tracking."
        fi

        # 3. Plank Dock
        echo "[*] Exporting Plank settings..."
        dconf dump /net/launchpad/plank/ > "$BACKUP_DIR/plank_dconf.conf"
        mkdir -p "$BACKUP_DIR/plank"
        cp -r ~/.config/plank "$BACKUP_DIR/plank/config" 2>/dev/null
        cp -r ~/.local/share/plank "$BACKUP_DIR/plank/share" 2>/dev/null

        # 4. Albert Launcher
        echo "[*] Exporting Albert launcher configs..."
        mkdir -p "$BACKUP_DIR/albert"
        cp -r ~/.config/albert "$BACKUP_DIR/albert/config" 2>/dev/null
        cp -r ~/.local/share/albert "$BACKUP_DIR/albert/share" 2>/dev/null

        # 5. Conky
        echo "[*] Exporting Conky configurations..."
        mkdir -p "$BACKUP_DIR/conky"
        cp -r ~/.config/conky "$BACKUP_DIR/conky/config" 2>/dev/null
        cp ~/.conkyrc "$BACKUP_DIR/conky/" 2>/dev/null

        # 6. Cairo-Clock
        echo "[*] Exporting Cairo-Clock settings..."
        mkdir -p "$BACKUP_DIR/cairo-clock"
        cp -r ~/.cairo-clock "$BACKUP_DIR/cairo-clock/" 2>/dev/null
        cp -r ~/.local/share/cairo-clock "$BACKUP_DIR/cairo-clock/share" 2>/dev/null

        echo "=== EXPORT COMPLETE ==="
        echo "Your backup folder size is now minimal! Assets will handle via Git."
        ;;

    import)
        if [ ! -d "$BACKUP_DIR" ]; then
            echo "Error: Backup directory $BACKUP_DIR does not exist!"
            exit 1
        fi

        echo "=== STARTING IMPORT (RESTORE) ==="

        # Run automatic package handling (ensures git is ready)
        check_and_install_packages

        # 1. Git Clone Assets (Themes, Icons, Fonts) if URLs exist
        mkdir -p ~/.themes ~/.icons ~/.local/share/fonts
        if [ -f "$URL_FILE" ]; then
            source "$URL_FILE"
            
            if [ -not -z "$THEMES_REPO" ]; then
                echo "[*] Cloning Themes via Git..."
                git clone "$THEMES_REPO" ~/.themes/temporary_git_dir && cp -r ~/.themes/temporary_git_dir/* ~/.themes/ && rm -rf ~/.themes/temporary_git_dir
            fi
            if [ -not -z "$ICONS_REPO" ]; then
                echo "[*] Cloning Icons via Git..."
                git clone "$ICONS_REPO" ~/.icons/temporary_git_dir && cp -r ~/.icons/temporary_git_dir/* ~/.icons/ && rm -rf ~/.icons/temporary_git_dir
            fi
            if [ -not -z "$FONTS_REPO" ]; then
                echo "[*] Cloning Fonts via Git..."
                git clone "$FONTS_REPO" ~/.local/share/fonts/temporary_git_dir && cp -r ~/.local/share/fonts/temporary_git_dir/* ~/.local/share/fonts/ && rm -rf ~/.local/share/fonts/temporary_git_dir
            fi
        else
            echo "[!] No repo_urls.txt found. Skipping Git asset download."
        fi

        # 2. Restore Application Config Directories
        echo "[*] Restoring application configuration files..."
        mkdir -p ~/.config ~/.local/share

        cp -r "$BACKUP_DIR/plank/config/"* ~/.config/plank/ 2>/dev/null
        cp -r "$BACKUP_DIR/plank/share/"* ~/.local/share/plank/ 2>/dev/null
        cp -r "$BACKUP_DIR/albert/config/"* ~/.config/albert/ 2>/dev/null
        cp -r "$BACKUP_DIR/albert/share/"* ~/.local/share/albert/ 2>/dev/null
        cp -r "$BACKUP_DIR/conky/config/"* ~/.config/conky/ 2>/dev/null
        cp "$BACKUP_DIR/conky/.conkyrc" ~/ 2>/dev/null
        cp -r "$BACKUP_DIR/cairo-clock/.cairo-clock/"* ~/.cairo-clock/ 2>/dev/null
        cp -r "$BACKUP_DIR/cairo-clock/share/"* ~/.local/share/cairo-clock/ 2>/dev/null

        # 3. Load Dconf Settings
        echo "[*] Loading dconf registries..."
        [ -f "$BACKUP_DIR/mate_dconf.conf" ] && dconf load /org/mate/ < "$BACKUP_DIR/mate_dconf.conf"
        [ -f "$BACKUP_DIR/compiz_dconf.conf" ] && dconf load /org/compiz/ < "$BACKUP_DIR/compiz_dconf.conf"
        [ -f "$BACKUP_DIR/plank_dconf.conf" ] && dconf load /net/launchpad/plank/ < "$BACKUP_DIR/plank_dconf.conf"

        # 4. Refresh DE
        echo "[*] Reloading MATE interface..."
        mate-panel --replace &> /dev/null &
        
        echo "=== IMPORT COMPLETE ==="
        ;;

    *)
        show_usage
        ;;
esac
