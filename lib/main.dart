import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Router
void main() async {
  runApp(MainPage());
}
class MainPage extends StatefulWidget{
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State <MainPage> {
  final userProfile = UserProfile(name: '', email: '');
  final studentProfile = StudentProfile(name: '', email: '', grade: 0);
  final engineerProfile = EngineerProfile(name: '', email: '', skill: '');
  void updateStudentProfile(StudentProfile profile) {
    setState(() {
      studentProfile.name = profile.name;
      studentProfile.email = profile.email;
      studentProfile.grade = profile.grade;
    });
  }
  void updateEngineerProfile(EngineerProfile profile) {
    setState(() {
      engineerProfile.name = profile.name;
      engineerProfile.email = profile.email;
      engineerProfile.skill = profile.skill;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the MainPage widget.
        '/': (context) => HomePage(
          studentProfile: studentProfile,
          engineerProfile: engineerProfile,
        ),
        '/cart': (context) => const CardPage(),
        '/pay': (context)  => const PaymentPage(),
        '/engineerProfileForm': (context) => EngineerProfileForm(
    userProfile: userProfile,
    updateProfile: updateEngineerProfile),
      },
    );
  }
}
class HomePage extends StatefulWidget {
  final StudentProfile studentProfile;
  final EngineerProfile engineerProfile;
  HomePage({
    required this.studentProfile,
    required this.engineerProfile
  });

  @override
  State<HomePage> createState() => _HomePageState(
    studentProfile: studentProfile,
    engineerProfile: engineerProfile,
  );
}
class _HomePageState extends State<HomePage>{
  StudentProfile studentProfile;
  EngineerProfile engineerProfile;
  _HomePageState({
    required this.studentProfile,
    required this.engineerProfile
  });

  Widget build(BuildContext context) {

    // StudentProfile? studentProfile;
    // EngineerProfile? engineerProfile;

    // @override
    // void initState(){
    //   super.initState();
    //   final StudentProfile studentProfile;
    //   final EngineerProfile engineerProfile;
    // }

    return Scaffold(
        appBar: AppBar(
            title: const Text("연세 쇼핑"),
            leading : IconButton(icon: Icon(Icons.menu), onPressed: (){Navigator.pushNamed(context, '/cart');},)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child : ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/engineerProfileForm');
                  },
                  child: const Text('로그인'),
                ),
              ),
              if (engineerProfile.name.isNotEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Engineer Profile:'),
                        Text('Name: ${engineerProfile.name}'),
                        Text('Email: ${engineerProfile.email}'),
                        Text('Skill: ${engineerProfile.skill}'),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 20,),
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
                              Navigator.pushNamed(context, '/cart');
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
                              TextButton(onPressed: (){Navigator.pushNamed(context, '/pay');}, child: Text("교재도서", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),),),
                              TextButton(onPressed: (){Navigator.pushNamed(context, '/pay');}, child: Text("패션굿즈", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),),),
                              TextButton(onPressed: (){Navigator.pushNamed(context, '/pay');}, child: Text("문구굿즈", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),),),
                              TextButton(onPressed: (){Navigator.pushNamed(context, '/pay');}, child: Text("생활용품", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),),),
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
                                      Image.asset("assets/images/pencilc_ase.png", width: 200, height: 200,),
                                      Text("연세대학교 필통"),
                                      Text("10,000원"),
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
                                      Image.asset("assets/images/bear.jpeg", width: 200, height: 200,),
                                      Text("연세대학교 곰인형"),
                                      Text("35,000원"),
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
                                      Image.asset("assets/images/badge.jpeg", width: 200, height: 200,),
                                      Text("연세대학교 뱃지"),
                                      Text("20,000원"),
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
                                      Image.asset("assets/images/bag.jpg", width: 200, height: 200,),
                                      SizedBox(width: 15,),
                                      Column(
                                        children: [
                                          Text("연세대학교 가방"),
                                          SizedBox(height: 3,),
                                          Text("50,000원"),
                                          SizedBox(height: 3,),
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
                              Container(
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/folder.jpeg", width: 200, height: 200,),
                                      SizedBox(width: 15,),
                                      Column(
                                        children: [
                                          Text("연세대학교 폴더"),
                                          SizedBox(height: 3,),
                                          Text("1,000원"),
                                          SizedBox(height: 3,),
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
                              Container(
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/poster.png", width: 200, height: 200,),
                                      SizedBox(width: 15,),
                                      Column(
                                        children: [
                                          Text("연세대학교 포스티잇"),
                                          SizedBox(height: 3,),
                                          Text("2,000원"),
                                          SizedBox(height: 3,),
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
                              Container(
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/sticker.png", width: 200, height: 200,),
                                      SizedBox(width: 15,),
                                      Column(
                                        children: [
                                          Text("연세대학교 스티커"),
                                          SizedBox(height: 3,),
                                          Text("3,000원"),
                                          SizedBox(height: 3,),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, '/cart');
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
class StudentProfileForm extends StatefulWidget {
  final UserProfile userProfile;
  final Function(StudentProfile) updateProfile;

  StudentProfileForm({
    Key? key,
    required this.userProfile,
    required this.updateProfile,
  }) : super(key: key);

  @override
  _StudentProfileFormState createState() => _StudentProfileFormState();
}
class _StudentProfileFormState extends State<StudentProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _studentProfile = StudentProfile(name: '', email: '', grade: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Profile'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _studentProfile.name = value!;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _studentProfile.email = value!;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Grade'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your grade';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _studentProfile.grade = int.parse(value!);
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processing Data')),
                  );
                  widget.updateProfile(_studentProfile);
                  Navigator.pop(context);
                }
              },
              child: Text('친구 신청'),
            ),
          ],
        ),
      ),
    );
  }
}
class UserProfile {
  String name;
  String email;

  UserProfile({required this.name, required this.email});
}
class StudentProfile extends UserProfile {
  int grade;

  StudentProfile({
    required String name,
    required String email,
    required this.grade,
  }) : super(name: name, email: email);
}

class EngineerProfile extends UserProfile {
  String skill;
  EngineerProfile({
    required String name,
    required String email,
    required this.skill,
  }) : super(name: name, email: email);
}
class EngineerProfileForm extends StatefulWidget {
  final UserProfile userProfile;
  final Function(EngineerProfile) updateProfile;

  EngineerProfileForm({
    Key? key,
    required this.userProfile,
    required this.updateProfile,
  }) : super(key: key);

  @override
  _EngineerProfileFormState createState() => _EngineerProfileFormState();
}
class _EngineerProfileFormState extends State<EngineerProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _engineerProfile = EngineerProfile(name: '', email: '', skill: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Engineer Profile'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _engineerProfile.name = value!;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _engineerProfile.email = value!;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Skill'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your field';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _engineerProfile.skill = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processing Data')),
                  );
                  widget.updateProfile(_engineerProfile);
                  Navigator.pop(context);
                }
              },
              child: Text('친구 신청'),
            ),
          ],
        ),
      ),
    );
  }
}
