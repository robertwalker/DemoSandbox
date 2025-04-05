function oddNumbers(numbers) {
  console.log("\nFunctional style filter on numbers:");
  const array = numbers.filter((n) => {
    return n % 2 > 0;
  });
  console.log("Odd numbers:", array);
}

function namesStartingWithJ(names) {
  console.log("\nFunctional style filter on strings:");
  const array = names.filter((n) => {
    return n.startsWith("J");
  });
  console.log('Names starting with "J":', array);
}

//
// ----- Start of Script -----
//

const numbers = [1, 2, 3, 4, 5];
const names = ["Jack Reacher", "Ethan Hunt", "John Wick", "John Patrick Ryan"];
console.log("Numbers:", numbers);
console.log("Names:", names);

oddNumbers(numbers);
namesStartingWithJ(names);
