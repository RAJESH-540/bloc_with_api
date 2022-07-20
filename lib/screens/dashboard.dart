import 'package:bloc_apis/screens/myHomePage.dart';
import 'package:flutter/material.dart';

import '../text_styles/text_styles.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
         appBar: AppBar(
           title: appBarTitle(),
           backgroundColor: Colors.white,
            bottom: const TabBar(
              labelColor: Colors.black,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 16, ),
              tabs:  [
                Tab(text: "Top",),
                Tab(text: "Recent",),
                Tab(text: "Popular",),
              ],
            ),
            // elevation: 0,
         ),
        body: const TabBarView(
          children: [
         MyHomePage(),
         MyHomePage(),
         MyHomePage(),
        ],

        ),

      )
    );
  }

}
