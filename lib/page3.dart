import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';


class Page3 extends StatelessWidget {
  List<String> teacherNames = [
    '吉永老師',
    '松坂老師',
    '上尾老師',
    '夢芽老師',
    '海老師',
    '雪美老師',
    '麗莎老師',
    '呂老師',
    '花老師'
  ];

  Page3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: null,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/picture1.png'),
                    ),
                  ),
                ),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "野原新之助 您好",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      "讓我們開始今天的學習吧!",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.email, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 5),
            child: Text(
              "在線上的老師",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 30, right: 10),
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(Icons.add, size: 30, color: Colors.white),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 18.0, top: 3.0),
                        child: Text('新增教師'),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/teacher$index.jpg'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 4,
                            right: 6,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.greenAccent,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0, top: 3.0),
                      child: Text(teacherNames[index - 1]),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '最近聊天老師',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.chat, color: Colors.black),
                            SizedBox(width: 5),
                            Text(
                              '歷史訊息',
                              style: TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: teacherNames.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),  // 新增的padding
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: AssetImage('assets/teacher${index + 1}.jpg'),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 4,
                                    right: 0,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.greenAccent,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                teacherNames[index],
                                style: const TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),  // 新增的padding
                                child: Text(
                                  index == 0 ? '10分鐘' : '20分鐘',
                                  style: const TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


