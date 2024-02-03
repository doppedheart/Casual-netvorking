import 'package:causual_networking/feature/authentication/presentation/screens/profile_details/add_profile_details_page.dart';
import 'package:causual_networking/feature/authentication/presentation/screens/user_details/add_user_deatails_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';

class SelectYourIntrest1 extends StatefulWidget {
  const SelectYourIntrest1({super.key});

  @override
  State<SelectYourIntrest1> createState() => _SelectYourIntrest1State();
}

class _SelectYourIntrest1State extends State<SelectYourIntrest1> {
  final framworksAndTools = [
    "Flutter",
    "HTML",
    "CSS",
    "JavaScript",
    "React",
    "Angular",
    "Vue.js",
    "Python",
    "Spring Boot",
    "Node.js",
    "Express.js",
    "Ruby on Rails",
    "PHP",
    "Laravel",
    "C#",
    "ASP.NET",
    "Swift",
    "SwiftUI",
    "Kotlin",
  ];
  final occupations = [
    "Software Engineer",
    "Data Scientist",
    "Web Developer",
    "Product Manager",
    "Network Engineer",
    "Mobile Developer",
    "DevOps Engineer",
    "QA Engineer",
    "System Administrator",
    "Business Analyst",
    "Full Stack Developer",
  ];

  final List<String> selectedframworksAndTools = [];
  final List<String> selectedOccupations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Your Intrest"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Select Your Intrest ",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                choiceChipWidget("Frameworks and Tools", framworksAndTools,
                    selectedframworksAndTools),
                const SizedBox(
                  height: 20,
                ),
                choiceChipWidget(
                    "Occupation", occupations, selectedOccupations),
                const SizedBox(
                  height: 20,
                ),
              ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const SelectYourIntrest2(),
                transition: Transition.fadeIn);
          },
          child: const Text("Next"),
        ),
      ),
    );
  }

  Column choiceChipWidget(
      String title, List<String> list, List<String> selectedList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: TColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        Wrap(
          children: framworksAndTools
              .map(
                (e) => ChoiceChip(
                  label: Text(e),
                  selected: selectedList.contains(e),
                  onSelected: (selected) {
                    setState(() {
                      if (selectedList.contains(e)) {
                        selectedList.remove(e);
                      } else {
                        selectedList.add(e);
                      }
                    });
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class SelectYourIntrest2 extends StatefulWidget {
  const SelectYourIntrest2({super.key});

  @override
  State<SelectYourIntrest2> createState() => _SelectYourIntrest2State();
}

class _SelectYourIntrest2State extends State<SelectYourIntrest2> {
  final hobbies = [
    "Reading",
    "Writing",
    "Painting",
    "Photography",
    "Gardening",
    "Cooking",
    "Traveling",
    "Hiking",
    "Cycling",
    "Running",
  ];
  final companies = [
    "Google",
    "Apple",
    "Microsoft",
    "Amazon",
    "Facebook (Meta)",
    "IBM",
    "Intel",
    "Cisco",
    "Adobe",
    "Oracle",
  ];

  final List<String> selectedHobbies = [];
  final List<String> selectedCompanies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Your Intrest"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Select Your Intrest ",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                choiceChipWidget("Hobbies", hobbies, selectedHobbies),
                const SizedBox(
                  height: 20,
                ),
                choiceChipWidget("Companies", companies, selectedCompanies),
                const SizedBox(
                  height: 20,
                ),
              ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const AddProfileDetailPage(),
                transition: Transition.fadeIn);
          },
          child: const Text("Next"),
        ),
      ),
    );
  }

  Column choiceChipWidget(
      String title, List<String> list, List<String> selectedList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: TColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        Wrap(
          children: list
              .map(
                (e) => ChoiceChip(
                  label: Text(e),
                  selected: selectedList.contains(e),
                  onSelected: (selected) {
                    setState(() {
                      if (selectedList.contains(e)) {
                        selectedList.remove(e);
                      } else {
                        selectedList.add(e);
                      }
                    });
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
