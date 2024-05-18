
import 'dart:ffi';
import 'dart:io';

void main(List<String> args) {
  while (true) {
    print('----------To-Do List----------');
    print('1: Add task');
    print('2: View tasks');
    print('3: Remove task');
    print('4: Mark task as done');
    print('5: Exit');

    print('Enter your choice: ');
    String? input = stdin.readLineSync();
    if (input == null || int.tryParse(input) == null || int.parse(input) < 1 || int.parse(input) > 6) {
      print('Please only enter a number between (1-5)');
      continue;
    }
    int syote = int.parse(input);

    if (syote == 1) {
      addTask();
    }
    if (syote == 2) {
      viewTask();
      
    }
    if (syote == 3) {
      removeTask();
      
    }
    if (syote == 4) {
      markTaskDone();

    }
    if (syote == 5) {
      break;
    }
  }
}

Map<String, bool> tasks ={};

addTask(){
  var tasks = {};
  print('Add the task');
  var syote=stdin.readLineSync();
  tasks[syote]=false;
  return tasks;
}

viewTask(){
  var taskList = [];
  taskList.addAll(tasks.keys);

  var statusList = [];
  statusList.addAll(tasks.values);

  for (var i=0;i<tasks.length; i++) {
    var task = taskList[i];
    var status = statusList[i];
    if (status == true) {
      status = '[X]'
    }
    print(task: status)
  }
}

removeTask() {

}

markTaskDone() {

}
