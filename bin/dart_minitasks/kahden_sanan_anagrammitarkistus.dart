// Anagram checker
import 'dart:io';

void main(List<String> args) {
  print('kirjoita sana');
  String sanaA=stdin.readLineSync()!.toLowerCase();
  print('kirjoita sana');
  String sanaB=stdin.readLineSync()!.toLowerCase();

  if (isAnagrammi(sanaA, sanaB)) {
    print('Sanat $sanaA ja $sanaB ovat anagrammeja');
  } else {
    print('Sanat $sanaA ja $sanaB eivät ole anagrammeja');
  }
}

bool isAnagrammi(String sanaA, String sanaB) {
List<String> lista1 = sanaA.toLowerCase().replaceAll(RegExp(r'\s+'), ' ').split('');
List<String> lista2 = sanaB.toLowerCase().replaceAll(RegExp(r'\s+'), ' ').split('');

lista1.sort();
lista2.sort();

return lista1.join() == lista2.join();
}

/*
main() {
  print('kirjoita sana');
  String sanaA=stdin.readLineSync()!.toLowerCase();
  print('kirjoita sana');
  String sanaB=stdin.readLineSync()!.toLowerCase();

  List aakkosetA=sanaA.split('');
  List aakkosetB=sanaB.split('');

  aakkosetA.sort();
  aakkosetB.sort();

  String aakosSanaA = aakkosetA.join('');
  String aakosSanaB = aakkosetB.join('');

  if (aakosSanaA == aakosSanaB) {
    print('Sanat ovat anagrammeja');
  } else {
    print('Eivät ole!');
  }
}
*/
