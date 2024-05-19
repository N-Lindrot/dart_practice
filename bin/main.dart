import 'dart:html';

main() {
  querySelector('#Hip!').onClick.listen(muuta);
  querySelector('#Hei!').onClick.listen(muuta);
}

muuta(e) {
  var elementti = querySelector('#Hip!');
    elementti.text = 'Hip!';
}

pienenna(e) {
  var elementti = querySelector('#luku');
  var luku = int.parse(elementti.text);
  luku = luku - 1;
  elementti.text = '$luku';
}


<button id='laskuri-nappi'>0</button>
main.dart
/*
import 'dart:html';

main() {
  var laskuri = querySelector('#laskuri-nappi');
  laskuri.onClick.listen(kasvata);
}

kasvata(e) {
  var nappi = querySelector('#laskuri-nappi');
  var arvo = int.parse(nappi.text);
  arvo = arvo + 1;
  if (arvo > 3) {
    arvo = 0;
  }

  nappi.text = '$arvo';
}
*/