void main(List<String> args) {
  String teksti = 'A map or dictionary where the keys are unique characters in the string, and the values are their counts';
  String pienetTeksti = teksti.toLowerCase();
  pienetTeksti;

  var sanaMaara = {}; // sanamäärä sanakirja/Map key-value parin luonti
  var maara = 0; // määrä alkaa nollasta
  for (var i = 0; i < pienetTeksti.length;i++) {
    String kirjain = pienetTeksti[i]; //Kirjaimet esiin yksitelleenn inxeksi i avulla
    if (kirjain.isNotEmpty) {
      if (sanaMaara.containsKey(kirjain)) { // jos sanakirjassa esiintyy kirjain
        maara = sanaMaara[kirjain];// kirjaimen arvo maara = kirjain Key value
        maara++;  // arvo suurenee 1:lla
        sanaMaara[kirjain]=maara; // sanakirja[key]=value(kappalemäärä)
      } else {
        maara = 1; // tai kappalemäärä on ykkönen
        sanaMaara[kirjain] = maara;
      }
    }
  }
  sanaMaara.forEach((sana, maara) { // sanakirjasta jokaista keyvalue sanaa kohti maara arvo
    print('$sana: $maara'); // tulostus keyvalue ja arvo
  });  
}