import 'package:flutter/material.dart';

import '../../../../core/Constant/Constand.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  // ignore: unused_field
  int _selectedIndex = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  List<Widget> list = [
    Tab(
      child: Text(
        "All Chats",
        style: text1,
      ),
    ),
    Tab(
      child: Text(
        "Buying",
        style: text1,
      ),
    ),
    Tab(
      child: Text(
        "Selling",
        style: text1,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: purple,
          bottom: TabBar(
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text(
            'Chats',
            style: appHead,
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Center(
                child: Text(
             "Available Soon...",
              style: TextStyle(fontSize: 20),
            )),
            Center(
                child: Text(
               "Available Soon...",
              style: TextStyle(fontSize: 20),
            )),
            Center(
                child: Text(
               "Available Soon...",
              style: TextStyle(fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }
}
