import 'package:flutter/material.dart';
import 'package:my_testflutter_app/pages/user/home.dart';
import 'package:my_testflutter_app/pages/user/profile.dart';
import 'package:my_testflutter_app/pages/user/send.dart';
import 'package:my_testflutter_app/pages/user/trackparcel.dart';

class ParcelDashboardScreen extends StatefulWidget {
  const ParcelDashboardScreen({super.key});

  @override
  _ParcelDashboardScreenState createState() => _ParcelDashboardScreenState();
}

class _ParcelDashboardScreenState extends State<ParcelDashboardScreen> {
  int selectedTab = 0; // 0 = ส่งแล้ว, 1 = ได้รับ

  void _onItemTapped(int index) {
    if (index == 0) {
      // กด "หน้าบ้าน" → ไปหน้า SelectRider
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (index == 1) {
      // อยู่หน้า "พัสดุของฉัน" แล้ว ไม่ต้องทำอะไร
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
        title: Text('รายการพัสดุ'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Tabs ด้านบน
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedTab = 0),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    color: selectedTab == 0
                        ? Colors.blue[100]
                        : Colors.grey[200],
                    child: Center(child: Text('รายการพัสดุที่จัดส่ง')),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedTab = 1),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    color: selectedTab == 1
                        ? Colors.blue[100]
                        : Colors.grey[200],
                    child: Center(child: Text('รายการพัสดุที่ได้รับ')),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // ช่องค้นหาสถานะพัสดุ
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

          // รายการพัสดุ
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.local_shipping),
                  title: Text('Pending Delivery'),
                  subtitle: Text('คุณยังไม่มีรายการส่งที่รอดำเนินการ'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Recent Delivery'),
                  subtitle: Text(
                    'คุณยังไม่มีประวัติการส่ง อยากเริ่มส่งวันนี้ไหม?',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // แถบเมนูด้านล่าง
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // แสดงว่าอยู่ที่ "พัสดุของฉัน"
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าบ้าน'),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'พัสดุของฉัน',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'ส่งพัสดุ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ไปโปรไฟล์'),
        ],
      ),
    );
  }
}
