// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:async";

import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StopWatch(),
    );
  }
}

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  bool isRunning = false;
  Duration durationTime = Duration(seconds: 0);
  Timer? repeatedEvent;

  startTimer() {
    repeatedEvent = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        int durationTimeNew = durationTime.inSeconds + 1;
        durationTime = Duration(seconds: durationTimeNew);
      });
    });
  }

  stopResumeFun() {
    //print(durationTime.inSeconds);
    if (repeatedEvent!.isActive) {
      setState(() {
        //  print(repeatedEvent!.isActive);
        repeatedEvent!.cancel();
      });
    } else {
      startTimer();
    }
  }

  canceledFun() {
    repeatedEvent!.cancel();
    setState(() {
      durationTime = Duration(seconds: 0);
      isRunning = false;
    });
  }

  startStep() {
    startTimer();
    setState(() {
      isRunning = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 145,
        title: Text(
          "Stop watch",
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 52,
                height: 710,
                //color: Colors.amberAccent,
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.asset(
                        "assets/img/Blackgroud img 1.png",
                        height: 70,
                      ),
                      bottom: 140,
                      left: 0,
                    ),
                  ],
                ),
              ),
              Container(
                width: 359,
                height: 710,
                //color: Colors.amber,
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.asset(
                        "assets/img/Blackgroud img 1 (1).png",
                        height: 70,
                      ),
                      bottom: 499,
                      right: 0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 710,
                      width: 300,
                      //color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 80,
                                      width: 65,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(1, 3),
                                                color: Colors.white,
                                                blurRadius: 10)
                                          ],
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(50),
                                              top: Radius.circular(50))),
                                      child: Text(
                                        durationTime.inHours
                                            .toString()
                                            .padLeft(2, "0"),
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Hours",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 22,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 80,
                                      width: 65,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(1, 3),
                                                color: Colors.white,
                                                blurRadius: 10)
                                          ],
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(50),
                                              top: Radius.circular(50))),
                                      child: Text(
                                        durationTime.inMinutes.remainder(60)
                                            .toString()
                                            .padLeft(2, "0"),
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Minutes",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 22,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 80,
                                      width: 65,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(1, 3),
                                                color: Colors.white,
                                                blurRadius: 10)
                                          ],
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(50),
                                              top: Radius.circular(50))),
                                      child: Text(
                                        durationTime.inSeconds
                                            .remainder(60)
                                            .toString()
                                            .padLeft(2, "0"),
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Seconds",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          isRunning
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        stopResumeFun();
                                      },
                                      child: Text(
                                        repeatedEvent!.isActive
                                            ? "Stop"
                                            : "Resume",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromARGB(
                                                      210, 177, 75, 75))),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        canceledFun();
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromARGB(
                                                      210, 177, 75, 75))),
                                    ),
                                  ],
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    startStep();
                                  },
                                  child: Text(
                                    "Start  Timer",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromARGB(
                                                  211, 116, 177, 75))),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
