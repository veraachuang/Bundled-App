import 'package:flutter/material.dart';
import 'package:flutter_donation_app/screens/home/widget/ngo_scroller.dart';

class Explore extends StatelessWidget {
  @override
  

  Widget build(BuildContext context) {
    int _index = 0;

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          /* Image(
            alignment: Alignment.topCenter,
            image: AssetImage("assets/images/image3.png"),
            fit: BoxFit.contain,
            width: double.infinity,
          ), */
          /* Positioned(
            top: 10,
            left: 30,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.search,
                  color: Colors.white,
                  size: 30,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                /* Text(
                  "Categories",
                   style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 32,
                            fontFamily: 'CentraleSansRegular',
                            fontWeight: FontWeight.w100),
                ),
                Text(
                  "View All",
                   style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontFamily: 'CentraleSansRegular',
                            fontWeight: FontWeight.w100),
                ), */
                  ],
                )
              ],
            ),
          ), */
          Scroller(),
          Container(
              margin: EdgeInsets.only(top: 20),
              height: 1,
              width: MediaQuery.of(context).size.width,
              child: Container()/* Center(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: PageView.builder(
                        itemCount: 5,
                        controller: PageController(viewportFraction: 1.0),
                        onPageChanged: (int index) =>
                            setState(() => _index = index),
                        itemBuilder: (_, i) {
                          return Transform.scale(
                            scale: i == _index ? 1 : 1.0,
                            child: Card(
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Text(
                                "Card ${i + 1}",
                                style: TextStyle(fontSize: 32),
                              )),
                            ),
                          );
                        })),
              ) */

              /* Center(child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: GestureDetector(onTap(){
                print("Container clicked");
              },
              child: new Container(
                width: 100.0,
                padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                color: Colors.green,
                child: new Column(
                  children: [
                    new Text("Ableitungen"),
                  ],
                ),
              )
              ,);<Widget>[
                Image.asset("assets/images/slide1.png"),
                SizedBox(width:5),
                Image.asset("assets/images/slide2.png"),
                SizedBox(width:5),
                Image.asset("assets/images/slide3.png"),
                SizedBox(width:5),
                Image.asset("assets/images/slide3.png")
              ],
            ),), */
              ),
          /* Container(
            margin: EdgeInsets.only(top: 200),
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                ListTile(
                  trailing: Icon(Icons.more_vert),
                  leading: Image.asset("assets/images/ad1.png"),
                  title: Text("Feeding America Society",
                      style: TextStyle(
                          fontFamily: "CentraleSansRegular",
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("Oregon",
                      style: TextStyle(
                        fontFamily: "CentraleSansRegular",
                        fontSize: 15,
                      )),
                ),
                ListTile(
                  trailing: Icon(Icons.more_vert),
                  leading: Image.asset("assets/images/ad2.png"),
                  title: Text("Ubuntu",
                      style: TextStyle(
                          fontFamily: "CentraleSansRegular",
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("Maryland",
                      style: TextStyle(
                        fontFamily: "CentraleSansRegular",
                        fontSize: 15,
                      )),
                ),
                ListTile(
                  trailing: Icon(Icons.more_vert),
                  leading: Image.asset("assets/images/ad3.png"),
                  title: Text("Dallas Morning News",
                      style: TextStyle(
                          fontFamily: "CentraleSansRegular",
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("Washington",
                      style: TextStyle(
                        fontFamily: "CentraleSansRegular",
                        fontSize: 15,
                      )),
                ),
              ],
            ),
          ) */
        ],
      ),
    );
  }

  /* Widget _buildCarousel(BuildContext context, int carouselIndex){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Carousel $carouselIndex'),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }*/
}
