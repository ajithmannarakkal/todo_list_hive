import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todolist_hive/home/status_list_model.dart';
import 'package:todolist_hive/home/task_list_model.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var statusList = [StatusList(0, 'pending'), StatusList(1, 'completed')];
  StatusList? selecetdStatus;
  var taskList=[TaskListModel(title: 'Title1',description: 'hgjhgghsghj title 1',date: DateTime.now(), status: true),
    TaskListModel(title: 'Title2',description: 'hgjhgghsghj title 2',date: DateTime.now(), status: false),
    TaskListModel(title: 'Title3',description: 'hgjhgghsghj title 3',date: DateTime.now(), status: true),
    TaskListModel(title: 'Title4',description: 'hgjhgghsghj title 4',date: DateTime.now(), status: true),
    TaskListModel(title: 'Title5',description: 'hgjhgghsghj title 5',date: DateTime.now(), status: false)
  ];
}
