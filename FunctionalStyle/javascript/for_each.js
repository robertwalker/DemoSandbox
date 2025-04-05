function doubledFor(numbers) {
  console.log("\nTraditional C style for loop:");
  let array = [];
  for (i = 0; i < numbers.length; i++) {
    array.push(numbers[i] * 2);
  }
  console.log("Doubles:", array);
}

function doubledForIn(numbers) {
  console.log("\nA for...in style loop:");
  let array = [];
  for (number of numbers) {
    array.push(number * 2);
  }
  console.log("Doubles:", array);
}

function doubledForEach(numbers) {
  console.log("\nFunctional style forEach function:");
  let array = [];
  numbers.forEach((n) => {
    array.push(n * 2);
  });
  console.log("Doubles:", array);
}

function doubledForEachMutating(numbers) {
  console.log("\nFunctional style forEach mutating function:");
  numbers.forEach((n, index, array) => {
    array[index] = n * 2;
  });
  console.log("Doubles:", numbers);
}

//
// ----- Start of Script -----
//

const numbers = [1, 2, 3, 4, 5];
console.log("Numbers:", numbers);

doubledFor(numbers);
doubledForIn(numbers);
doubledForEach(numbers);
doubledForEachMutating(numbers);
doubledForEach(numbers);
