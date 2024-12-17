import 'dart:io';
import 'dart:core';

List<List<int>> parseMulExpressions(String input) {
  final regExp = RegExp(r'mul\((\d{1,3}),(\d{1,3})\)');
  final matches = regExp.allMatches(input);

  return matches.map((match) {
    final int1 = int.parse(match.group(1)!);
    final int2 = int.parse(match.group(2)!);
    return [int1, int2];
  }).toList();
}

solveDay1() {
  int answer = 0;
  String text = File(
          '/Users/stephenparks/Development/advent_of_code_2024_dart/advent_of_code_2024/lib/day_three/day_3.txt')
      .readAsStringSync();

  final result = parseMulExpressions(text);

  print('result: $result');

  for (var pairs in result) {
    int value = pairs[0] * pairs[1];
    answer = answer + value;
  }
  print('answer: $answer');
}
