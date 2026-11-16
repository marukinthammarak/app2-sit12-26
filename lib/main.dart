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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'หน้าร้าน',
          style: TextStyle(
            color: Colors.pinkAccent, // สีชมพู
            backgroundColor: Colors.amber, // สีเหลือง
            fontSize: 32, // ขนาดตัวอักษร
            fontWeight: FontWeight.w800, // ความหนาตัวอักษร
          ),
        ),
        leading: Text("Leading"),
        actions: [
          Icon(
            Icons.menu, // ไอคอนเมนู
            size: 60, // ใหญ่
            color: Colors.blue, // สีฟ้า
          ),
          Icon(Icons.person)
        ],
      ),
      body: Column(
        children: [
          Text("Hello"),
          Text("Hello"),
          Text("Hello"),
          Text("Hello"),
          Row(
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgFomolW7uHD0j76HFZcbgxRKoxcha3o_znFvfxc0S2CZh0o_juvxyTKYZ&s=10"
                  ,width: 200,
                  height: 200,
                  fit: BoxFit.cover,
              ),
              ClipOval(
              child: Image.asset("assets/images.jpeg",
              width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
              child:ElevatedButton(
              onPressed:() => {},
              child: Text("ปุ่ม 1"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8)
                )
              )
              )
            ),
              SizedBox(
                width: 20,
                height: 100,
              ),
              Expanded(
                  child: OutlinedButton(
                      onPressed: () => {},
                      child: Text("ปุ่ม 2"),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.amber
                    ),
                  )

              )
          ]
      ),
        ]
    )
    );
  }
}