// this program asks name, gender and age
// using those info, it prints one of the 2 String texts

import 'dart:io';

void main(List<String> args) {
  int age;
  String? name;
  String? gender;

  print('What is your name?');
  name = stdin.readLineSync();

  while (true) {
    try {
      print('What is your gender?');
      gender = stdin.readLineSync();
        if (gender?.toLowerCase() == 'female' || gender?.toLowerCase() == 'male') {
          break;
        }
        print('Please enter female or male.');
      }on FormatException {
        print('Please enter female or male.');
    }
  }
 

  while (true) {
    try{
      print('Enter your age');
      age = int.parse(stdin.readLineSync()!);
      break;
      } on FormatException {
        print('Invalid age! Please enter a number.');
    }
  }

  String? pronoun;
  if (gender?.toLowerCase() == 'female') {
    pronoun = 'she';
  } else if (gender?.toLowerCase() =='male'){
    pronoun = 'he';
  }

  if (age >= 18) {
    print('$name is $age old and $pronoun is adult');
  } else {
    print('$name is not adult, now hands of $name');
  }
}