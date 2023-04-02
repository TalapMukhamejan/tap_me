import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TapPage(),
      ),
    );
  }
}

class TapPage extends StatefulWidget {
  const TapPage({Key? key}) : super(key: key);

  @override
  State<TapPage> createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> {
  int topSide = 1;
  int bottomSide = 100;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: topSide,
          child: TextButton(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: topSide < 20 ? Container():Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotatedBox(
                    quarterTurns: 2,
                    child: Text(
                      topSide==bottomSide?('DRAW'):(topSide>bottomSide?'WINNER':'LOSER'),
                      style: TextStyle(color: Colors.greenAccent, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              color: topSide == 1 ? Colors.green[200]:Colors.purple[200],
            ),
            onPressed: () {
              setState(() {
                if (topSide == 1 || bottomSide == 1) {
                  topSide = 100;
                  bottomSide = 100;
                } else {
                  topSide += 3;
                  bottomSide -= 3;
                }
              });
              print('Top Side:$topSide,    Bottom Side:$bottomSide');
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              overlayColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
            ),
          ),
        ),
        Expanded(
          flex: bottomSide,
          child: TextButton(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    topSide==bottomSide?('DRAW'):(topSide<bottomSide?'WINNER':'LOSER'),
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              color: bottomSide == 1 ? Colors.purple[200]:Colors.green[200],
            ),
            onPressed: () {
              setState(() {
                if (topSide == 1 || bottomSide == 1) {
                  topSide = 100;
                  bottomSide = 100;
                } else {
                  topSide -= 3;
                  bottomSide += 3;
                }
              });
              print('Top Side:$topSide,    Bottom Side:$bottomSide');
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              overlayColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
