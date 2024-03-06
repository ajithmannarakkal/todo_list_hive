import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todolist_hive/home/home_controller.dart';

import '../text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: const Icon(
          Icons.grid_view_outlined,
          color: Colors.blueAccent,
        ),
        title: const Text(
          'All Tasks',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: HomeController.to.taskList.length,
          itemBuilder: (BuildContext context, index) {
            var tasks = HomeController.to.taskList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Card(
                child: ListTile(
                  leading: Checkbox(
                    value: tasks.status,
                    onChanged: (bool? value) {
                      tasks.status = !tasks.status;
                    },
                  ),
                  title:
                      Text(tasks.title, style: const TextStyle(fontSize: 14)),
                  subtitle: Text(tasks.description ?? '',
                      style: const TextStyle(fontSize: 12)),
                  trailing: Text(
                    DateFormat.yMd().add_jm().format(tasks.date),
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: InkWell(
          onTap: () {
            Get.bottomSheet(
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      CustomTextFormField(
                        controller: HomeController.to.titleController,
                        label: 'Titlle',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        controller: HomeController.to.descriptionController,
                        label: 'Description',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: HomeController.to.dateController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Date is required';
                          }
                          return null;
                        },
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          floatingLabelStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.grey),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Icon(Icons.calendar_month),
                          ),
                          labelText: 'Date *',
                          hintText: 'Choose Date',
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.grey),
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.grey),
                          border: const OutlineInputBorder(),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1920),
                            lastDate: DateTime.now(),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: Colors.blueAccent,
                                    onPrimary: Colors.white,
                                    onSurface: Colors.black,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          var dateToSend =
                              DateFormat("dd-MM-yyyy").format(newDate!);
                          HomeController.to.dateController.text = dateToSend;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('CANCEL'))),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('ADD')))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          child: const CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 35,
              child: Icon(
                color: Colors.white,
                Icons.add,
                size: 55,
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
