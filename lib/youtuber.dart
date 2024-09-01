import 'package:expenses_tracker/question.dart';
import 'package:expenses_tracker/youtubePlayback.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Youtuber extends StatelessWidget {
  const Youtuber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Youtubeplayback(),
            // , option1: option1, option2: option2, option3: option3, option4: option4)

            // Call this question function any number of times with respective question and options as string

            Question(
              question: "What is your name?",
              option1: "ABC",
              option2: "XYZ",
              option3: "Youtube",
              option4: "asdjkasjdk",
            ),
            Question(
              question: "What is your name?",
              option1: "ABC",
              option2: "XYZ",
              option3: "Youtube",
              option4: "asdjkasjdk",
            ),
            Question(
              question: "What is your name?",
              option1: "ABC",
              option2: "XYZ",
              option3: "Youtube",
              option4: "asdjkasjdk",
            ),
            Question(
              question: "What is your name?",
              option1: "ABC",
              option2: "XYZ",
              option3: "Youtube",
              option4: "asdjkasjdk",
            ),
            Question(
              question: "What is your name?",
              option1: "ABC",
              option2: "XYZ",
              option3: "Youtube",
              option4: "asdjkasjdk",
            ),
            Question(
              question: "What is your name?",
              option1: "ABC",
              option2: "XYZ",
              option3: "Youtube",
              option4: "asdjkasjdk",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.greaterthan_square_fill),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
