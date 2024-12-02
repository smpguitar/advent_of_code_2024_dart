import 'dart:io';

List<int> sortList(List<int> list) {
  list.sort((a, b) => a.compareTo(b));
  return list;
}

solveDay1() {
  RegExp regExp = RegExp(r'\S+');
  String text = File(
          '/Users/stephenparks/Development/advent_of_code_2024_dart/advent_of_code_2024/lib/day_one/day_1.txt')
      .readAsStringSync();

  List<String> puzzleInput =
      regExp.allMatches(text).map((match) => match.group(0)!).toList();

  print(puzzleInput);

  List<int> left = [];
  List<int> right = [];
  List<int> answer = [];

  int finalAnswer = 0;

  for (int i = 0; i < puzzleInput.length; i++) {
    print('i: $i');
    if (i.isEven) {
      left.add(int.parse(puzzleInput[i]));
      print('left: $left');
    }
    if (i.isOdd) {
      right.add(int.parse(puzzleInput[i]));
      print('right: $right');
    }
  }

  left = sortList(left);
  right = sortList(right);

  if (left.length != right.length) {
    print('Error: Left list length != Right list length');
  }

  print('left: $left, right: $right');
  if (left.length == right.length) {
    for (int i = 0; i < left.length; i++) {
      int match = 0;
      print('i: $i');
      for (int j = 0; j < right.length; j++) {
        if (left[i] == right[j]) {
          match = match + 1;
        }
      }
      answer.add(left[i] * match);
    }
  }

  for (int item in answer) {
    finalAnswer = finalAnswer + item;
  }

  print('answer: $answer');
  print('final answer: $finalAnswer');
}
