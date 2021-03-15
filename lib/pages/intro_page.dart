import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intermediate/pages/home_page.dart';
import 'package:flutter_intermediate/utils/Strings.dart';

class IntroPage extends StatefulWidget {
  static final String id = "intro_page";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _pageController;
  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int index) {
              setState(() {
                currentPosition = index;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                  image: "assets/images/image_1.png",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              makePage(
                  image: "assets/images/image_2.png",
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              makePage(
                  image: "assets/images/image_3.png",
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: currentPosition == 2
                          ? Colors.red
                          : Colors.transparent,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicators(),
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, content}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600], fontSize: 20),
          ),
          Image(image: AssetImage(image))
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      margin: EdgeInsets.all(2),
      duration: Duration(milliseconds: 200),
      height: 6,
      width: isActive ? 30 : 6,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      if (currentPosition == i) {
        list.add(_indicator(true));
      } else {
        list.add(_indicator(false));
      }
    }
    return list;
  }
}
