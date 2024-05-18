/* Task: Random Password Generator
Your goal is to create a Dart program that generates random passwords based on user preferences. Here's a breakdown:
User Input:

Ask the user how long they want the password to be (minimum 8 characters).
Ask the user if they want to include:
Lowercase letters (a-z)
Uppercase letters (A-Z)
Numbers (0-9)
Symbols (!@#$%^&* etc.) */

import 'dart:io';
import 'dart:math';


void main(List<String> args) {
  String isotKirjaimet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String pienetKirjaimet= isotKirjaimet.toLowerCase();
  String numerot = '0123456789';
  String symboolit = '-_=+-!';

  int salasananPituus;
  while (true) {
    print('Määritä salasanan haluttu pituus!(minimi 8) 15');
    salasananPituus = int.parse(stdin.readLineSync()!);

    if (8 <= salasananPituus && salasananPituus <= 15) {
      break;
    } else {
      print('Salasanan pituus tulee olla välill 8-15');
    }
  }
  
  bool sisaltyyIsotKirjaimet = getYesNoInput('Salasanaan sisältyy isot kirjaimet? (y/n): ');
  bool sisaltyyPienetKirjaimet = getYesNoInput('Salasanaan sisältyy pienet kirjaimet? (y/n): ');
  bool sisaltyyNumerot = getYesNoInput('Salasanaan sisältyy numerot? (y/n): ');
  bool sisaltyySymboolit = getYesNoInput('Salasanaan sisältyy symboolit? (y/n): ');

  String salasanaKirjaimet = '';
  if (sisaltyyIsotKirjaimet) salasanaKirjaimet += isotKirjaimet;
  if (sisaltyyPienetKirjaimet) salasanaKirjaimet += pienetKirjaimet;
  if (sisaltyyNumerot) salasanaKirjaimet += numerot;
  if (sisaltyySymboolit) salasanaKirjaimet += symboolit;

  String salasana = salasanaGenerointi(salasananPituus, salasanaKirjaimet);
  print('Tässä on salasanasi: $salasana');
}

  bool getYesNoInput(String kysymys){
    while (true) {
      print(kysymys);
      String syote = stdin.readLineSync()!.toLowerCase();
      if (syote == 'y' || syote == 'kyllä' ) {
        return true;
      } else if (syote == 'n' || syote == 'Ei' ) {
        return false;
      }
      print('Ei hyväksytty, kirjoita (y) tai (n) ');
    }
  }

  salasanaGenerointi(int salasananPituus, String salasanaKirjaimet) {
    final random= Random();
    String salasana = '';
    for (var i=0; i<salasananPituus; i++) {
      int randomIndeksi = random.nextInt(salasanaKirjaimet.length);
      salasana += salasanaKirjaimet[randomIndeksi];
    }
    return salasana;
  }
