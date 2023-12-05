import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';
import 'page3.dart';


class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}
extension DateTimeExtensions on DateTime {
  DateTime startOfWeek() {
    return subtract(Duration(days: weekday % 7));
  }
  DateTime endOfWeek() {
    return add(Duration(days: 6 - weekday));
  }
}
class _Page2State extends State<Page2> {
  int _currentIndex = 0;
  final CalendarWeekController _controller = CalendarWeekController();
  DateTime selectedDate = DateTime.now();
  DateTime today = DateTime.now();
  bool _taskCompleted = false;
  @override
  Widget build(BuildContext context) {
    DateTime startOfThisWeek = selectedDate.startOfWeek();
    DateTime endOfThisWeek = selectedDate.endOfWeek();
    DateTime startOfTwoWeeksAgo = startOfThisWeek.subtract(const Duration(days: 14));
    DateTime endOfTwoWeeksLater = endOfThisWeek.add(const Duration(days: 14));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Container(),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 原來的內容
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
                    children: <Widget>[
                      Text(
                        "野原新之助 您好",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "讓我們開始今天的學習吧!",
                        style: TextStyle(fontSize: 14, color: Colors.white70),
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
                    icon: const Icon(Icons.email, color: Colors.white),
                    onPressed: () async {
                      const emailUrl = "mailto:learningisfun@gmail.com";
                      if (await canLaunch(emailUrl)) {
                        await launch(emailUrl);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("無法打開郵件應用"),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),



          const SizedBox(height: 10.0), // 距離10pt的间隔
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.scale(
                        scale: 2, // 放大1.3倍
                        child: const CircularProgressIndicator(
                          value: 0.75,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          strokeWidth: 3,
                        ),
                      ),
                      const Text(
                        "75%",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "進度完成",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.calendar_today, size: 12, color: Colors.black),
                      const SizedBox(width: 4),
                      Text(
                        "${today.month.toString().padLeft(2, '0')}/${today.day.toString().padLeft(2, '0')}",
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CalendarWeek(
                      controller: _controller,
                      height: 100,
                      showMonth: true,
                      minDate: startOfTwoWeeksAgo,
                      maxDate: endOfTwoWeeksLater,
                      onDatePressed: (DateTime datetime) {
                        setState(() {
                          selectedDate = datetime;
                        });
                      },
                    monthViewBuilder: (DateTime time) => Align(
                      alignment: FractionalOffset.center,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          DateFormat.yMMMM().format(time),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    decorations: const [],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    "本日功課",
                                    style: TextStyle(color: Colors.black, fontSize: 22),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 35.0),
                                  child: Text(
                                    "(1/3)已完成",
                                    style: TextStyle(color: Colors.grey, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "尚未完成",
                                  style: TextStyle(
                                    color: !_taskCompleted ? Colors.black : Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                Switch(
                                  value: _taskCompleted,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _taskCompleted = value;
                                    });
                                  },
                                ),
                                Text(
                                  "已完成",
                                  style: TextStyle(
                                    color: _taskCompleted ? Colors.black : Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (!_taskCompleted)
                          const Padding(
                            padding: EdgeInsets.only(left: 41.0, top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: 52,
                                      height: 52,
                                      child: CircularProgressIndicator(
                                        value: 0.5,
                                        backgroundColor: Colors.grey,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                                        strokeWidth: 6,
                                      ),
                                    ),
                                    Text(
                                      "50%",
                                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    "IELTS Speaking",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: AssetImage('assets/teacher2.jpg'),
                                      ),
                                      Positioned(
                                        right: 30.0, // You can adjust this value to move the teacher2 avatar more to the left or right
                                        child: CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage: AssetImage('assets/teacher3.jpg'),
                                        ),
                                      ),
                                      Positioned(
                                        right: 70.0, // 調整這個數值以移動 teacher3 的頭像
                                        child: CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage: AssetImage('assets/teacher4.jpg'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (!_taskCompleted)
                        const Padding(
                          padding: EdgeInsets.only(left: 41.0, top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 52,
                                    height: 52,
                                    child: CircularProgressIndicator(
                                      value: 0.8,
                                      backgroundColor: Colors.grey,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                                      strokeWidth: 6,
                                    ),
                                  ),
                                  Text(
                                    "80%",
                                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "TOFEL EXAM",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: AssetImage('assets/teacher3.jpg'),
                                    ),
                                    Positioned(
                                      right: 30.0, // You can adjust this value to move the teacher2 avatar more to the left or right
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: AssetImage('assets/teacher1.jpg'),
                                      ),
                                    ),
                                    Positioned(
                                      right: 70.0, // 調整這個數值以移動 teacher3 的頭像
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: AssetImage('assets/teacher2.jpg'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        if (_taskCompleted)
                          const Padding(
                          padding: EdgeInsets.only(left: 41.0, top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 52,
                                    height: 52,
                                    child: CircularProgressIndicator(
                                      value: 1.0,
                                      backgroundColor: Colors.grey,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                                      strokeWidth: 5,
                                    ),
                                  ),
                                  Text(
                                    "100%",
                                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "TOEIC 101",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: AssetImage('assets/teacher1.jpg'),
                                    ),
                                    Positioned(
                                      right: 30.0, // You can adjust this value to move the teacher2 avatar more to the left or right
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: AssetImage('assets/teacher2.jpg'),
                                      ),
                                    ),
                                    Positioned(
                                      right: 70.0, // 調整這個數值以移動 teacher3 的頭像
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: AssetImage('assets/teacher3.jpg'),
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ],
                          ),
                        ),



                      ],
                    ),


                  ),
                ],
              ),

            ),

          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavigationBar(
              currentIndex: _currentIndex,  // 使用當前的索引
              unselectedItemColor: Colors.grey,  // 未選中項目的顏色
              selectedItemColor: Colors.green,  // 選中項目的顏色
              onTap: (index) {
                if (index == 2) {  // If the "Add" tab is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Page3()),
                  );
                  return;  // Don't update the _currentIndex
                }
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '首頁',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: '列表',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: '新增課程',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: '通知',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: '設定',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





