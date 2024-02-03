import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../../color_constants.dart';
import '../../../data/explore_json.dart';
import '../../../data/icons.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  ExploreScreenState createState() => ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  // CardController controller;

  List itemsTemp = [];
  int itemLength = 0;

  List<Widget> cardList = [];

  final CardSwiperController _cardSwiperController = CardSwiperController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      itemsTemp = explore_json;
      itemLength = explore_json.length;
      cardList = [
        const SwipCardWidget(),
        const SwipCardWidget(),
        const SwipCardWidget(),
      ];
    });
  }

  @override
  void dispose() {
    _cardSwiperController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kWhite,
      appBar: AppBar(
        backgroundColor: ColorConstants.kWhite,
        elevation: 0,
        title: const Text(
          "Explore",
          style: TextStyle(
            color: ColorConstants.kBlack,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Iconsax.filter, size: 24, color: ColorConstants.kBlack),
          ),
        ],
      ),
      body: getBody(),
      // bottomSheet: getBottomSheet(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 500,
          width: size.width,
          child: CardSwiper(
            cardBuilder:
                (context, index, percentThresholdX, percentThresholdY) {
              return cardList[index];
            },
            allowedSwipeDirection: const AllowedSwipeDirection.only(
              right: true,
              left: true,
            ),
            cardsCount: cardList.length,
            controller: _cardSwiperController,
          ),
        ),
      ],
    );
  }

  Widget getBottomSheet() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 120,
      decoration: BoxDecoration(color: ColorConstants.kWhite),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(item_icons.length, (index) {
            return Container(
              width: item_icons[index]['size'],
              height: item_icons[index]['size'],
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstants.kWhite,
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstants.kBlack.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: SvgPicture.asset(
                  item_icons[index]['icon'],
                  width: item_icons[index]['icon_size'],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class SwipCardWidget extends StatelessWidget {
  const SwipCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: const DecorationImage(
            colorFilter: ColorFilter.linearToSrgbGamma(),
            image: NetworkImage(
                "https://images.unsplash.com/flagged/photo-1563536310477-c7b4e3a800c2?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.blue),
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: const Border.fromBorderSide(
                      BorderSide(color: Colors.red),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: const Border.fromBorderSide(
                          BorderSide(color: Colors.blue))),
                  child: const Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.blue,
                        ),
                        //right arrow
                        Icon(
                          Icons.arrow_right_alt_sharp,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Text("Ayesha,22"),
          const SizedBox(
            height: 10,
          ),
          const Text("I am a software engineer"),
        ],
      ),
    );
  }
}
