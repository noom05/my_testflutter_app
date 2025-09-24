import 'package:flutter/material.dart';
import 'package:my_testflutter_app/pages/user/dashboard.dart';
import 'package:my_testflutter_app/pages/user/send.dart';
import 'package:my_testflutter_app/pages/user/profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      // อยู่หน้าแรกแล้ว
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
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าหลัก'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👋 ทักทายผู้ใช้
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                SizedBox(width: 12),
                Text(
                  'สวัสดี, Nate Samson',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 24),

            // 🔍 ช่องค้นหาสถานะพัสดุ
            TextField(
              decoration: InputDecoration(
                hintText: 'ตรวจสอบสถานะพัสดุ',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 24),

            // 🧾 เนื้อหาเพิ่มเติม (เช่น รายการล่าสุด, โปรโมชั่น ฯลฯ)
            Expanded(
              child: Center(
                child: Text(
                  'ยังไม่มีรายการพัสดุในขณะนี้',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),

      // 🧭 แถบเมนูด้านล่าง
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // อยู่หน้าแรก
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้ารแรก'),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'พัสดุของฉัน'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'ส่งที่สุด'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'โปรไฟล์'),
        ],
      ),
    );
  }
}
