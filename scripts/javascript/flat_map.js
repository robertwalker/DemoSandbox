function doubledFlatMap(numbers) {
  console.log("\nFunctional style flatMap transformation:");
  const array = numbers.flatMap((n) => n).map((n) => n * 2);
  console.log("Doubles flattened:", array);
}

//
// ----- Start of Script -----
//

const numbers = [[1], [2, 3], [4, 5, 6], [7, 8, 9, 10]];
console.log("Number groups:", numbers);

doubledFlatMap(numbers);
