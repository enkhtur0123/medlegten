import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/landing_header.dart';



class ModuleGrammarTablePage extends StatefulWidget {
  const ModuleGrammarTablePage({Key? key}) : super(key: key);

  @override
  _ModuleGrammarTablePageState createState() => _ModuleGrammarTablePageState();
}

class _ModuleGrammarTablePageState extends State<ModuleGrammarTablePage> {

  Map<String,dynamic> grammar_data = {"grammar": [
    {"label":"Positive", "structure": ["Subject","To be","Object"]},
    {"label":"Question", "structure": ["To be","Subject","Object"]},
    {"label":"Negative", "structure": ["Subject","To be","adverb", "Object"]}
    ]
  };

  Map<String,dynamic> sentence_example = {"sentences": [
    {
      "sentence": [
        {"label":"positive", "eng":"He is a teacher","mon":"Тэр эрэгтэй бол багш", "structure":[{"Subject":"He","To be":"is","Object":"teacher"}]},
        {"label":"question", "eng":"Is he a teacher?","mon":"Тэр эрэгтэй багш мөн үү?", "structure":[{"To be":"Is","Subject":"he","Object":"teacher"}]},
        {"label":"negative", "eng":"He is not a teacher","mon":"Тэр эрэгтэй бол багш биш", "structure":[{"Subject":"He","To be":"is","adverb":"not", "Object":"teacher"}]},
      ]
    },
    {
      "sentence": [
        {"label":"positive", "eng":"He is a student","mon":"Тэр эрэгтэй бол оюутан", "structure":[{"Subject":"He","To be":"is","Object":"student"}]},
        {"label":"question", "eng":"Is he a student?","mon":"Тэр эрэгтэй оюутан мөн үү?", "structure":[{"To be":"Is","Subject":"he","Object":"student"}]},
        {"label":"negative", "eng":"He is not a student","mon":"Тэр эрэгтэй бол оюутан биш", "structure":[{"Subject":"He","To be":"is","adverb":"not", "Object":"student"}]},
      ]
    },
    {
      "sentence": [
        {"label":"positive", "eng":"It is a dog","mon":"Энэ бол нохой", "structure":[{"Subject":"It","To be":"is","Object":"dog"}]},
        {"label":"question", "eng":"Is it a dog?","mon":"Энэ нохой мөн үү?", "structure":[{"To be":"Is","Subject":"it","Object":"dog"}]},
        {"label":"negative", "eng":"It is not a dog","mon":"Энэ нохой биш", "structure":[{"Subject":"It","To be":"is","adverb":"not", "Object":"dog"}]},
      ]
    },
  ]};


  @override
    void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LandingHeader(100),
            addVerticalSpace(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
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
                ],
              ),
            ),

            addVerticalSpace(25),
            const Divider(
              color: Color.fromRGBO(199, 201, 217, 0.2),
              thickness: 1,
            ),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Align(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                    children: <Widget>[
                        DefaultTabController(
                          length: 3, // length of tabs
                          initialIndex: 0,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  child: TabBar(
                                    indicatorColor: colorPrimary,
                                    labelColor: colorPrimary,
                                    unselectedLabelColor: Colors.black,
                                    labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
                                    tabs: [
                                      Tab(text: grammar_data['grammar'][0]['label']),
                                      Tab(text: grammar_data['grammar'][1]['label']),
                                      Tab(text: grammar_data['grammar'][2]['label']),
                                    ],
                                  ),
                                ),
                                Container(
                                    height: 400, //height of TabBarView
                                    child: TabBarView(children: <Widget>[
                                      Container(
                                        child: ListView.builder(
                                          itemCount: 3,
                                            itemBuilder: (BuildContext context, int index) {
                                              return Container(
                                                // child: Text('${grammar_data['grammar'][0]['structure'][index]}', style: TextStyle(color: colorBlack),),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets.only(top:5, bottom: 5, left: 10, right: 10),
                                                      decoration: BoxDecoration(
                                                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                                        border: Border.all(color: Color.fromRGBO(199, 201, 217, 0.5))
                                                      ),
                                                      child: Text('${grammar_data['grammar'][0]['structure'][index]}', style: TextStyle(color: colorBlack, fontWeight: FontWeight.w500,fontSize: 16),)
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 63,
                                                      padding: const EdgeInsets.only(top:5, bottom: 5, left: 10, right: 10),
                                                      margin: new EdgeInsets.only(left: 10.0),
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                            left: BorderSide(width: 1, color: Color.fromRGBO(199, 201, 217, 0.5))
                                                          )
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                padding: const EdgeInsets.only(top:5, bottom: 5, left: 20 , right: 20),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                                                    border: Border.all(color: Color.fromRGBO(199, 201, 217, 0.2))
                                                                ),
                                                                child: Text('+ He', style: TextStyle(color: colorBlack, fontWeight: FontWeight.w400, fontSize: 15),),
                                                              ),
                                                              addHorizontalSpace(20),
                                                              Container(
                                                                padding: const EdgeInsets.only(top:5, bottom: 5, left: 20, right: 20),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                                                    border: Border.all(color: Color.fromRGBO(199, 201, 217, 0.2))
                                                                ),
                                                                child: Text('+ He', style: TextStyle(color: colorBlack, fontWeight: FontWeight.w400, fontSize: 15),),
                                                              ),
                                                              addHorizontalSpace(20),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }
                                        )
                                      ),
                                      Container(
                                          child: ListView.builder(
                                              itemCount: 3,
                                              itemBuilder: (BuildContext context, int index) {
                                                return Container(
                                                  child: Text('${grammar_data['grammar'][1]['structure'][index]}', style: TextStyle(color: colorBlack),),
                                                );
                                              }
                                          )
                                      ),
                                      Container(
                                          child: ListView.builder(
                                              itemCount: 4,
                                              itemBuilder: (BuildContext context, int index) {
                                                return Container(
                                                  child: Text('${grammar_data['grammar'][2]['structure'][index]}', style: TextStyle(color: colorBlack),),
                                                );
                                              }
                                          )
                                      ),
                                    ])
                                )
                      ])
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
