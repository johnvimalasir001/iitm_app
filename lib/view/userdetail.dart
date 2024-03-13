import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iitm_app/auth/otppage.dart';
import 'package:iitm_app/view/userdetails_builder.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OTPPage(),
                ));
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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 18.h,
              ),
              const UserDetailsBuilder(),
              Text(
                'Crop Name',
                style: TextStyle(fontSize: 20.sp),
              ),
              ExpansionTile(
                initiallyExpanded: true,
                shape: Border.all(color: Colors.transparent),
                backgroundColor: const Color.fromRGBO(255, 251, 255, 1),
                // leading: Image.asset(
                //   'assets/image/plant-removebg-preview.png',
                //   color: Colors.blue,
                // ),
                title: Text(
                  "Crop name",
                  style: TextStyle(fontSize: 17.sp, color: Colors.black54),
                ),
                children: const [
                  ListTile(
                    title: Text('in Acre'),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8.h,
                ),
                child: Text(
                  'Land Details',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: SizedBox(
                      height: 70.h,
                      width: 190.w,
                      child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            hintText: 'land size',
                            prefixIcon: const Icon(
                              Icons.landscape,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w),
                    child: Row(
                      children: [
                        Text(
                          'Acre',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
