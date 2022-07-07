// ignore_for_file: unrelated_type_equality_checks
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/models/video/sonsgol.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';
import 'package:medlegten/repositories/video_repository.dart';

import '../../widgets/dialog/custom_popup.dart';

class SonsgolPage extends BaseVideoPage {
  const SonsgolPage(this.url, this.title, {Key? key, this.data, this.contentId, this.isListening})
      : super(url, isSerial: false, movies: null, key: key);
  final Sonsgol? data;
  final String url;
  final String? title;
  final String? contentId;
  final bool? isListening;

  @override
  State<StatefulWidget> createState() {
    return SonsgolPageState();
  }
}

class SonsgolPageState extends BaseVideoPageState<SonsgolPage> with BaseVideoMixin {
  Rect position = Rect.zero;
  bool bottomIsVisible = false;
  late final ValueNotifier<bool> refreshNotifier = ValueNotifier(false);
  late String movieId;

  Null word;
  Sonsgol? data;

  int too = 0;
  bool helpCheck = false;

  List<nextNode> nodes = [];

  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];

  List<int> letterState = [];
  List<int> textState = [];
  List<int> itemList = [];
  List<int> selectedList = [];
  List<int> randomItems = [];

  @override
  void initState() {
    super.initState();
    data = widget.data;
    _initLists();

    videoPlayerController!.addListener(() async {
      if (videoPlayerController!.value.isPlaying && bottomIsVisible) {
        bottomIsVisible = false;
        word = null;
        refreshNotifier.value = !refreshNotifier.value;
      }

      if (videoPlayerController!.value.position >= getDuration(data!.endTime!)) {
        await videoPlayerController!.pause();
      }
    });
  }

  void _onFocusChange(FocusNode focusNode) {
    if (focusNode.hasFocus &&
        data!.words[currentIndex!].mainText.length == nodes[currentIndex!].controller!.text.length) {
    } else {
      setState(() {});
    }
  }

  void _initLists() {
    letterState.clear();
    textState.clear();
    itemList.clear();
    selectedList.clear();
    randomItems.clear();

    controllers.clear();
    focusNodes.clear();
    too = 0;

    for (int i = 0; i < data!.words.length; i++) {
      letterState.add(1);
      itemList.add(i);
      textState.add(1);
      var _controller = TextEditingController();
      controllers.add(_controller);
      var focusnode = FocusNode();
      focusNodes.add(focusnode);
      helpCheck = false;
    }

    if (data!.words.length > 0 && data!.words.length < 6) {
      for (int i = 0; i < data!.words.length; i++) {
        if (data!.words[i].wordValue != '') {
          selectedList.add(i);
        }
      }
      randomItems = (selectedList.toSet().toList()..shuffle()).take(1).toList();
    }

    if (data!.words.length > 5 && data!.words.length < 9) {
      for (int i = 0; i < data!.words.length; i++) {
        if (data!.words[i].wordValue != '') {
          selectedList.add(i);
        }
      }
      randomItems = (selectedList.toSet().toList()..shuffle()).take(2).toList();
    }

    if (data!.words.length > 8) {
      for (int i = 0; i < data!.words.length; i++) {
        if (data!.words[i].wordValue != '') {
          selectedList.add(i);
        }
      }
      randomItems = (selectedList.toSet().toList()..shuffle()).take(3).toList();
    }

    too += data!.words.length - randomItems.length;

    for (int cl = 0; cl < randomItems.length; cl++) {
      letterState[randomItems[cl]] = 0;
      textState[randomItems[cl]] = 0;
    }

    setState(() {});
  }

  void haih() {
    if (helpCheck == false) {
      var bi = textState.firstWhere((element) => element == 0 || element == 2);
      var d = textState.indexOf(bi);
      too += 1;
      letterState[d] = 1;
      controllers[d].text = data!.words[d].mainText.toString();

      if (data!.words.length == too) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CustomPopUpDialog(title: "Awesome", body: "You have did it", isSuccess: true);
            });
      }

      setState(() {
        helpCheck = true;
      });
    }
  }

  @override
  Widget getSonsgolCue() {
    return Expanded(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, mainAxisSize: MainAxisSize.max, children: [
          GestureDetector(
            onTap: () {
              haih();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 20),
              alignment: Alignment.topRight,
              child: Text(
                'Тусламж авах',
                style: TextStyle(color: Colors.black45),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: data!.words.asMap().keys.toList().map((i) {
                if (data!.words[i].wordValue == '' || textState[i] == 1) {
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

                  return Container(
                    padding: EdgeInsets.only(left: 2, right: 2),
                    alignment: Alignment.center,
                    width: data!.words[i].mainText.length.toDouble() * 24,
                    child: TextFormField(
                      autocorrect: false,
                      scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      onTap: () {},
                      enableInteractiveSelection: false,
                      onChanged: (value) {
                        if (data!.words[i].mainText.toLowerCase() == controllers[i].text.toLowerCase()) {
                          too += 1;
                          focusNodes[i].nextFocus();

                          setState(() {
                            letterState[i] = 1;
                          });

                          if (data!.words.length == too) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const CustomPopUpDialog(
                                      title: "Awesome", body: "You have did it", isSuccess: true);
                                }).then((value) {
                              too = 0;
                              setState(() {});
                            });
                          }
                        } else if (value.length == data!.words[i].mainText.length) {
                          focusNodes[i].nextFocus();
                          setState(() {
                            textState[i] = 2;
                          });
                        } else {
                          print(data!.words[i].mainText);
                          setState(() {
                            letterState[i] = 2;
                          });
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
                          borderSide: const BorderSide(
                            color: Colors.black26,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: letterState[i] == 0
                                ? Colors.black26
                                : letterState[i] == 1
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
        ]),
      ),
    );
  }

  @override
  Widget bottomNavigationWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: WideButton("Дараагийн үг", ColorTable.color120_100_254,
          ColorTable.color255_255_255, () async {
        data = await VideoRepository().getSonsgol(movieId: widget.contentId!);
        await videoPlayerController!.seekTo(getDuration(data!.startTime!));
        await videoPlayerController!.play();
        setState(() {
          _initLists();
        });
      }),
    );
  }
}

class nextNode {
  FocusNode? focusNode;
  int? index;
  TextEditingController? controller;

  nextNode({this.focusNode, this.index, this.controller});
}
