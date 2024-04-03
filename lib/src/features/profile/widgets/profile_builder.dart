import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/profile/widgets/profile_component.dart';

class ProfileBuilder extends StatefulWidget {
  const ProfileBuilder({super.key});

  @override
  State<ProfileBuilder> createState() => _ProfileBuilderState();
}

class _ProfileBuilderState extends State<ProfileBuilder> {
  final List profilecomponentname = [
    'அமைப்புகள்',
    'பயனர் மேலாண்மை',
    'தெரிவிப்பு',
    'logout'.tr
  ];


  final List profilecomponenticon = [
    Icons.settings,
    Icons.folder_shared,
    Icons.error,
    Icons.arrow_forward,
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: profilecomponentname.length,
        itemBuilder: (context, index) {
          return ProfileComponent(
            icons: profilecomponenticon[index],
            componentname: profilecomponentname[index],
          );
        },
      ),
    );
  }
}
