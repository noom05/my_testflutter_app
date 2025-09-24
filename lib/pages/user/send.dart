import 'package:flutter/material.dart';
import 'package:my_testflutter_app/pages/user/dashboard.dart';
import 'package:my_testflutter_app/pages/user/home.dart';
import 'package:my_testflutter_app/pages/user/profile.dart';
import 'package:my_testflutter_app/pages/user/trackparcel.dart'; // ถ้ามีหน้า TrackParcelScreen
// import 'package:my_testflutter_app/pages/profile.dart'; // ถ้ามีหน้า ProfileScreen

class SendParcelScreen extends StatelessWidget {
  const SendParcelScreen({super.key});

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
      // อยู่หน้า "ส่งพัสดุ" แล้ว ไม่ต้องทำอะไร
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
        title: Text('ส่งพัสดุ'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // 🔵 ปุ่มสร้างรายการส่งพัสดุ
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                label: Text('สร้างรายการส่งพัสดุ'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('กำลังสร้างรายการใหม่...')),
                  );
                },
              ),
            ),
          ),

          // Pending Delivery
          ListTile(
            leading: Icon(Icons.local_shipping),
            title: Text('Pending Delivery'),
            subtitle: Text('คุณยังไม่มีรายการส่งที่รอดำเนินการ'),
          ),
          Divider(),

          // Recent Delivery
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Recent Delivery'),
            subtitle: Text('คุณยังไม่มีประวัติการส่ง อยากเริ่มส่งวันนี้ไหม?'),
          ),
        ],
      ),

      // 🧭 แถบเมนูด้านล่าง
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // ✅ ส่งพัสดุ
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าบ้าน'),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'พัสดุของฉัน',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'ส่งพัสดุ'),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'ติดตาม',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'โปรไฟล์'),
        ],
      ),
    );
  }
}
