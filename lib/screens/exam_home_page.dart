import 'package:exam_app/model/model.dart';
import 'package:exam_app/screens/exam_page/question_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _controller;
  double pixels = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        pixels = _controller.position.pixels;
      });

      debugPrint('$pixels');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFEAEBF3),
      body: SizedBox(
        height: size.height + 230,
        child: NestedScrollView(
            controller: _controller,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const SliverAppBar(
                    backgroundColor: Colors.deepOrange,
                    expandedHeight: 150,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(28)),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.only(bottom: 40),
                      centerTitle: true,
                      title: Text(
                        'Quiz App',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 38),
                      ),
                    ),
                  )
                ],
            body: ListView(
              children: [
                BodyWidget(pixels: pixels),
              ],
            )),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({
    Key? key,
    required this.pixels,
  }) : super(key: key);
  final double pixels;
  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => QuestionWidget(
                      question: mathQuestions,
                    )));
          },
          child: CustomLessonButton(
            pixels: widget.pixels,
            animateValue: 0,
            image: 'assets/math.jpg',
            alignmentGeometry: Alignment.topLeft,
          ),
        ),
        SizedBox(height: size.height / 22),
        InkWell(
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => QuestionWidget(
                      question: chemistryQuestions,
                    )));
          },
          child: CustomLessonButton(
            pixels: widget.pixels,
            animateValue: 40,
            image: 'assets/chemistry.jpg',
            alignmentGeometry: Alignment.topRight,
          ),
        ),
        SizedBox(height: size.height / 22),
        InkWell(
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => QuestionWidget(
                      question: pyhsicsQuestions,
                    )));
          },
          child: CustomLessonButton(
            pixels: widget.pixels,
            animateValue: 80,
            image: 'assets/pyhsics.jpg',
            alignmentGeometry: Alignment.topLeft,
          ),
        ),
        SizedBox(height: size.height / 22),
        InkWell(
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => QuestionWidget(
                      question: historyQuestions,
                    )));
          },
          child: CustomLessonButton(
            pixels: widget.pixels,
            animateValue: 120,
            image: 'assets/history.jpg',
            alignmentGeometry: Alignment.topRight,
          ),
        ),
        SizedBox(height: size.height / 22),
        InkWell(
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => QuestionWidget(
                      question: languageQuestions,
                    )));
          },
          child: CustomLessonButton(
            pixels: widget.pixels,
            animateValue: 150,
            image: 'assets/language.jpg',
            alignmentGeometry: Alignment.topLeft,
          ),
        ),
        SizedBox(height: size.height / 22),
      ],
    );
  }
}

class CustomLessonButton extends StatelessWidget {
  const CustomLessonButton({
    Key? key,
    this.alignmentGeometry = Alignment.topLeft,
    required this.image,
    required this.pixels,
    required this.animateValue,
  }) : super(key: key);

  final String image;
  final AlignmentGeometry? alignmentGeometry;

  final double pixels;
  final int animateValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: alignmentGeometry!,
      children: [
        Container(
          height: size.height / 7,
          width: size.width / 3.2,
          decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20))),
        ),
        AnimatedPadding(
          duration: const Duration(milliseconds: 1000),
          padding: pixels <= animateValue
              ? const EdgeInsets.only(top: 7)
              : const EdgeInsets.only(top: 7, right: 20, left: 20),
          child: Container(
            height: size.height / 8,
            width: size.width / 1.2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(image, fit: BoxFit.cover)),
          ),
        ),
      ],
    );
  }
}
