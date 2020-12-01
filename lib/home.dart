import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soshi_app/features/home/home_provider.dart';

import 'di.dart';
import 'sushi_icons.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, instance, child) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF363C3E),
                              Color(0xFF323537),
                              Color(0xFF29292A),
                              Color(0xFF221C1C),
                            ],
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20,
                              MediaQuery.of(context).size.height / 16, 20, 10),
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              prefixIcon: Image.asset('images/Search.png'),
                              suffixIcon:
                                  Image.asset('images/-_Filter-Filters.png'),
                              hintText: 'Search your meal',
                              hintStyle: TextStyle(
                                color: Color(0xFF9F9F9F),
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        children: [
                          Center(
                            child: Text(
                              'Sushi Order',
                              style: TextStyle(
                                color: Color(0xFFFF4E63),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 10),
                              orders('test', context),
                              orders('test', context),
                              SizedBox(width: 10),
                            ],
                          ),
                          Center(
                            child: Text(
                              'Beverage',
                              style: TextStyle(
                                color: Color(0xFFFF4E63),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 10),
                              orders('test', context),
                              orders('test', context),
                              SizedBox(width: 10),
                            ],
                          ),
                          Center(
                            child: Text(
                              'Reserve Room',
                              style: TextStyle(
                                color: Color(0xFFFF4E63),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                for (int i = 0; i < 5; ++i)
                                  getRoomCard(context),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: 50,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(18),
              //         topRight: Radius.circular(18),
              //       ),
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.grey,
              //           offset: Offset(0.0, 1.0), //(x,y)
              //           blurRadius: 6.0,
              //         ),
              //       ],
              //     ),
              //     child: Padding(
              //       padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              //       child: ,
              //     ),
              //   ),
              // ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: instance.currentIndex,
            selectedItemColor: Colors.pink,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              print('index: $index');
              // sl<HomeProvider>().setCurrentIndex(index: index);
              instance.setCurrentIndex(index: index);
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
              BottomNavigationBarItem(icon: Icon(Sushi.settings), label: ''),
            ],
          ),
        );
      },
    );
  }

  Widget orders(type, context) {
    return Stack(children: [
      Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Container(
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          width: MediaQuery.of(context).size.width / 2 - 55,
          height: 240,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
      Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Container(
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          width: MediaQuery.of(context).size.width / 2 - 45,
          height: 230,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
      Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => print("ciao"),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    'https://placeimg.com/640/480/any',
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Muki Roll Set',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('images/Group 629.png',
                                  width: 10, height: 10, fit: BoxFit.fill),
                              SizedBox(width: 2),
                              Image.asset('images/Group 629.png',
                                  width: 10, height: 10, fit: BoxFit.fill),
                              SizedBox(width: 2),
                              Image.asset('images/Group 629.png',
                                  width: 10, height: 10, fit: BoxFit.fill),
                              SizedBox(width: 2),
                              Image.asset('images/Group 629.png',
                                  width: 10, height: 10, fit: BoxFit.fill),
                              SizedBox(width: 2),
                              Image.asset('images/Path 866.png',
                                  width: 10, height: 10, fit: BoxFit.fill),
                            ],
                          ),
                          SizedBox(height: 3),
                          Row(children: [
                            Text(
                              'Rate 4',
                              style: TextStyle(
                                fontSize: 8,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Color(0xB3AAAAAA),
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              '/5',
                              style: TextStyle(
                                fontSize: 6,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Color(0xB3AAAAAA),
                              ),
                            ),
                          ])
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'images/-_Love-Heart-Romantic.png',
                          color: Colors.red,
                        ),
                        Text(
                          '39 likes',
                          style: TextStyle(
                            fontSize: 8,
                            fontFamily: 'Poppins',
                            color: Color(0xFFAAAAAA),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Image.asset('images/icons8-connect-50-2.png',
                            height: 17, width: 19, fit: BoxFit.fill),
                        SizedBox(height: 3),
                        Text(
                          'Share',
                          style: TextStyle(
                            fontSize: 8,
                            fontFamily: 'Poppins',
                            color: Color(0xFFAAAAAA),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 49),
                    Text(
                      '\$2',
                      style: TextStyle(
                        color: Color(0xFF676767),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        top: 4,
        left: 4,
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          decoration: BoxDecoration(
            color: Color(0xFFFF4E63),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('images/Shopping Cart.png'),
              SizedBox(
                width: 15,
              ),
              Text(
                'Full Set',
                style: TextStyle(
                    color: Colors.white, fontSize: 11, fontFamily: 'Poppins'),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget getRoomCard(context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        child: Image.network(
          'https://placeimg.com/640/480/any',
          height: 150,
          width: MediaQuery.of(context).size.width / 2,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
