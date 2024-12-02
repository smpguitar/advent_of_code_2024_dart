import 'dart:io';

solveDay1() {
  String text = File(
          '/Users/stephenparks/Development/advent_of_code_2024_dart/advent_of_code_2024/lib/day_one/day_1_test.txt')
      .readAsStringSync();

  List<String> puzzleInput = text.trim().split('');

  print(puzzleInput);
}
