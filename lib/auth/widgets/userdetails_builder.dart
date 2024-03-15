import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iitm_app/auth/widgets/userdetails_component.dart';

class UserDetailsBuilder extends StatefulWidget {
  const UserDetailsBuilder({super.key});

  @override
  State<UserDetailsBuilder> createState() => _UserDetailsBuilderState();
}

class _UserDetailsBuilderState extends State<UserDetailsBuilder> {
  final List<String> name = [
    'Full Name',
    'Email(opt)',
  ];

  final List<IconData> icons = [
    Icons.person,
    Icons.email,
  ];

  final List hintText = ['Your name', 'phone Number'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return UserdetailsComponent(
              names: name[index],
              icons: icons[index],
              hintText: hintText[index]);
        },
      ),
    );
  }
}
