import 'package:auto_route/auto_route.dart';
import 'package:bloc_apis/bloc/news_bloc.dart';
import 'package:bloc_apis/models/news_response.dart';
import 'package:bloc_apis/routes/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final bloc = NewsBloc();
 final newsModel= NewsResponse();
 String? url;
  String ? desc;
@override
  void initState() {
  bloc.add(GetNewsList());
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: BlocBuilder<NewsBloc, NewsState>(
         bloc: bloc,
         builder: (context, state) {
         if(state is NewsInitial|| state is NewsLoadingState){
           return  const Center(child: CircularProgressIndicator());
         }
          else if(state is NewsLoadedState){
             return buildCard(context, state.newsResponse);
          }
           else if(state is NewsErrorState){
              return Center(child: Text(state.errorMessage),);
         }
           else{
           return buildCard(context,newsModel);
         }
           },),
       )
    );
  }
  Widget buildCard(BuildContext context, NewsResponse model) {
    return ListView.builder(
        itemCount: model.articles!.length,
        itemBuilder: (context, index) {
          return InkWell(
             onTap: (){
               url= model.articles![index].urlToImage.toString();
               desc=   model.articles![index].content.toString();
               context.router.push(DetailsNews(imgUrl:url!  , desc: desc!,  ));
             },
            child: Container(
              height: 200,
               width: MediaQuery.of(context).size.width,
               color: Colors.amber,
              child: Card(
                 elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                         flex: 2,
                        child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                model.articles![index].urlToImage.toString(),
                                height: 100,
                                width:250,
                                fit: BoxFit.cover,),
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                         flex: 3,
                        child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Expanded(
                               child: Container(
                                  height: 300,
                                 margin: EdgeInsets.only(right: 10),
                                 width: MediaQuery.of(context).size.width,
                                 child: Text(
                                    // model.articles![index].description.toString(),
                                     model.articles![index].content.toString()
                                 ),
                               ),
                             ),
                             // Text(model.articles![index].description.toString()),
                             //   Text("content: ${model.articles![index].content.toString()}"),
                           ],
                         ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
  Widget buildGridView(BuildContext context, NewsResponse model){
  return Expanded(
    child: GridView.builder(
        itemCount: model.articles!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 4,
         childAspectRatio: 3/4),
             itemBuilder: (context, index){
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Image.network(
                 model.articles![index].urlToImage.toString(),
                 // height: 100,
                 // width:100,
                 fit: BoxFit.cover,),
               Text("Author: ${model.articles![index].author.toString()}"),

             ],
           );
        }),
  );
  }
}
