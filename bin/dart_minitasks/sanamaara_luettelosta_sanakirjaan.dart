/*
Write a Dart program that takes a string of text as input 
and outputs a list of the unique words in that text along with how many times each word appears.
*/


main() {

  String teksti = "This is a test. A test of the emergency broadcast system. This is only a test.";
  List<String> sanat=teksti.toLowerCase().split(RegExp(r"\W+"));

  Map<String, int> sanaMaara = {};
  for (var sana in sanat) {
    if (sana.isNotEmpty) {
      sanaMaara[sana] = (sanaMaara[sana]?? 0) +1;
    }
    sanaMaara.forEach((sana, maara) {
    print('$sana: $maara');
    });
  }
}
