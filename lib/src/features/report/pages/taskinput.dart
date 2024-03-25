import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/report/controller/report_controller.dart';

class TaskManagement extends StatefulWidget {
  const TaskManagement({super.key});

  @override
  State<TaskManagement> createState() => _TaskManagementState();
}

class _TaskManagementState extends State<TaskManagement> {
  final ReportController reportController = Get.find();
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskActivityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void clear() {
    taskActivityController.clear();
    taskTitleController.clear();
    descriptionController.clear();
    reportController.remaindMe.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            size: 25.sp,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Create a new task',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 8.w),
                child: Text(
                  'Task Title',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 50.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: TextField(
                    controller: taskTitleController,
                    decoration: const InputDecoration(
                        hintText: 'Write here', border: InputBorder.none),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 14.h, bottom: 8.h),
                child: Text(
                  'Task activity',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 50.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: TextField(
                    controller: taskActivityController,
                    decoration: const InputDecoration(
                        hintText: 'Write here', border: InputBorder.none),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    Text(
                      'Date',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 150.w),
                      child: Text(
                        'Time',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  children: [
                    Container(
                      height: 48.h,
                      width: 155.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.h, left: 5.w),
                            child: SizedBox(
                              height: 40.h,
                              width: 110.w,
                              child: const Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'date',
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 20.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Container(
                        height: 48.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2, left: 5),
                              child: SizedBox(
                                height: 40.h,
                                width: 98.w,
                                child: const Center(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'time',
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuButton<String>(
                              color: Colors.white,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              onSelected: (String item) {},
                              itemBuilder: (BuildContext context) => [
                                const PopupMenuItem(
                                  value: "",
                                  child: Text("AM"),
                                ),
                                const PopupMenuItem(
                                  value: "",
                                  child: Text("PM"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Container(
                  height: 50.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Remainder me daily',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Obx(() {
                        return Padding(
                          padding: EdgeInsets.only(left: 80.w),
                          child: Switch(
                            value: reportController.remaindMe.value,
                            activeColor: Colors.red,
                            thumbColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) => Colors.white,
                            ),
                            onChanged: (bool value) {
                              reportController.remaindMe.value = value;
                            },
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Description',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 100.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        hintText: 'Write here', border: InputBorder.none),
                  ),
                ),
              ),
              Obx(
                () {
                  return Padding(
                    padding: const EdgeInsets.only(top: 38),
                    child: GestureDetector(
                      onTap: () {
                        reportController.createNewTask(
                            taskTitleController.text,
                            taskActivityController.text,
                            "25-03-2024",
                            "10:18",
                            reportController.remaindMe.value,
                            descriptionController.text);
                        clear();
                      },
                      child: Container(
                        height: 55.h,
                        width: double.infinity.w,
                        decoration: BoxDecoration(
                          color: reportController.buttonColor.value,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Create',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
