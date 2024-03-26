import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/application_page/pages/application_page.dart';
import 'package:iitm_app/src/features/auth/controller/user_details_controller.dart';

import 'package:iitm_app/src/features/auth/presentation/widgets/custom_button.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_title.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/expansion.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/landsize_custom_textfield.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/user_location_container.dart';
import 'package:iitm_app/src/features/auth/controller/user_location_controller.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final LocationController locationController = LocationController();
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController landSizeController = TextEditingController();

  final TextEditingController userLocationController = TextEditingController();

  void texfieldClear() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    landSizeController.clear();
    userLocationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final UserDetailsController userDetailsController = Get.put(
      UserDetailsController(),
    );

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 25.sp,
          ),
        ),
        centerTitle: true,
        title: Text(
          'பாவனையாளர் விபரங்கள்',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  fieldName: "முதல் பெயர்",
                  controller: firstNameController,
                  icon: const Icon(
                    Icons.person,
                  ),
                ),
                CustomTextField(
                  fieldName: "கடைசி பெயர்",
                  controller: lastNameController,
                  icon: const Icon(
                    Icons.person,
                  ),
                ),
                CustomTextField(
                  fieldName: "மின்னஞ்சல் முகவரி",
                  controller: emailController,
                  icon: const Icon(
                    Icons.email,
                  ),
                ),
                const CustomTitle(title: "பயிர் பெயர்"),
                Padding(
                  padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Theme(
                      data: ThemeData(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        initiallyExpanded: false,
                        title: GetBuilder<UserDetailsController>(
                          builder: (value) {
                            return Text(value.cropSelectedName);
                          },
                        ),
                        children: [
                          ListTile(
                            onTap: () {
                              userDetailsController
                                  .updateCropSelectedUnit('நெற்பயிர்');
                            },
                            title: const Text('நெற்பயிர்'),
                          ),
                          ListTile(
                            onTap: () {
                              userDetailsController
                                  .updateCropSelectedUnit('கோதுமை');
                            },
                            title: const Text('கோதுமை'),
                          ),
                          ListTile(
                            onTap: () {
                              userDetailsController
                                  .updateCropSelectedUnit(' பட்டாணி');
                            },
                            title: const Text(' பட்டாணி'),
                          ),
                          ListTile(
                            onTap: () {
                              userDetailsController
                                  .updateCropSelectedUnit('சிறுநீரக பீன்ஸ்');
                            },
                            title: const Text('சிறுநீரக பீன்ஸ்'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: SizedBox(
                        width: 190.w,
                        child: LandsizeCustomTextField(
                          controller: landSizeController,
                          fieldName: "நில விவரங்கள்",
                          icon: const Icon(
                            Icons.landscape,
                          ),
                        ),
                      ),
                    ),
                    MyDropdown(),
                  ],
                ),
                const UserLocationContainer(),

                // const CustomTitle(title: "User Location"),
                // SizedBox(
                //   height: 5.h,
                // ),
                // CustomTextField(
                //   fieldName: "User Location",
                //   controller: userLocationController,
                //   icon: const Icon(
                //     Icons.location_on,
                //   ),
                // ),

                Obx(() {
                  locationController.getCurrentLocation();
                  String address = locationController.address.value;
                  double lat = locationController.latitude.value;
                  double lon = locationController.longitude.value;
                  return Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: CustomElevatedButton(
                      fieldName: "சமர்ப்பிக்க",
                      onPressed: () async {
                       
                        
                        await userDetailsController.createUserDocument(
                          firstNameController.text,
                          lastNameController.text,
                          emailController.text,
                          userDetailsController.cropSelectedName,
                          landSizeController.text,
                          userDetailsController.selectedUnit,
                          address,
                          lat,
                          lon,
                        );

                        texfieldClear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ApplicationPage()));
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
