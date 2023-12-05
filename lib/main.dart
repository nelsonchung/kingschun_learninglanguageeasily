import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';
import 'page2.dart';



// 引入url_launcher套件來啟動其他應用

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'assets/page1.png',
    'assets/page2.png',
    'assets/page3.png',
  ];
  int currentPage = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    var hiFlutter = const Text(
      '',
      style: TextStyle(fontSize: 20, color: Colors.white, fontStyle: FontStyle.italic),
    );

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(child: hiFlutter),
              );
            },
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Row(
              children: List.generate(images.length, (index) {
                return GestureDetector(
                  onTap: () {
                    _controller.animateToPage(index,
                        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: currentPage == index ? 25 : 15,  // 修改寬度
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: currentPage == index ? BoxShape.rectangle : BoxShape.circle,  // 修改形狀
                      borderRadius: currentPage == index ? BorderRadius.circular(7.5) : null,  // 增加圓角
                    ),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Page2()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: const Row(
                children: [
                  Text("Start"),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
