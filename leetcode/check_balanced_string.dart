// You are given a string num consisting of only digits.
// A string of digits is called balanced if the sum of the digits at even indices is equal to the sum of digits at odd indices.
//
// Return true if num is balanced, otherwise return false.
//
//
//
// Example 1:
//
// Input: num = "1234"
//
// Output: false
//
// Explanation:
//
// The sum of digits at even indices is 1 + 3 == 4, and the sum of digits at odd indices is 2 + 4 == 6.
// Since 4 is not equal to 6, num is not balanced.

bool isBalanced(String numbers) {
  int evenSum = 0;
  int oddSum = 0;
  for (var i = 0; i < numbers.length; i++) {
    if (i.isOdd) {
      oddSum += int.parse(numbers[i]);
    } else if (i.isEven) {
      evenSum += int.parse(numbers[i]);
    }
  }
  return evenSum == oddSum;
}
void main(){
  print(isBalanced("3234"));
}