import 'package:exam_app/constant.dart';
import 'package:exam_app/model/model.dart';
import 'package:exam_app/screens/exam_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key, required this.question}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();

  final List<Question> question;
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late PageController _controller;
  int _questionNumber = 1;
  int _score = 0;
  bool _isLocked = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(mediumPading),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: bigPading),
            Text(
              'Question $_questionNumber/ ${widget.question.length}',
              style: const TextStyle(fontSize: 30),
            ),
            const Divider(thickness: 1, color: Colors.grey),
            Expanded(
              child: PageView.builder(
                itemCount: widget.question.length,
                controller: _controller,
                itemBuilder: (context, index) {
                  final _question = widget.question[index];
                  return buildQuestion(_question);
                },
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            SizedBox(height: mediumPading),
            _isLocked ? buildElevatedButton() : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            question.text,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: smallPading),
        Expanded(
            child: Center(
          child: OptionWidget(
            question: question,
            onClickedOption: (option) {
              if (question.islocked) {
                return;
              } else {
                setState(() {
                  question.islocked = true;
                  question.selectedOption = option;
                });
                _isLocked = question.islocked;
                if (question.selectedOption!.isCorrect) {
                  _score++;
                }
              }
            },
          ),
        )),
      ],
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
        onPressed: () {
          if (_questionNumber < widget.question.length) {
            _controller.nextPage(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInExpo,
            );
            setState(() {
              _questionNumber++;
              _isLocked = false;
            });
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          score: _score,
                          question: widget.question,
                        )));
          }
        },
        child: Text(_questionNumber < widget.question.length
            ? 'Next Page'
            : 'See the Result'));
  }
}

class OptionWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;
  const OptionWidget(
      {Key? key, required this.question, required this.onClickedOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: question.options
              .map((option) => buildOption(context, option))
              .toList(),
        ),
      );

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: smallPading),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              option.text,
              style: const TextStyle(fontSize: 32),
            ),
            SizedBox(width: bigPading),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.islocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }
}

class ResultPage extends StatelessWidget {
  final int score;
  const ResultPage({Key? key, required this.score, required this.question})
      : super(key: key);
  final List<Question> question;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: const Text('Your Score'),
        content: Text(
          'You got $score/${question.length}',
          style: const TextStyle(
              fontSize: 40, fontWeight: FontWeight.w300, color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => const HomePage()));
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
