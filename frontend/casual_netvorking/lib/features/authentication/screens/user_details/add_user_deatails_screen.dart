import 'package:casual_netvorking/features/authentication/screens/user_details/gender_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';

class AddUserDetailScreen extends StatelessWidget {
  const AddUserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColors.primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Add Profile Details'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              children: [
                const Text("Add Your Profile Details Here"),
                const SizedBox(
                  height: 20,
                ),
                //profile image
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //profile image
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: TColors.primaryColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: TColors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //name
                customTextFeild(TextEditingController(), 'Name'),
                const SizedBox(
                  height: 10,
                ),
                //email
                customTextFeild(TextEditingController(), 'Email'),
                const SizedBox(
                  height: 10,
                ),
                //age
                customTextFeild(TextEditingController(), 'Age'),
                const SizedBox(
                  height: 10,
                ),
                //phone
                customTextFeild(TextEditingController(), 'Phone'),
                const SizedBox(
                  height: 10,
                ),
                //address
                customTextFeild(TextEditingController(), 'Address'),
                const SizedBox(
                  height: 20,
                ),
                //submit button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.white,
                    ),
                    onPressed: () {
                      Get.to(const SelectGender());
                    },
                    child: const Text('Next',
                        style: TextStyle(color: TColors.green)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  TextFormField customTextFeild(
      TextEditingController controller, String hintText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: TColors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: TColors.white),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: TColors.green),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
