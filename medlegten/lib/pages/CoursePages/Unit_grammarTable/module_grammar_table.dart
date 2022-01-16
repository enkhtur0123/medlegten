import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/landing_header.dart';

class ModuleGrammarTablePage extends StatefulWidget {
  const ModuleGrammarTablePage({Key? key}) : super(key: key);

  @override
  _ModuleGrammarTablePageState createState() => _ModuleGrammarTablePageState();
}

class _ModuleGrammarTablePageState extends State<ModuleGrammarTablePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LandingHeader(100),
            addVerticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Grammar - Tobe and pronoun'.toUpperCase(),
                      style: const TextStyle(
                          color: colorPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                  ),
                  addVerticalSpace(20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Жишээ:',
                      style: TextStyle(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  addVerticalSpace(20),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: const Color.fromRGBO(26, 229, 239, .2),
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'I saw you dancing in a crowded room',
                          style: TextStyle(
                              color: colorBlack,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(20),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа',
                      style: TextStyle(
                          color: Color.fromRGBO(168, 175, 229, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  addVerticalSpace(25),
                  const Divider(
                    color: Color.fromRGBO(199, 201, 217, 0.2),
                    thickness: 1,
                  ),
                  addVerticalSpace(10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Өгүүлбэрийн төрөл сонгох',
                      style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const TabBar(tabs: [
                    Tab(
                      icon: Icon(Icons.person),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.add,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.deck,
                      ),
                    ),
                  ]),
                  Expanded(
                    child: TabBarView(
                      children: [
                        const Center(
                          child: Text(
                            'Screen 1',
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Screen 2',
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Screen 3',
                          ),
                        ),
                      ],
                      controller: _tabController,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
