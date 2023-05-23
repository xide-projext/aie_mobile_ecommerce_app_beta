
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(
          studentProfile: studentProfile,
          engineerProfile: engineerProfile,
        ),
        '/studentProfileForm': (context) => StudentProfileForm(
          userProfile: userProfile,
          updateProfile: updateStudentProfile,
        ),
        '/engineerProfileForm': (context) => EngineerProfileForm(
          userProfile: userProfile,
          updateProfile: updateEngineerProfile,
        ),
      },
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

class FirstPage extends StatelessWidget {
  final StudentProfile studentProfile;
  final EngineerProfile engineerProfile;

  FirstPage({
    required this.studentProfile,
    required this.engineerProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/studentProfileForm');
                },
                child: Text('Go to Student Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/engineerProfileForm');
                },
                child: Text('Go to Engineer Page'),
              ),
            ],
          ),
          if (studentProfile.name.isNotEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Student Profile:'),
                    Text('Name: ${studentProfile.name}'),
                    Text('Email: ${studentProfile.email}'),
                    Text('Grade: ${studentProfile.grade}'),
                  ],
                ),
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
        ],
      ),
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