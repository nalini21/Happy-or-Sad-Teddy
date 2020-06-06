import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isHappy= false;
  bool isSad= false;
  String status = "test";
  Color clr1 = Colors.white.withOpacity(0.6);
  Color clr2 = Colors.white.withOpacity(0.6);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(children: <Widget>[
          SizedBox(
            height: 700,
            width: 400,
            child: FlareActor("assets/Teddy.flr",
                alignment: Alignment(0, -0.5),
                fit: BoxFit.contain,
                animation: "$status"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    isHappy= !isHappy;
                    if(isHappy){
                    isSad= false;
                    status = "success";
                    clr1= Colors.blue;
                    if(clr2==Colors.blue)
                      clr2=Colors.white.withOpacity(0.6);
                    print('happy');
                    }
                    else
                    {
                    status="idle";  
                    clr1= Colors.white.withOpacity(0.6);
                    }
                  });
                },
                child: Icon(
                  MaterialCommunityIcons.emoticon_happy,
                  size: 100,
                  color: clr1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSad= !isSad;
                    if(isSad){
                    isHappy=false;
                    status = "fail";
                    clr2= Colors.blue;
                    if(clr1==Colors.blue)
                      clr1=Colors.white.withOpacity(0.6);
                    print('sad');
                    }
                     else
                    {
                    status="idle";  
                    clr2= Colors.white.withOpacity(0.6);
                    }
                  });
                },
                child: Icon(
                  MaterialCommunityIcons.emoticon_sad,
                  size: 100,
                  color: clr2,
                ),
              ),
              
            ],
          )
        ]),
      ),
    );
  }
}
