function sortNumbers(numbers: number[]): number[] {
    const sorted = [...numbers];
    for (let i = 0; i < sorted.length; i++) {
        console.log(`Current iteration BOX: ${i}`);
        for (let j = i + 1; j < sorted.length; j++) {
            console.log(`Sorting for ${sorted[i]} and ${sorted[j]}`);
            if (sorted[i] > sorted[j]) {
                [sorted[i], sorted[j]] = [sorted[j], sorted[i]];
            }
        }
    }
    return sorted;
}

const numbers = [42, 15, 8, 23, 1, 99];
console.log("Sorted numbers:", sortNumbers(numbers));