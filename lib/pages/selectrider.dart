import 'package:flutter/material.dart';
import 'package:my_testflutter_app/pages/dashboard.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart'; // ✅ รอเปิดใช้งาน

class TrackParcelScreen extends StatefulWidget {
  const TrackParcelScreen({super.key});

  @override
  _TrackParcelScreenState createState() => _TrackParcelScreenState();
}

class _TrackParcelScreenState extends State<TrackParcelScreen> {
  // GoogleMapController? mapController; // ✅ รอเปิดใช้งาน
  // final LatLng _center = const LatLng(13.7563, 100.5018); // Bangkok

  final Map<String, String> driverInfo = {
    'name': 'คุณสมชาย',
    'carModel': 'Toyota Hilux Revo',
    'licensePlate': 'กข 1234 กรุงเทพ',
  };

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ParcelDashboardScreen()),
      );
    } else if (index == 2) {
      // อยู่หน้า "ส่งพัสดุ" แล้ว ไม่ต้องทำอะไร
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เมนูนี้ยังไม่มีหน้ารองรับ')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ติดตามพัสดุ')),
      body: Stack(
        children: [
          // ✅ พื้นที่สำหรับแผนที่ (รอเปิดใช้งาน)
          /*
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('driver'),
                position: _center,
                infoWindow: InfoWindow(
                  title: driverInfo['name'],
                  snippet: driverInfo['licensePlate'],
                ),
              ),
            },
          ),
          */

          // 📦 ข้อมูลคนขับด้านล่าง
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white.withOpacity(0.9),
              height: 160,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.local_shipping, size: 40, color: Colors.blueAccent),
                    title: Text(driverInfo['name'] ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text('รุ่นรถ: ${driverInfo['carModel']}'),
                        Text('ทะเบียน: ${driverInfo['licensePlate']}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // 🧭 แถบเมนูด้านล่าง
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // ✅ แสดงว่าอยู่ที่ "ส่งพัสดุ"
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าบ้าน'),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'พัสดุของฉัน'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'ส่งพัสดุ'),
          BottomNavigationBarItem(icon: Icon(Icons.track_changes), label: 'ติดตาม'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ไปโปรไฟล์'),
        ],
      ),
    );
  }
}
