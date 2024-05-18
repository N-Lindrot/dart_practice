import 'dart:io';

void main(List<String> args) {
  int age;
  String? name;

  print('What is your name?');
  name = stdin.readLineSync();

  while (true) {
    try{
      print('Enter your age');
      age = int.parse(stdin.readLineSync()!);
      break;
      } on FormatException {
        print('Invalid age! Please enter a number.');
    }
  }

  if (age >= 18) {
    print('$name is adult');
  } else {
    print('$name is not adult');
  }

}