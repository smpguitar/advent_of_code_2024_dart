import 'dart:io';

int compareIntegers(int a, int b) {
  int result = a - b;
  return result;
}

bool isPositive(int value) {
  if (value > 0) {
    return true;
  }
  return false;
}

bool doesItPass(int a, int b, bool isTrendingPositive) {
  int value = compareIntegers(a, b);

  if (value.abs() > 3 || value == 0) {
    return false;
  }
  if (isPositive(value) != isTrendingPositive) {
    return false;
  }

  return true;
}

List<List<int>> processList(List<List<int>> listInput) {
  List<List<int>> failed = [];
  for (int i = 0; i < listInput.length; i++) {
    if (processIndividualList(listInput[i]) == true) {
      print('its safe!');
    } else {
      failed.add(listInput[i]);
    }
  }
  return failed;
}

bool processIndividualList(List<int> list) {
  bool isTrendingPositive = true;
  bool isSafe = false;
  for (int j = 0; j < list.length - 1; j++) {
    int value = list[j] - list[j + 1];
    if (j == 0) {
      isTrendingPositive = isPositive(value);
      isSafe = true;
    }

    if (doesItPass(list[j], list[j + 1], isTrendingPositive) == false) {
      isSafe = false;
      break;
    }
  }

  return isSafe;
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

  List<List<int>> fails = processList(puzzleInput);
  answer = puzzleInput.length - fails.length;
  print('answer: $answer');
  print('fails: $fails');

  for (int i = 0; i < fails.length; i++) {
    List<int> list = fails[i];
    print('list: $list');
    for (int j = 0; j < list.length; j++) {
      int temp = list[j];
      list.removeAt(j);
      print('list: $list');
      if (processIndividualList(list) == true) {
        answer = answer + 1;
        break;
      }
      list.insert(j, temp);
    }
  }
  print('answer: $answer');
}
