import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVT6AAQn4kamGZ62G5omyEpxmvfPL0WgZsKQ&usqp=CAU',
            fit: BoxFit.fill,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FloatingActionButton(
              elevation: 30,
              child: Icon(Icons.navigate_next),
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => myapp()));
              },
            ),
          ]),
    );
  }
}

class myapp extends StatefulWidget {
  const myapp({Key key}) : super(key: key);

  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
  double height_ = 0.0;
  double weight_ = 0.0;
  int bmi_ = 0;
  String condition_ = 'Select Data';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 65.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                height: size.height * 0.37,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BMI CALCULATION",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 34,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        '$bmi_',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      "Condition: $condition_",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Choose Data",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Text(
                      "Height:$height_ cm",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Slider(
                      value: height_,
                      min: 0,
                      max: 250,
                      onChanged: (height) {
                        setState(() {
                          height_ = height;
                        });
                      },
                      divisions: 250,
                      label: "$height_",
                      activeColor: Colors.deepOrange,
                      inactiveColor: Colors.black,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      "Weight:$weight_ Kg",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Slider(
                      value: weight_,
                      min: 0,
                      max: 200,
                      onChanged: (weight) {
                        setState(() {
                          weight_ = weight;
                        });
                      },
                      divisions: 200,
                      label: "$weight_",
                      activeColor: Colors.deepOrange,
                      inactiveColor: Colors.black,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              bmi_ = (weight_ /
                                      ((height_ / 100) * (height_ / 100)))
                                  .round()
                                  .toInt();
                              if (bmi_ >= 18.5 && bmi_ <= 25) {
                                condition_ = "Normal";
                              } else if (bmi_ > 25 && bmi_ <= 30) {
                                condition_ = "OverWeight";
                              } else if (bmi_ > 30) {
                                condition_ = "Obesity";
                              } else {
                                condition_ = "UnderWeight";
                              }
                            });
                          },
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton(
                elevation: 30,
                child: Icon(Icons.navigate_before),
                backgroundColor: Colors.red,
                onPressed: () {
                  Navigator.of(context)
                      .pop(MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
            ]));
  }
}
