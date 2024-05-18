/*Simple Calculator

Create a program that functions as a basic calculator.
Allow the user to enter two numbers.
Provide a menu with options for addition, subtraction, multiplication, and division.
Based on the user's choice, perform the corresponding operation on the entered numbers and display the result.
Use error handling to catch invalid user input (non-numeric values or invalid choices).
*/

import 'dart:io';

void main(List<String> args) {
  double numberA, numberB, result =0;
 
  //input incapsulation
  double getInput(String syote) {
    while (true) {
      try {
        print(syote);
        return double.parse(stdin.readLineSync()!);
      } on FormatException {
        print('Invalid input! Please enter a number');
      }
    }
  }

  //Using incapsulated function getInput function to get numbers
  numberA = getInput('Enter the first number: ');
  numberB = getInput('Enter the second number: ');
  
  int choice = 0;
  do {
    print('------------MENU------------');
    print('Press 1 if you want to Add');
    print('Press 2 if you want to Subtract');
    print('Press 3 if you want to Multiply');
    print('Press 4 if you want to Divide');

    try {
      print('Enter your choice (1-4): ');
      choice = int.parse(stdin.readLineSync()!);
    } on FormatException {
      print('Invalid Inpu!t');
    }
  } while (choice < 1 || choice > 4);
  switch (choice) {
    case 1:
    result = numberA + numberB;
    break;
    case 2:
    result = numberA - numberB;
    break;
    case 3:
    result = numberA * numberB;
    break;
    case 4:
    if (numberB == 0) {
      print('Nollalla ei voi jakaa!!!');
      return;
    } else {
      result = numberA / numberB;
    }
    break;
  }
  print('The result is: $result');
}

