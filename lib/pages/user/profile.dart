import 'package:flutter/material.dart';
import 'package:my_testflutter_app/pages/auth/login.dart';
import 'package:my_testflutter_app/pages/user/dashboard.dart';
import 'package:my_testflutter_app/pages/other/onboard.dart';
import 'package:my_testflutter_app/pages/user/home.dart';
import 'package:my_testflutter_app/pages/user/send.dart';
import 'package:my_testflutter_app/pages/user/trackparcel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController(text: 'balekeetak');
  final emailController = TextEditingController(text: 'nate@email.com');
  final phoneController = TextEditingController(text: '+66 812345678');
  final genderController = TextEditingController(text: 'Male');
  final addressController = TextEditingController(text: '12345 จ.ขอนแก่น');

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ParcelDashboardScreen()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SendParcelScreen()),
      );
    }
  }

  Widget buildDisplayField({
    required IconData icon,
    required String label,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: controller,
        enabled: false,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรไฟล์'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            SizedBox(height: 16),
            Text(
              nameController.text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),

            buildDisplayField(icon: Icons.email, label: 'Email', controller: emailController),
            buildDisplayField(icon: Icons.phone, label: 'Mobile Number', controller: phoneController),
            buildDisplayField(icon: Icons.person_outline, label: 'Gender', controller: genderController),
            buildDisplayField(icon: Icons.home, label: 'Address', controller: addressController),
            SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardScreen()),
                  );
                },
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าบ้าน'),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'พัสดุของฉัน'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'ส่งพัสดุ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'โปรไฟล์'),
        ],
      ),
    );
  }
}

