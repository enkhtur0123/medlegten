// ignore_for_file: unrelated_type_equality_checks

import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/models/video/sonsgol.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';
import 'package:medlegten/repositories/video_repository.dart';

import '../../widgets/dialog/custom_popup.dart';

class SonsgolPage extends BaseVideoPage {
  const SonsgolPage(
    this.url,
    this.title, {
    Key? key,
    this.data,
    this.contentId,
  }) : super(url, isSerial: false, movies: null, key: key);
  final Sonsgol? data;
  final String url;
  final String? title;
  final String? contentId;

  @override
  State<StatefulWidget> createState() {
    return SonsgolPageState();
  }
}

class SonsgolPageState extends BaseVideoPageState<SonsgolPage>
    with BaseVideoMixin {
  Rect position = Rect.zero;
  bool bottomIsVisible = false;
  late final ValueNotifier<bool> refreshNotifier = ValueNotifier(false);
  late String movieId;
  int selectedIndex = 0;
  int too = 0;
  bool helpCheck = false;

  Null word;
  Sonsgol? data;
  List<fdsfd> nodes = [];

  List<int> textState = [];
  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];
  List<bool> bsan = [];
  List<helps> xaxa = [];

  @override
  void initState() {
    super.initState();
    data = widget.data;
    _initLists();

    bool isStarted = false;

    videoPlayerController!.addListener(() async {
      if (!isStarted) {
        await videoPlayerController!.seekTo(getDuration(data!.startTime!));
        isStarted = true;
      }

      if (videoPlayerController!.value.isPlaying && bottomIsVisible) {
        bottomIsVisible = false;
        word = null;
        refreshNotifier.value = !refreshNotifier.value;
      }

      if (videoPlayerController!.value.position >=
          getDuration(data!.endTime!)) {
        await videoPlayerController!.pause();
        isStarted = false;
        videoPlayerController!.setLooping(true);
      }
    });
  }

  void _onFocusChange(FocusNode focusNode) {
    // print(data!.words[currentIndex!].mainText.length);
    // print(nodes[currentIndex!].controller!.text.length);
    if (focusNode.hasFocus &&
        data!.words[currentIndex!].mainText.length ==
            nodes[currentIndex!].controller!.text.length) {
      //focusNode.nextFocus();
    } else {
      setState(() {});
    }
  }

  void _initLists() {
    textState.clear();
    controllers.clear();
    focusNodes.clear();
    bsan.clear();
    xaxa.clear();
    too = 0;

    for (int i = 0; i < data!.words.length; i++) {
      textState.add(0);
      var _controller = TextEditingController();
      controllers.add(_controller);
      var focusnode = FocusNode();
      focusNodes.add(focusnode);
      bool _bsan = false;
      bsan.add(_bsan);
      helpCheck = false;
    }
    setState(() {});
  }

  void haih() {
    if (helpCheck == false) {
      for (int i = 0; i < data!.words.length; i++) {
        if (data!.words[i].wordValue == '') {
          xaxa.add((helps(index: i, ug: '', state: textState[i])));
          textState[i] = 1;
          xaxa[i].state = 1;
        } else {
          xaxa.add((helps(
              index: i, ug: data!.words[i].mainText, state: textState[i])));
        }
      }

      print(data!.words.length);
      print(xaxa.length);

      if (xaxa.length > 0 && xaxa.length < 6) {
        for (int i = 0; i < 1; i++) {
          var bi =
              textState.firstWhere((element) => element == 0 || element == 2);
          var d = textState.indexOf(bi);
          too += 1;
          textState[d] = 1;
          xaxa[d].state = 1;
          controllers[d].text = data!.words[d].mainText.toString();

          if (data!.words.length ==
              too +
                  data!.words
                      .where((element) => element.wordValue == '')
                      .length) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CustomPopUpDialog(
                      title: "Awesome",
                      body: "You have did it",
                      isSuccess: true);
                });
          }
          // print(xaxa[d].ug);
          // print(xaxa[d].state);
          // print(textState[d]);
          // print('too=' + too.toString());
        }
      }

      if (xaxa.length > 5 && xaxa.length < 9) {
        for (int i = 0; i < 2; i++) {
          var bi =
              textState.firstWhere((element) => element == 0 || element == 2);
          var d = textState.indexOf(bi);
          too += 1;
          textState[d] = 1;
          xaxa[d].state = 1;
          controllers[d].text = data!.words[d].mainText.toString();

          if (data!.words.length ==
              too +
                  data!.words
                      .where((element) => element.wordValue == '')
                      .length) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CustomPopUpDialog(
                      title: "Awesome",
                      body: "You have did it",
                      isSuccess: true);
                });
          }
          // print(xaxa[i].ug);
          // print(xaxa[i].state);
          // print(textState[i]);
          // print('too=' + too.toString());
        }
      }
      if (xaxa.length > 8) {
        for (int i = 0; i < 3; i++) {
          var bi =
              textState.firstWhere((element) => element == 0 || element == 2);
          var d = textState.indexOf(bi);
          too += 1;
          textState[d] = 1;
          xaxa[d].state = 1;
          controllers[d].text = data!.words[d].mainText.toString();

          if (data!.words.length ==
              too +
                  data!.words
                      .where((element) => element.wordValue == '')
                      .length) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CustomPopUpDialog(
                      title: "Awesome",
                      body: "You have did it",
                      isSuccess: true);
                });
          }

          // print(xaxa[i].ug);
          // print(xaxa[i].state);
          // print('too=' + too.toString());
        }
      }

      setState(() {
        helpCheck = true;
      });
    }
  }

  @override
  Widget getSonsgolCue() {
    // print(nodes.length);
    return Expanded(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  haih();
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, right: 15, bottom: 20),
                  alignment: Alignment.topRight,
                  child: Text(
                    'Тусламж авах',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                width: double.infinity,
                child: Flexible(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: data!.words.asMap().keys.toList().map((i) {
                      if (data!.words[i].wordValue.toString() == '') {
                        return Padding(
                          padding: EdgeInsets.only(top: 12, left: 5, right: 5),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  data!.words[i].mainText.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        );
                      } else {
                        Color _borderColor = Colors.black26;
                        Color _fillColor = Colors.black26;
                        // if (i == 0) {
                        //   _focusNode.requestFocus();
                        // }

                        controllers[i].addListener(() {
                          if (controllers[i].text.length ==
                              data!.words[i].mainText.length) {
                            if (controllers[i].text.toLowerCase() !=
                                data!.words[i].mainText.toLowerCase()) {
                              // controllers[i].text = data!.words[i].mainText;
                              // setState(() {
                              //   textState[i] = 2;
                              // });

                              // refreshNotifier.value = !refreshNotifier.value;
                            }
                          }
                        });

                        nodes.add(fdsfd(
                            focusNode: focusNodes[i],
                            index: currentIndex,
                            controller: controllers[i]));
                        return Container(
                          padding: EdgeInsets.only(left: 2, right: 2),
                          alignment: Alignment.center,
                          width: data!.words[i].mainText.length.toDouble() * 30,
                          child: TextFormField(
                            autocorrect: false,
                            scrollPadding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            onTap: () {
                              if (controllers[i].text.toLowerCase() !=
                                  data!.words[i].mainText.toLowerCase()) {
                                controllers[i].clear();
                              } else {
                                textState[i] = 1;
                                focusNodes[i].nextFocus();
                              }
                              print(textState.toList().toString());
                              print(data!.words[i].mainText);
                            },
                            enableInteractiveSelection: false,
                            onChanged: (value) {
                              currentIndex = i;

                              if (value.toLowerCase() ==
                                  data!.words[i].mainText.toLowerCase()) {
                                //print(value);
                                //print(data!.words[i].mainText);
                                if (bsan[i] == false) {
                                  too++;
                                  //print(too);
                                  focusNodes[i].nextFocus();
                                  setState(() {
                                    textState[i] = 1;
                                  });
                                  if (data!.words.length ==
                                      too +
                                          data!.words
                                              .where((element) =>
                                                  element.wordValue == '')
                                              .length) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const CustomPopUpDialog(
                                              title: "Awesome",
                                              body: "You have did it",
                                              isSuccess: true);
                                        }).then((value) {
                                      too = 0;
                                      setState(() {});
                                    });
                                  }
                                  bsan[i] = true;
                                }
                              } else if (value.length ==
                                  data!.words[i].mainText.length) {
                                focusNodes[i].nextFocus();
                                setState(() {
                                  textState[i] = 2;
                                });
                              } else {
                                print(textState[i]);
                                print(data!.words[i].mainText);
                              }
                            },
                            controller: controllers[i],
                            focusNode: focusNodes[i],
                            maxLength: data!.words[i].mainText.length,
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              contentPadding: EdgeInsets.all(0),
                              hintText: '',
                              alignLabelWithHint: true,
                              filled: true,
                              fillColor: _fillColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: textState[i] == 0
                                      ? Colors.black26
                                      : textState[i] == 1
                                          ? Colors.green
                                          : Colors.redAccent,
                                  width: 1.0,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        );
                      }
                    }).toList(),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  @override
  Widget bottomNavigationWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: WideButton(
          "Өөрчлөх", ColorTable.color120_100_254, ColorTable.color255_255_255,
          () async {
        data = await VideoRepository().getSonsgol(movieId: widget.contentId!);
        setState(() {
          _initLists();
        });
      }),
    );
  }
}

class fdsfd {
  FocusNode? focusNode;
  int? index;
  TextEditingController? controller;

  fdsfd({this.focusNode, this.index, this.controller});
}

class helps {
  String? ug;
  int? index;
  int? state;
  helps({this.index, this.ug, this.state});
}
