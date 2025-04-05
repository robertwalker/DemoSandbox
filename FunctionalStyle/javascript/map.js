function doubledMap(numbers) {
  console.log("\nFunctional style map transformation:");
  const array = numbers.map((n) => {
    return n * 2;
  });
  console.log("Doubles:", array);
}

//
// ----- Start of Script -----
//

const numbers = [1, 2, 3, 4, 5];
console.log("Numbers:", numbers);

doubledMap(numbers);
