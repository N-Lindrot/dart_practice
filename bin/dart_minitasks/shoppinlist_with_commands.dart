
import 'dart:io';
void main(List<String> args) {
  while (true) {
  //commands
  print('----------Commands----------');
  print('1: Add item to the list');
  print('2: View the list');
  print('3: Remove items from the list');
  print('4: Mark task as Done');
  print('5: Clear the list');
  print('6: Exit program');

  String? input = stdin.readLineSync();
  if (input == null || int.tryParse(input) == null || int.parse(input) < 1 || int.parse(input) > 6) {
    print('Please only enter a number between (1-5)');
    continue;
  }

  int syote = int.parse(input);

    if (syote == 1) {
      addItem();
    }
    if (syote == 2) {
      viewList();
      
    }
    if (syote == 3) {
      removeItem();
      
    }
    if (syote == 4) {
      onTehty();

    }
    if (syote == 5) {
      clearList();
    }
    if (syote == 6) {
      break;
    }
  }
}

Map<String, bool> items = {'task1': true, 'task2': false, 'task3': true}; // with placeholder value

addItem() {
  print('Enter the item name.');
  String itemName = stdin.readLineSync()!;
  items[itemName]=false;
}

viewList() {
  var listItems= [];
  listItems.addAll(items.keys); //itemia määritetään avaimeksi items.keys

  var statusItems = [];
  statusItems.addAll(items.values); // statusta määritetään arvoksi items.values

  for (var i=0; i< listItems.length; i++) {
    var tuote = listItems[i];

    var status = statusItems[i];

    String merkki;

    if (status == true) {
    merkki = '[X]';
    } else {
    merkki = '[ ]';
    }
    if (listItems.isEmpty) {
      print('There are no items on the list');
    } else {
    print('$tuote: $merkki');
    }
  }
}

removeItem() {
  print('Enter items to be removed');
  String itemName = stdin.readLineSync()!;
  items.remove(itemName);
  viewList();
}

onTehty() {
  print('Enter item name to be market as Done');
  String itemName = stdin.readLineSync()!;

  if (items.containsKey(itemName)) {
  items[itemName] = true;
  print('$itemName: on tehty');
  } else {
    print('Item not found.');
  }
}

clearList() {
  items.clear();
  print('Item list is cleared');
}
