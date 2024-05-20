void main(List<String> args) {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];

  List<int> evenNumber = numbers.where((number) => number % 2 == 0 ).toList();
  List<int> devideBy3 = numbers.where((number) => number % 3 == 0).toList();

  print('Even numbers are: $evenNumber');
  print('The following can be devided by 3 : $devideBy3');
}