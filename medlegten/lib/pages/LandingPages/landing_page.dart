import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/components/landing_header.dart';

class LandingPage extends HookWidget {
  const LandingPage({Key? key}) : super(key: key);

  List<Widget> get list => [
        Tab(
          icon: Image.asset(
            'assets/img/Landing/Home.png',
            height: 20,
            width: 20,
          ),
          text: "Home",
        ),
        Tab(
          icon: Image.asset(
            'assets/img/Landing/Course.png',
            height: 20,
            width: 20,
          ),
          text: "Course",
        ),
        Tab(
          icon: Image.asset(
            'assets/img/Landing/Video.png',
            height: 20,
            width: 20,
          ),
          text: "Video",
        ),
        Tab(
          icon: Image.asset(
            'assets/img/Landing/Blog.png',
            height: 20,
            width: 20,
          ),
          text: "Blog",
        ),
        // ignore: prefer_const_constructors
        Tab(
          icon: const Icon(
            Icons.account_circle,
            size: 20,
          ),
          text: "Profile",
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final _controller = useTabController(initialLength: list.length);
    final _index = useState(0);
    final _key = GlobalKey();

    _controller.addListener(() {
      _index.value = _controller.index;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          LandingHeader(100),
          Expanded(
            child: TabBarView(
              key: _key,
              controller: _controller,
              children: [
                Center(
                  child: Text("Index ${_controller.index}",
                      style: const TextStyle(color: Colors.black)),
                ),
                Center(
                  child: Text("Index ${_controller.index}",
                      style: const TextStyle(color: Colors.black)),
                ),
                Center(
                  child: Text("Index ${_controller.index}",
                      style: const TextStyle(color: Colors.black)),
                ),
                Center(
                  child: Text("Index ${_controller.index}",
                      style: const TextStyle(color: Colors.black)),
                ),
                Center(
                  child: Text("Index ${_controller.index}",
                      style: const TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: TabBar(
        indicatorColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
        tabs: list,
        onTap: (index) {},
        controller: _controller,
      ),
    );
  }
}
