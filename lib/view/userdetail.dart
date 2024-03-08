import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iitm_app/view/otppage.dart';
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
          child: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'User Details',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 18,
              ),
              UserDetailsBuilder(),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8),
                child: Text(
                  'Crop Name',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ExpansionTile(
                backgroundColor: Color.fromRGBO(255, 251, 255, 1),
                // leading: Image.asset(
                //   'assets/image/plant-removebg-preview.png',
                //   color: Colors.blue,
                // ),
                title: Text(
                  "Crop name",
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                ),
                children: [
                  ListTile(
                    title: Text('in Acre'),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8),
                child: Text(
                  'Land Details',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: SizedBox(
                      height: 70,
                      width: 190,
                      child: TextField(
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            hintText: 'land size',
                            prefixIcon: Icon(
                              Icons.landscape,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 65),
                    child: Row(
                      children: [
                        Text(
                          'Acre',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
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
