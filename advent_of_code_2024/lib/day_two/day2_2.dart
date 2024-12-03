import 'dart:io';

int compareIntegers(int a, int b) {
  int result = a - b;
  print('a: $a, b: $b, result: $result');
  return result;
}

bool isPositive(int value) {
  if (value > 0) {
    print('is positive: True');
    return true;
  }
  print('is positive: False');
  return false;
}

solveDay1() {
  String text = File(
          '/Users/stephenparks/Development/advent_of_code_2024_dart/advent_of_code_2024/lib/day_two/day_2.txt')
      .readAsStringSync();

  List<List<int>> puzzleInput = text
      .split(RegExp(r'\r?\n')) // Split by line breaks (\n or \r\n)
      .map((line) => line
          .split(RegExp(r'\s+')) // Split by spaces (including multiple spaces)
          .map(int.parse) // Convert each string to an integer
          .toList()) // Convert iterable to list
      .toList();

  int answer = 0;

  print(puzzleInput);

  for (int i = 0; i < puzzleInput.length; i++) {
    bool isSafe = true;
    bool isTrendingPositive = true;
    print('i: ${puzzleInput[i]}');
    for (int j = 0; j < puzzleInput[i].length - 1; j++) {
      int value = compareIntegers(puzzleInput[i][j], (puzzleInput[i][j + 1]));
      if (value.abs() == 0) {
        isSafe = false;
        break;
      }
      if (j == 0) {
        isSafe = true;
        isTrendingPositive = isPositive(value);
      }
      if (isSafe == true &&
          value.abs() > 0 &&
          value.abs() <= 3 &&
          isPositive(value) == isTrendingPositive) {
        continue;
      } else {
        isSafe = false;
        print(
            'setting isSafe to false. value: $value, isPositive: ${isTrendingPositive}, isPositive: ${isPositive(value)}');
        break;
      }
    }
    if (isSafe == true) {
      answer = answer + 1;
      print('adding 1 to answer');
    }
  }
  print('answer: $answer');
}
