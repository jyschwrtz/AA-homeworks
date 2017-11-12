function fizzBuzz(array) {
  var new_array = []
  for (i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 && array[i] % 5 === 0 ) {
      continue
    }
    else if (array[i] % 3 === 0 || array[i] % 5 === 0) {
      new_array.push(array[i])
    }
  }
  console.log(new_array)
}

// fizzBuzz([1,2,3,4,5,6,7,8,9,10,15])


function isPrime(number) {

  for (i = 2; i < number; i++) {
    if (number % i === 0) {
      return false
    }
  }
  return true
}

// console.log(isPrime(2))
// console.log(isPrime(10))
// console.log(isPrime(15485863))
// console.log(isPrime(3548563))


function firstNPrimes(number) {
  let arr = [];
  let i = 2;
  while (arr.length < number) {
    if ( isPrime(i) ) {
      arr.push(i);
      // console.log(i);
    }
    i++;
  }
  return arr;
}

console.log(firstNPrimes(5))


function sumOfNPrimes(number) {
  let sum = 0;
  arr = firstNPrimes(number);
  for (i = 0; i < arr.length; i++) {
    sum += arr[i];
  }
  return sum
}
console.log(sumOfNPrimes(4))
