import 'package:bloc_apis/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../models/news_response.dart';

class DetailsNews extends StatefulWidget {
  const DetailsNews({Key? key, required this.imgUrl, required this.desc, }) : super(key: key);
   final String imgUrl;
   final String desc;


  @override
  State<DetailsNews> createState() => _DetailsNewsState();
}

class _DetailsNewsState extends State<DetailsNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: appBarTitle(),
         backgroundColor: Colors.white,
         centerTitle: true,
         elevation: 0,
       ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          children: [
             Container(
               height: 250,
               width: MediaQuery.of(context).size.width,
               child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                   child: Image.network(widget.imgUrl, fit: BoxFit.cover,)),
             ),
             const SizedBox(height: 10,),
             Container(
               // height: 200,
               height: 400,
               width: MediaQuery.of(context).size.width,
               child: Text(widget.desc, maxLines: 10,),
             )
          ],
        ),
      ),

    );
  }
}
