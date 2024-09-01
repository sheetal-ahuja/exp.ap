import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  const Question({
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    super.key,
  });

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int selectedOption = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      height: 160,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Question text
          Text(
            "Ques: ${widget.question}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedOption = selectedOption == 1 ? -1 : 1;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 2,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 5,
              ),
              // height: 23,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: selectedOption == 1 ? Colors.blue : Colors.transparent,
              ),
              child: Text(
                "A) ${widget.option1}",
                softWrap: true,
                style: TextStyle(
                  color: selectedOption == 1 ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedOption = selectedOption == 2 ? -1 : 2;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 2,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 5,
              ),
              // height: 23,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: selectedOption == 2 ? Colors.blue : Colors.transparent,
              ),
              child: Text(
                "B) ${widget.option2}",
                softWrap: true,
                style: TextStyle(
                  color: selectedOption == 2 ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedOption = selectedOption == 3 ? -1 : 3;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 2,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 5,
              ),
              // height: 23,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: selectedOption == 3 ? Colors.blue : Colors.transparent,
              ),
              child: Text(
                "C) ${widget.option3}",
                softWrap: true,
                style: TextStyle(
                  color: selectedOption == 3 ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedOption = selectedOption == 4 ? -1 : 4;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 2,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 5,
              ),
              // height: 23,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: selectedOption == 4 ? Colors.blue : Colors.transparent,
              ),
              child: Text(
                "D) ${widget.option4}",
                softWrap: true,
                style: TextStyle(
                  color: selectedOption == 4 ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
