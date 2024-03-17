import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iitm_app/application_page/application_page.dart';
import 'package:iitm_app/auth/widgets/expansion.dart';
import 'package:iitm_app/auth/widgets/userdetails_builder.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserDetailsBuilder(),
              Text(
                'Crop Name',
                style: TextStyle(fontSize: 20.sp),
              ),
              ExpansionTile(
                initiallyExpanded: false,
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
                    title: Text('Paddy'),
                  ),
                  ListTile(
                    title: Text('Wheet'),
                  ),
                  ListTile(
                    title: Text('Chick peas'),
                  ),
                  ListTile(
                    title: Text('Kidney '),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  const MyDropdown()
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ApplicationPage(),
                        ));
                  },
                  child: Container(
                    height: 52.h,
                    width: double.infinity.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
