import 'package:flutter/material.dart';
import 'package:my_testflutter_app/pages/send.dart';
import 'package:my_testflutter_app/pages/trackparcel.dart'; // ✅ นำเข้า SelectRider

class ParcelDashboardScreen extends StatefulWidget {
  const ParcelDashboardScreen({super.key});

  @override
  _ParcelDashboardScreenState createState() => _ParcelDashboardScreenState();
}

class _ParcelDashboardScreenState extends State<ParcelDashboardScreen> {
  int selectedTab = 0; // 0 = ส่งแล้ว, 1 = ได้รับ

  void _onItemTapped(int index) {
    if (index == 2) {
      // ✅ กด "หน้าบ้าน" → ไปหน้า SelectRider
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SendParcelScreen()),
      );
    } else if (index == 1) {
      // ✅ อยู่หน้า "พัสดุของฉัน" แล้ว ไม่ต้องทำอะไร
    } else if (index == 3) {
      // ✅ กด "ติดตาม" → ไปหน้า TrackParcel
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TrackParcelScreen()),
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
          // 🔁 Tabs ด้านบน
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

          // 🔍 ช่องค้นหาสถานะ
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'ตรวจสอบสถานะพัสดุ',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // 📦 รายการพัสดุ
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

      // 🧭 แถบเมนูด้านล่าง
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // ✅ แสดงว่าอยู่ที่ "พัสดุของฉัน"
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
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'ติดตาม',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ไปโปรไฟล์'),
        ],
      ),
    );
  }
}
