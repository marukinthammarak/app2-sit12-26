import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // ตัวแปรกำหนดจำนวนเอง (โพสต์ / ผู้ติดตาม / กำลังติดตาม)
  final int posts = 3;
  final String followers = '115';
  final int following = 99;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          // ไอดีแอคเคาท์ (แก้ไขชื่อเองได้)
          title: const Text(
            'late.007',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          // ไอคอนเมนู
          actions: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    // แถวโปรไฟล์ + สถิติ
                    Row(
                      children: [
                        // ภาพโปรไฟล์ใช้ไฟล์ภาพจากในโปรเจค
                        const CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage('assets/est.jpg'),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStat('$posts', 'โพสต์'),
                              _buildStat(followers, 'ผู้ติดตาม'),
                              _buildStat('$following', 'กำลังติดตาม'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // ชื่อนักศึกษา และแคปชัน
                    const Text(
                      'มฤคินทร์ ธรรมรักษ์',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'นักศึกษาสาขาเทคโนโลยีสารสนเทศ\nคลอไฟล์นการเขียน Flutter 💙',
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    // ปุ่มติดตาม (แบบทึบ) + ปุ่มข้อความ (แบบมีเส้นขอบ)
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: const Text('ติดตาม'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black87,
                              side: const BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: const Text('ข้อความ'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              // แท็บไอคอน (กริด / บุคคล)
              const TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(icon: Icon(Icons.grid_on)),
                  Tab(icon: Icon(Icons.person_pin_outlined)),
                ],
              ),
              // ภาพประกอบ 3 ภาพ ใช้ภาพจากลิงก์บนอินเทอร์เน็ต
              Row(
                children: [
                  _buildPhoto('https://picsum.photos/id/1018/400/400'),
                  _buildPhoto('https://picsum.photos/id/1015/400/400'),
                  _buildPhoto('https://picsum.photos/id/1016/400/400'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget ช่วยสร้างคอลัมน์สถิติ
  Widget _buildStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }

  // Widget ช่วยสร้างภาพในกริด 3 คอลัมน์
  Widget _buildPhoto(String url) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.network(url, fit: BoxFit.cover),
        ),
      ),
    );
  }
}