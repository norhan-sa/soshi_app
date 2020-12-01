import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:soshi_app/start_pro.dart';
import 'package:provider/provider.dart';


class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final start_provider = Provider.of<StartPro>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Image.asset('images/logo.png'),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: <Widget>[
                           Text('MEKUSHI',
                             textAlign: TextAlign.center,
                             style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold
                             ),
                           ),
                           Text('Sushi Restaurant',
                             textAlign: TextAlign.center,
                             style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                             ),
                           ),                           
                         ],
                       )
                    ],
                  ),
                ),
                Swiper(
                  onIndexChanged:(index){
                    start_provider.change_index(index);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Image.network(
                        'https://picsum.photos/200/${index}',
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  itemCount: 3,
                  itemWidth: 300.0,
                  itemHeight: MediaQuery.of(context).size.height/2 + 40,
                  layout: SwiperLayout.STACK,
                ),
                // SizedBox(height: 20,),
                Text('What’s Special meal today ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Consumer<StartPro>(
                  builder: (_ , instance , child){
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < 3; i++)
                          if (i == instance.index) ...[circleBar(true)] else
                          circleBar(false),
                      ],
                    );
                  }
                  ),
                  Consumer<StartPro>(
                    builder: (_ , instance , child){
                      return button(instance.index);
                    }, 
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFFF4E63) : Color(0xFFAAAAAA),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
 } 

 Widget button(index){
    if(index == 2){
      return  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: ()=>{
              print('hello'),
            },
            child: Text('Get Started',
              style: TextStyle(
                color: Color(0xFFFF4E63),
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
          ),
        ],
      );
    }else{
      return  Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            onPressed: ()=>{
              print('hello'),
            },
            child: Text('SKIP',
              style: TextStyle(
                color: Color(0xFFFF4E63),
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            ),
          ),
        ],
      );      
    }
 }   
}