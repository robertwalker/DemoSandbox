function doubledMapReduce(numbers) {
  console.log("\nFunctional style map/reduce:");
  const array = numbers.map((n) => {
    return n * 2;
  });
  console.log("Doubles:", array);
  const sum = array.reduce(
    (accumulator, currentValue) => accumulator + currentValue,
    0
  );
  console.log("Sum of double values:", sum);
}

function doubledMapReduceChain(numbers) {
  console.log("\nFunctional style map/reduce chaining:");
  const sum = numbers
    .map((n) => {
      return n * 2;
    })
    .reduce((accumulator, currentValue) => accumulator + currentValue, 0);
  console.log("Sum of double values:", sum);
}

//
// ----- Start of Script -----
//

const numbers = [1, 2, 3, 4, 5];
console.log("Numbers:", numbers);

doubledMapReduce(numbers);
doubledMapReduceChain(numbers);
