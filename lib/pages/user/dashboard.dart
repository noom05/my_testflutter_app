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
        automaticallyImplyLeading: false,
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
              padding: EdgeInsets.symmetric(horizontal: 12),
              children: [
                if (selectedTab == 0) ...[
                  Text(
                    'Pending Delivery',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // รูปภาพพัสดุ
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/package.png',
                                    ), // ใส่รูปพัสดุของคุณ
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),

                              // ข้อมูลพัสดุ
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MAY23230024',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('Destination: ขอนแก่น'),
                                  ],
                                ),
                              ),

                              // ป้ายสถานะ
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber[600],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'กำลังส่ง',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),

                          // วันที่และเวลา
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '23/05 12:59pm',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          SizedBox(height: 12),

                          // ปุ่ม Tracking
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[400],
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TrackParcelScreen(),
                                  ),
                                );
                              },
                              child: Text('Tracking'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
