import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/controller/user_details_controller.dart';
import 'package:iitm_app/src/features/auth/widgets/custom_button.dart';
import 'package:iitm_app/src/features/auth/widgets/custom_textfield.dart';
import 'package:iitm_app/src/features/auth/widgets/custom_title.dart';
import 'package:iitm_app/src/features/auth/widgets/expansion.dart';
import 'package:iitm_app/src/features/auth/widgets/landsize_custom_textfield.dart';
import 'package:iitm_app/src/features/auth/widgets/user_location_container.dart';
import 'package:iitm_app/src/features/map/controller/user_location_controller.dart';

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
          'User Details',
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
                  fieldName: "First Name",
                  controller: firstNameController,
                  icon: const Icon(
                    Icons.person,
                  ),
                ),
                CustomTextField(
                  fieldName: "Last Name",
                  controller: lastNameController,
                  icon: const Icon(
                    Icons.person,
                  ),
                ),
                CustomTextField(
                  fieldName: "Email Address",
                  controller: emailController,
                  icon: const Icon(
                    Icons.email,
                  ),
                ),
                const CustomTitle(title: "Crop Name"),
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
                                  .updateCropSelectedUnit('Paddy');
                            },
                            title: const Text('Paddy'),
                          ),
                          ListTile(
                            onTap: () {
                              userDetailsController
                                  .updateCropSelectedUnit('Wheet');
                            },
                            title: const Text('Wheet'),
                          ),
                          ListTile(
                            onTap: () {
                              userDetailsController
                                  .updateCropSelectedUnit('Chick peas');
                            },
                            title: const Text('Chick peas'),
                          ),
                          ListTile(
                            onTap: () {
                              userDetailsController
                                  .updateCropSelectedUnit('Kidney beans');
                            },
                            title: const Text('Kidney beans'),
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
                          fieldName: "Land Details",
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
                  String address = locationController.address.value;
                  double lat = locationController.latitude.value;
                  double lon = locationController.longitude.value;
                  return Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: CustomElevatedButton(
                      fieldName: "Submit",
                      onPressed: () {
                        userDetailsController.createUserDocument(
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
