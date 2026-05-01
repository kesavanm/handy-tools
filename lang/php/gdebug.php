<?php

#@file gdebug.php 
/**
 * Print out the variable and the backtrace info with line numbers.
 * Call this from the browser to see the debug message: document.cookie="gdebug=1";
 * Works on comand line
 * @param  mixed $var  Objects, String, Arrays
 * @return string      Returns HTML or command line output.
 */
function gdebug($var) {
        if(!isset($_COOKIE['gdebug']) &&  PHP_SAPI != 'cli') return false;
  $bt = debug_backtrace();  // to backtrace where this command from
  foreach ($bt as $e_debug) {
      $debug_path[] = $e_debug['file'] . ' line ' . $e_debug['line']."<br>";
  }

  $backtrace_info = '   <div class="debug_backtrace" style="font-size:10pt;color:#ff0">
                        <noBR>DEBUG ON <br>' . implode(' &lt ', $debug_path) . '</noBR>
                        </div>';
  if (is_array($var) || is_object($var)) {
      $var = print_r($var, true);
  }
  if(PHP_SAPI=='cli'){
        echo "\n\033[0;36mDEBUG ON: " . implode(' < ', $debug_path) ."\033[0m" ."\n";
        echo $var .PHP_EOL . PHP_EOL;
  }else{
                echo '<div class="debug" style="background:#000;line-height:1.2em;color:#0f0;font-size:8pt;max-height:250px;overflow-y:scroll;text-align:left">' . $backtrace_info . '<pre>' . $var . '</pre></div>' . "\n" ;
        }

}

?>
