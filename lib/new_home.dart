import 'package:flutter/material.dart';
import 'package:soshi_app/sushi_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 16,
                  left: 16,
                  bottom: MediaQuery.of(context).viewPadding.top,
                  top: MediaQuery.of(context).viewPadding.top,
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    prefixIcon: Image.asset('images/Search.png'),
                    suffixIcon: Image.asset('images/-_Filter-Filters.png'),
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
                  Color(0xFF221C1C),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Text(
                          'Sushi Order',
                          style: TextStyle(
                            color: Color(0xFFFF4E63),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(child: orders('test', context)),
                            SizedBox(width: 10),
                            Expanded(child: orders('test', context)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Beverage',
                          style: TextStyle(
                            color: Color(0xFFFF4E63),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(child: orders('test', context)),
                            SizedBox(width: 10),
                            Expanded(child: orders('test', context)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Reserve Room',
                          style: TextStyle(
                            color: Color(0xFFFF4E63),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (int i = 0; i < 5; ++i) getRoomCard(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            print('index: $index');
            setState(() {
              selectedIndex = index;
            });
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
      ),
    );
  }

  Widget orders(type, context) {
    return Container(
      height: 270,
      child: IntrinsicHeight(
        child: IntrinsicWidth(
          child: Stack(
            children: [
              Positioned.fill(
                bottom: 0,
                left: 6,
                right: 6,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 15,
                left: 2,
                right: 2,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 30,
                child: mainCardBuilder(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainCardBuilder(context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => print("ciao"),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
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
                    Spacer(),
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
              ),
              SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
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
