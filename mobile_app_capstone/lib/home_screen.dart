import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  String savedCourse = "Koi course nahi";

  @override
  void initState() {
    super.initState();
    _loadCourse(); // App khulte hi purana data load hoga
  }

  // Data Save karne ke liye
  Future<void> _saveCourse(String courseName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastCourse', courseName);
    setState(() {
      savedCourse = courseName;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$courseName save ho gaya')),
    );
  }

  // Data Load karne ke liye
  Future<void> _loadCourse() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedCourse = prefs.getString('lastCourse') ?? "Koi course nahi";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SkillHub'), // YE HI TUMHARA LOGO/HEADER HAI
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Home Screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'Last Saved Course:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              savedCourse, // <-- Yaha saved data dikhega
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveCourse('Introduction to Web Development'), // <-- Ye button data save karega
              child: Text('Save Course'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}