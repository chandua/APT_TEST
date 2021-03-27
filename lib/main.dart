import 'package:ast_products/model/Product.dart';
import 'package:ast_products/widget/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

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
                  height: 60,
                  child:Row(
                    children: [
                      Expanded(
                        child: Container(
                            margin:EdgeInsets.only(left:10, right: 10),
                          width: 230,
                            height: 40,
                            child:TextField(
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'Search.',
                                prefixIcon: Icon(Icons.search),
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                                  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                                  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
                                ),
                              ),)
                        ),
                      ),
                    GestureDetector(
                         onTap: (){
                           filterDialog();
                      },
                           child:Container(
                        alignment: Alignment.center,
                             width: 100,
                        child: Row(
                          children: [
                            Image.asset("assets/images/filter.png",color:Colors.indigo,width: 18,height: 18,alignment: Alignment.centerRight,),
                            SizedBox(width: 4,),
                            Text("Filter",style: TextStyle(color: Colors.indigo,fontSize:12,fontFamily: 'SourceSansProSemiBold')),
                          ],
                        ),
                      )
                    )

                    ],
                  ),

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
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(productList.length, (index) {
                      return  Container(

                          child:Card(
                            color: Colors.white,
                            elevation: 1.0,
                            child: Column(

                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  margin:EdgeInsets.only(left:0, right: 10,top:10,bottom: 0),
                                  child: CircleAvatar(backgroundColor: Colors.indigo,maxRadius: 13, child: Center(child: Text(productList[index].discount+"%", style: TextStyle(color: Colors.white,fontSize:10,fontFamily: 'SourceSansProSemiBold'),),),),
                                ),
                                SizedBox(height: 5,),
                                Image.network(productList[index].image,height:  90,width: MediaQuery.of(context).size.width * 0.4, fit:BoxFit.fill),
                                SizedBox(height: 5,),
                                Container(
                                alignment: Alignment.centerLeft,
                                margin:EdgeInsets.only(left:10, right: 0,top:0,bottom: 0),
                                child:Text(productList[index].title,maxLines:1,style: TextStyle(color: Colors.black,fontSize:13,fontFamily: 'SourceSansProSemiBold'),),

                              ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Expanded(
                                      child:Container(
                                          alignment: Alignment.centerLeft,
                                          margin:EdgeInsets.only(left:10, right: 0,top:0,bottom: 0),
                                        child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("₹ "+productList[index].price.toString(),style: TextStyle(color: Color(0xFF364760),fontSize:14,fontFamily: 'SourceSansProBold'),),
                                            Text(" ₹ "+productList[index].discountPrice.toString(),style: TextStyle(color: Colors.grey[400],fontSize:14,fontFamily: 'SourceSansPro',decoration: TextDecoration.lineThrough),)
                                          ],
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,

                                          child:  RatingBar.readOnly(
                                            initialRating: productList[index].rating,
                                            filledIcon: Icons.star,
                                            emptyIcon: Icons.star_border,
                                            halfFilledIcon: Icons.star_half,
                                            isHalfAllowed: true,
                                            filledColor: Colors.amberAccent,
                                            emptyColor: Colors.grey,
                                            halfFilledColor: Colors.amberAccent,
                                            size: 14,
                                          ),
                                        ),
                                      ],

                                    )

                                    )),

                                     Container(
                                          alignment: Alignment.centerRight,
                                          margin:EdgeInsets.only(left:0, right: 10,top:0,bottom: 0),
                                          child:CircleAvatar(backgroundColor: Colors.red,maxRadius: 8,))
                                      ,

                                  ],
                                ),
                                SizedBox(height: 5,),


                                Container(
                                  height: 20,
                                  margin:EdgeInsets.only(left:10, right: 10,top:0,bottom: 0),
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child:   RaisedButton(
                                    color: Colors.redAccent[100],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    onPressed: () {},
                                    child: Text("Add Cart",style: TextStyle(color: Colors.white,fontSize:12,fontFamily: 'SourceSansProRegular')),
                                  ),
                                ),
                                SizedBox(height: 5,),

                              ],
                            ),
                          )
                      );
                    }),
                  ),
                )

              ],


            ),
          )
      )

    );
  }

  filterDialog(){
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0))
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height/1.2,width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0)),
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(icon: Icon(Icons.close,), onPressed: () { Navigator.pop(context); },),
                  Expanded(child: Center(child: Text("Filter",style: TextStyle(color: Color(0xFF364760),fontSize:16,fontFamily: 'SourceSansProBold')))),
                  Text("Reset",style: TextStyle(color: Colors.indigo,fontSize:16,fontFamily: 'SourceSansProBold'))
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Price Range",style: TextStyle(color: Colors.black,fontSize:18,fontFamily: 'SourceSansProBold')),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                height:40,
                child:Row(
                  children: [
                    Expanded(child:TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Minimum',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          borderSide: BorderSide(color: Colors.grey[400], width: 2),
                        ),

                      ),)),
                    Icon(Icons.remove,color: Colors.grey[400],),
                    Expanded(child:TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                    hintText: 'Maximum',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                     borderSide: BorderSide(color: Colors.grey[400], width: 2),
                      ),

                      ),)),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              Row(
                children: [
                  Text("Item Filter",style: TextStyle(color: Colors.black,fontSize:18,fontFamily: 'SourceSansProBold')),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Image.asset("assets/images/price-tag.png",color:Colors.grey[400],width: 18,height: 18,alignment: Alignment.centerLeft,),
                  SizedBox(width: 6,),
                  Expanded(child: Text("Category 0",style: TextStyle(color: Color(0xFF364760),fontSize:16,fontFamily: 'SourceSansProRegular'))),
                  Image.asset("assets/images/check.png",color:Colors.grey[400],width: 18,height: 18,alignment: Alignment.centerLeft,),
                ],
              ),
              SizedBox(height: 3,),
              Divider(
                color: Colors.grey[400],
              ),
              SizedBox(height: 3,),
              Row(
                children: [
                  Image.asset("assets/images/car.png",color:Colors.grey[400],width: 18,height: 18,alignment: Alignment.centerLeft,),
                  SizedBox(width: 6,),
                  Expanded(child: Text("Category 1",style: TextStyle(color: Color(0xFF364760),fontSize:16,fontFamily: 'SourceSansProRegular'))),
                  Image.asset("assets/images/check.png",color:Colors.grey[400],width: 18,height: 18,alignment: Alignment.centerLeft,),
                ],
              ),
              SizedBox(height: 3,),
              Divider(
                color: Colors.grey[400],
              ),
              SizedBox(height: 3,),
              Row(
                children: [
                  Icon(Icons.margin,color:Colors.grey[400],size: 18,),
                  SizedBox(width: 6,),
                  Expanded(child: Text("Category 2",style: TextStyle(color: Color(0xFF364760),fontSize:16,fontFamily: 'SourceSansProRegular'))),
                ],
              ),
              SizedBox(height: 3,),
              Divider(
                color: Colors.grey[400],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text("Item Color",style: TextStyle(color: Colors.black,fontSize:18,fontFamily: 'SourceSansProBold')),
                ],
              ),
              SizedBox(height:10,),
              Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.white,maxRadius: 15,),
                  SizedBox(width: 10,),
                  CircleAvatar(backgroundColor: Colors.black,maxRadius: 15,),
                  SizedBox(width: 10,),
                  CircleAvatar(backgroundColor: Colors.indigo,maxRadius: 15,),
                  SizedBox(width: 10,),
                  CircleAvatar(backgroundColor: Colors.teal,maxRadius: 15,),
                  SizedBox(width: 10,),
                  CircleAvatar(backgroundColor: Colors.red,maxRadius: 15,),

                ],
              ),
              SizedBox(height:14,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ButtonTheme(
                  minWidth: double.infinity,
                  height: 42,
                  child: RaisedButton(
                    color: Colors.indigo,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Apply Filter",style: TextStyle(color: Colors.white,fontSize:15,fontFamily: 'SourceSansProRegular')),
                  ),
                ),
              ),

            ],
          ),
        );
      }, context: context,);
  }
}
List<Product> productList= <Product>[
  Product("Chair Dacey li - Black","http://atlas-content-cdn.pixelsquid.com/stock-images/marble-table-coffee-636XwoA-600.jpg", "30", 50.00, 58.00, 4.5),
  Product("Elly Sofa Patchwork","https://atlas-content-cdn.pixelsquid.com/stock-images/armchair-arm-chair-6360XZ2-600.jpg", "30", 110.00,140.00, 4.5),
  Product("Dobeson Table- white","https://www.kimsalmela.com/wp-content/uploads/2016/10/20-son-camc3.png", "25", 120.00, 160.00, 4.5),
  Product("Chair Dacey li - Black","https://w7.pngwing.com/pngs/164/494/png-transparent-chair-table-couch-furniture-bench-simple-european-single-sofa-heart-room-sofa-thumbnail.png", "30", 50.00, 58.00, 4.5),
  Product("Elly Sofa Patchwork","https://img.freepik.com/free-psd/interior-decoration-set-3d-rendering_252032-144.jpg?size=338&ext=jpg", "30", 110.00,140.00, 4.5),
  Product("Dobeson Table- white","https://w7.pngwing.com/pngs/249/759/png-transparent-chair-comfort-furniture-commode-comfortable-chairs-angle-furniture-fashion.png", "25", 120.00, 160.00, 4.5),];


