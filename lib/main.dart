import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '美妝日記',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const DiaryHomePage(), // 載入我們的主頁
    );
  }
}

class DiaryHomePage extends StatelessWidget {
  const DiaryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. 底層肌底：粉嫩漸層背景
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFF9A9E), Color(0xFFFBC2EB)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // 區塊一：頂部導覽列 (對應你的草圖上半部)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu, color: Colors.white, size: 30), // 漢堡選單
                    Row(
                      children: const [
                        Icon(Icons.settings, color: Colors.white, size: 28), // 設定
                        SizedBox(width: 16),
                        CircleAvatar(
                          backgroundColor: Colors.white54,
                          child: Icon(Icons.person, color: Colors.pink), // 頭像
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // 區塊二：橫向日期滑動軸 (對應你的 DAY 1, DAY 2...)
              SizedBox(
                height: 100, // 卡片高度
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7, // 先假裝有7天
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      margin: const EdgeInsets.only(left: 16, bottom: 8, top: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3), // 玻璃質感
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white.withOpacity(0.5)),
                      ),
                      child: Center(
                        child: Text("DAY\n${index + 1}", 
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // 區塊三：主內容大框框 (對應你草圖的下半部大區塊)
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2), // 大塊玻璃
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                  ),
                  child: Row(
                    children: [
                      // 對應你畫的左側膠囊形狀 (可能是心情色條)
                      Container(
                        width: 8,
                        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // 這裡放日記文字內容
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "點擊上面的 DAY 卡片\n這裡就會顯示當天的日記內容...",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}