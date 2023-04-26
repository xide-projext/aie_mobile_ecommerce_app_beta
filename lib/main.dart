import 'dart:convert';
import 'package:flutter/material.dart';

final toons = [
  {"title": "연세 볼펜", "image" :  "https://yonseicoop.com/data/goods/8/833/20190412_183816.jpg"},
  {"title": "연세 필통", "image": "https://www.yonsei.ac.kr/_res/sc/img/intro/img_symbol8.png"}
];


// Router
void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the MainPage widget.
      '/': (context) => const MainPage(),
      // When navigating to the "/second" route, build the ProductPage widget.
      '/second': (context) => const ProductPage(),
      '/pay': (context)  => const PaymentPage(),
    },
  ));
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("연세 쇼핑"),
          leading : IconButton(icon: Icon(Icons.menu), onPressed: (){Navigator.pushNamed(context, '/pay');},)),
        body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(5.0),
                      margin: const EdgeInsets.all(5.0),
                      child: Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child :Text('연세 굿즈',
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.left)
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                )
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: '상품을 검색해주세요! 예) 연세필통',
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Validate will return true if the form is valid, or false if
                                  // the form is invalid.
                                  Navigator.pushNamed(context, '/second');
                                },
                                child: const Text('검색하기'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration : BoxDecoration(
                              borderRadius:  BorderRadius.circular(2),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,)
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                TextButton(onPressed: (){}, child: Text("교재도서", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),),),
                                TextButton(onPressed: (){}, child: Text("패션굿즈", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),),),
                                TextButton(onPressed: (){}, child: Text("문구굿즈", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),),),
                                TextButton(onPressed: (){}, child: Text("생활용품", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),),),
                              ],
                            ),
                          )
                        ),
                        SizedBox(height: 10,),
                        Text("당신만을 위한 추천 아이템!",
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.left),
                        SizedBox(height: 10,),
                        SizedBox(height: 10,),
                        Container(
                            decoration : BoxDecoration(
                                borderRadius:  BorderRadius.circular(2),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,)
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/pencilc_ase.png", width: 200, height: 200,),
                                        Text("연세대학교 필통"),
                                        Text("10,000원"),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Validate will return true if the form is valid, or false if
                                            // the form is invalid.
                                            Navigator.pushNamed(context, '/second');
                                          },
                                          child: const Text('구매하기!'),
                                        ),
                                      ],
                                    )
                                  ),
                                  Container(
                                      child: Column(
                                        children: [
                                          Image.asset("assets/images/bear.jpeg", width: 200, height: 200,),
                                          Text("연세대학교 곰인형"),
                                          Text("35,000원"),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Validate will return true if the form is valid, or false if
                                              // the form is invalid.
                                              Navigator.pushNamed(context, '/second');
                                            },
                                            child: const Text('구매하기!'),
                                          ),
                                        ],
                                      )
                                  ),
                                  Container(
                                      child: Column(
                                        children: [
                                          Image.asset("assets/images/pen.jpeg", width: 200, height: 200,),
                                          Text("연세대학교 펜"),
                                          Text("5,000원"),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Validate will return true if the form is valid, or false if
                                              // the form is invalid.
                                              Navigator.pushNamed(context, '/second');
                                            },
                                            child: const Text('구매하기!'),
                                          ),
                                        ],
                                      )
                                  ),
                                  Container(
                                      child: Column(
                                        children: [
                                          Image.asset("assets/images/badge.jpeg", width: 200, height: 200,),
                                          Text("연세대학교 뱃지"),
                                          Text("20,000원"),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Validate will return true if the form is valid, or false if
                                              // the form is invalid.
                                              Navigator.pushNamed(context, '/second');
                                            },
                                            child: const Text('구매하기!'),
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            )
                        ),
                        SizedBox(height: 10,),
                        Text("가장 유명한 제품!",
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.left),
                        SizedBox(height: 10,),
                        Container(
                            decoration : BoxDecoration(
                                borderRadius:  BorderRadius.circular(2),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,)
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Container(
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/pencilc_ase.png", width: 200, height: 200,),
                                          SizedBox(width: 15,),
                                          Column(
                                            children: [
                                              Text("연세대학교 필통"),
                                              SizedBox(height: 3,),
                                              Text("10,000원"),
                                              SizedBox(height: 3,),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Validate will return true if the form is valid, or false if
                                                  // the form is invalid.
                                                  Navigator.pushNamed(context, '/second');
                                                },
                                                child: const Text('구매하기!'),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                  ),
                                  Container(
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/pencilc_ase.png", width: 200, height: 200,),
                                          SizedBox(width: 15,),
                                          Column(
                                            children: [
                                              Text("연세대학교 필통"),
                                              SizedBox(height: 3,),
                                              Text("10,000원"),
                                              SizedBox(height: 3,),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Validate will return true if the form is valid, or false if
                                                  // the form is invalid.
                                                  Navigator.pushNamed(context, '/second');
                                                },
                                                child: const Text('구매하기!'),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                  ),
                                  Container(
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/pencilc_ase.png", width: 200, height: 200,),
                                          SizedBox(width: 15,),
                                          Column(
                                            children: [
                                              Text("연세대학교 필통"),
                                              SizedBox(height: 3,),
                                              Text("10,000원"),
                                              SizedBox(height: 3,),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Validate will return true if the form is valid, or false if
                                                  // the form is invalid.
                                                  Navigator.pushNamed(context, '/second');
                                                },
                                                child: const Text('구매하기!'),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                  ),
                                  Container(
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/pencilc_ase.png", width: 200, height: 200,),
                                          SizedBox(width: 15,),
                                          Column(
                                            children: [
                                              Text("연세대학교 필통"),
                                              SizedBox(height: 3,),
                                              Text("10,000원"),
                                              SizedBox(height: 3,),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Validate will return true if the form is valid, or false if
                                                  // the form is invalid.
                                                  Navigator.pushNamed(context, '/second');
                                                },
                                                child: const Text('구매하기!'),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            )
                        ),
                        // Row( ##아이콘
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: const <Widget>[
                        //     Icon(
                        //       Icons.favorite,
                        //       color: Colors.pink,
                        //       size: 24.0,
                        //       semanticLabel:
                        //           'Text to announce in accessibility modes',
                        //     ),
                        //     Icon(
                        //       Icons.audiotrack,
                        //       color: Colors.green,
                        //       size: 30.0,
                        //     ),
                        //     Icon(
                        //       Icons.beach_access,
                        //       color: Colors.blue,
                        //       size: 36.0,
                        //     ),
                        //   ],
                        // ),

                      ])),
                ],
              ),
            )

    );
  }
}



class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ProductPage")),
        body: const Text("2")
    );
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Payment")),
        body: const Text("3")
    );
  }
}