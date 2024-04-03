import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/controller/user_data_controller.dart';
import 'package:iitm_app/src/features/profile/widgets/profile_builder.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserDataController userDataController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(193, 241, 241, 241))),
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
          iconSize: 16,
        ),
        centerTitle: true,
        title:  Text(
          'profileTitle'.tr,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                size: 18,
              ))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Image.network(
                      "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Obx(() {
              userDataController.getUserDetails();
              String name = userDataController.userDetails[0].firstName!;
              String email = userDataController.userDetails[0].email!;
              return Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {},
                child:  Text(
                  'editiProfile'.tr,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              thickness: 0.5,
            ),
            const ProfileBuilder(),
          ],
        ),
      ),),
    );
  }
}
