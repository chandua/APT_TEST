import 'package:ast_products/widget/appBarWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'SourceSansPro',
          primaryColor: Colors.white,
          primaryColorDark: Colors.white,
          backgroundColor: Colors.white),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body:SingleChildScrollView(
          child:Container(
            color: Colors.grey[200],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    color: Colors.white,
                    height: 60.0,
                    child:Row(children: <Widget>[

                    ],)
                ),
                Container(
                    width: double.infinity,
                    child:Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                          alignment: Alignment.centerLeft,
                          child:Text("Categories",style: TextStyle(color: Color(0xFF364760),fontSize:16,fontFamily: 'SourceSansProBold')),

                        ),

                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                          height: MediaQuery.of(context).size.height * 0.17,
                          child:ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, subIndex) {
                              return  Container(
                                  width: MediaQuery.of(context).size.width * 0.3,

                                  child:Card(
                                    color: Colors.white,
                                    elevation: 2.0,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.home, size: 24, ),
                                        Text('Category $subIndex',style: TextStyle(color: Color(0xFF364760),fontSize:12,fontFamily: 'SourceSansProRegular'),)
                                      ],
                                    ),
                                  )
                              );

                            },
                          ),
                        )

                      ],
                    )


                ),
                Container(
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: List.generate(10, (index) {
                      return Center(
                        child: Text(
                          'Item $index',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      );
                    }),
                  ),
                )

              ],


            ),
          )
      )


     /* */




    );
  }
}
