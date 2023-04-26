import 'dart:convert';
import 'package:flutter/material.dart';

// Router
void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the MainPage widget.
      '/': (context) => const MainPage(),
      '/cart': (context) => const CardPage(),
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
            leading : IconButton(icon: Icon(Icons.menu), onPressed: (){Navigator.pushNamed(context, '/cart');},)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(5.0),
                  child: Column(children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child :Text('연세 굿즈'),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          // decoration: BoxDecoration(
                          //     border: Border.all(
                          //       color: Colors.black,
                          //       width: 2,
                          //     )
                          // ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: '검색',
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
                              Navigator.pushNamed(context, '/cart');
                            },
                            child: const Text('Search'),
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
                              TextButton(onPressed: (){Navigator.pushNamed(context, '/pay');}, child: Text("교재도서",),),
                              TextButton(onPressed: (){Navigator.pushNamed(context, '/pay');}, child: Text("교재도서",),),
                              TextButton(onPressed: (){Navigator.pushNamed(context, '/pay');}, child: Text("교재도서",),),
                              TextButton(onPressed: (){Navigator.pushNamed(context, '/pay');}, child: Text("교재도서",),),
                              TextButton(onPressed: (){Navigator.pushNamed(context, '/pay');}, child: Text("교재도서",),),
                            ],
                          ),
                        )
                    ),
                    SizedBox(height: 10,),
                    Text("당신만을 위한 추천 아이템!",),

                    SizedBox(height: 10,),
                    Container(
                        // decoration : BoxDecoration(
                        //     borderRadius:  BorderRadius.circular(2),
                        //     border: Border.all(
                        //       color: Colors.black,
                        //       width: 2,)
                        // ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                  child: Column(
                                    children: [
                                      Image.asset("assets/images/pen.jpeg", width: 50, height: 50,),
                                      Text("연세대학교 펜"),
                                      Text("5,000원"),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/pay');
                                        },
                                        child: const Text('구매하기!'),
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                  child: Column(
                                    children: [
                                      Image.asset("assets/images/pen.jpeg", width: 100, height: 100,),
                                      Text("연세대학교 펜"),
                                      Text("5,000원"),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/pay');
                                        },
                                        child: const Text('구매하기!'),
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                  child: Column(
                                    children: [
                                      Image.asset("assets/images/pen.jpeg", width: 100, height: 100,),
                                      Text("연세대학교 펜"),
                                      Text("5,000원"),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/pay');
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
                                          Navigator.pushNamed(context, '/pay');
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
                                          Navigator.pushNamed(context, '/pay');
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
                    Text("가장 유명한 제품!",),

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
                                      Image.asset("assets/images/pen.jpg", width: 400, height: 400,),
                                      SizedBox(width: 15,),
                                      Column(
                                        children: [
                                          Text("연세대학교 가방"),
                                          Text("50,000원"),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, '/pay');
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


class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("결제 창")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(5.0),
                  child: Column(children: [
                    Container(
                        child :Text('상품 결제하기',
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.left)
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration : BoxDecoration(
                          borderRadius:  BorderRadius.circular(2),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,)
                      ),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    // decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //       color: Colors.black,
                                    //       width: 2,
                                    //     )
                                    // ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: '카드 번호를 입력해주세요',
                                      ),
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return '카드 번호를 다시 입력해주세요';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    // decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //       color: Colors.black,
                                    //       width: 2,
                                    //     )
                                    // ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'MM/YY',
                                      ),
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return '카드 번호를 다시 입력해주세요';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    // decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //       color: Colors.black,
                                    //       width: 2,
                                    //     )
                                    // ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'CVC',
                                      ),
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return '카드 번호를 다시 입력해주세요';
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
                                      },
                                      child: const Text('결제하기'),
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset("assets/images/pen.jpeg", width: 500, height: 500,),
                              Text("연세대학교 펜",
                                style: TextStyle(
                                  fontSize: 24.0, // 폰트 크기 설정
                                  fontWeight: FontWeight.bold, // 폰트 두께 설정
                                  color: Colors.black, // 폰트 색상 설정
                                ),),
                              SizedBox(height: 20,),
                              Text("10,000원",
                                style: TextStyle(
                                  fontSize: 20.0, // 폰트 크기 설정
                                  fontWeight: FontWeight.bold, // 폰트 두께 설정
                                  color: Colors.black, // 폰트 색상 설정
                                ),
                              ),
                              SizedBox(height: 20,)
                            ],
                          )
                      ),
                    ),
                  ])),
            ],
          ),
        )
    );

  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("상품 카트")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(5.0),
                  child: Column(children: [
                    Container(

                        child :Text('상품 구매하기',
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.left)
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration : BoxDecoration(
                          borderRadius:  BorderRadius.circular(2),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,)
                      ),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Image.asset("assets/images/pen.jpeg", width: 500, height: 500,),
                              Text("연세대학교 펜",
                                style: TextStyle(
                                  fontSize: 24.0, // 폰트 크기 설정
                                  fontWeight: FontWeight.bold, // 폰트 두께 설정
                                  color: Colors.black, // 폰트 색상 설정
                                ),),
                              SizedBox(height: 20,),
                              Text("10,000원",
                                style: TextStyle(
                                  fontSize: 20.0, // 폰트 크기 설정
                                  fontWeight: FontWeight.bold, // 폰트 두께 설정
                                  color: Colors.black, // 폰트 색상 설정
                                ),
                              ),
                              SizedBox(height: 20,),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/cart');
                                },
                                child: const Text('결제하기!'),
                              ),
                              SizedBox(height: 20,)
                            ],
                          )
                      ),
                    ),
                  ])),
            ],
          ),
        )
    );
  }
}

