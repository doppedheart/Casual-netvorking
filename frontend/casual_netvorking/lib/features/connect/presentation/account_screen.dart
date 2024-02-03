import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


import '../../../color_constants.dart';
import '../../../data/account_json.dart';



class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kGrey.withOpacity(0.2),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.60,
        decoration: BoxDecoration(color: ColorConstants.kWhite, boxShadow: [
          BoxShadow(
            color: ColorConstants.kGrey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 10,
            // changes position of shadow
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(account_json[0]['img']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                account_json[0]['name'] + ", " + account_json[0]['age'],
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstants.kWhite,
                          boxShadow: [
                            BoxShadow(
                              color: ColorConstants.kGrey.withOpacity(0.1),
                              spreadRadius: 10,
                              blurRadius: 15,
                              // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.settings,
                          size: 35,
                          color: ColorConstants.kGrey.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "SETTINGS",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.kGrey.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 85,
                          height: 85,
                          child: Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: const LinearGradient(
                                    colors: [
                                      ColorConstants.primary_one,
                                      ColorConstants.primary_two
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          ColorConstants.kGrey.withOpacity(0.1),
                                      spreadRadius: 10,
                                      blurRadius: 15,
                                      // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 45,
                                  color: ColorConstants.kWhite,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 0,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConstants.kWhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorConstants.kGrey
                                            .withOpacity(0.1),
                                        spreadRadius: 10,
                                        blurRadius: 15,
                                        // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: ColorConstants.kPrimary,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "ADD MEDIA",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: ColorConstants.kGrey.withOpacity(0.8)),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstants.kWhite,
                          boxShadow: [
                            BoxShadow(
                              color: ColorConstants.kGrey.withOpacity(0.1),
                              spreadRadius: 10,
                              blurRadius: 15,
                              // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 35,
                          color: ColorConstants.kGrey.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "EDIT INFO",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.kGrey.withOpacity(0.8),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
