
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';

class AddProfileDetailPage extends StatelessWidget {
  const AddProfileDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColors.primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Add Profile Details'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          color: Colors.white,
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
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
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
                  const Text(
                    "Bio*",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLines: 3,
                    maxLength: 100,
                    decoration: const InputDecoration(
                      labelText: "Bio",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Your Conversation Starter*",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  //conversation starter
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLines: 3,
                    maxLength: 100,
                    decoration: InputDecoration(
                      // labelText: "Conversation Starter",
                      hintText:
                          "Ex:Are you a recursion? Because you’re the function that calls me back",
                      labelStyle: const TextStyle(color: Colors.white),
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.8)),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),

                  //Github
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Github*",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Github link",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Lindkein*",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Linkdein link",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => TNavigationMenu());
            },
            child: const Text("Next"),
          ),
        ));
  }
}
