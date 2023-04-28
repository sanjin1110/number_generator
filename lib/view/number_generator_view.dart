// import 'package:number_generator/model/number_gen.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class RandomNumberButton extends StatefulWidget {
  const RandomNumberButton({super.key});

  @override
  RandomNumberButtonState createState() => RandomNumberButtonState();
}

class RandomNumberButtonState extends State<RandomNumberButton> {
  int number1 = 0;
  int number2 = 0;

  int correctCount = 0;
  int incorrectCount = 0;

  @override
  void initState() {
    super.initState();
    generateRandomNumber();
  }

  void generateRandomNumber() {
    setState(() {
      number1 = Random().nextInt(100);
      number2 = Random().nextInt(100);
    });
  }

  void checkAnswer(bool isButton1) {
    if (isButton1 && number1 > number2 || !isButton1 && number2 > number1) {
      setState(() {
        correctCount++;
      });
    } else if (isButton1 && number2 > number1 ||
        !isButton1 && number1 > number2) {
      setState(() {
        incorrectCount++;
      });
    }
    if (correctCount + incorrectCount > 10) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const RandomNumberButton()));
    }
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Number"),
      ),
      body: SizedBox(
        height: 500,
        child: Column(
          children: [
            SizedBox(
              height: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        checkAnswer(true);
                      },
                      child: Text("$number1"),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        checkAnswer(false);
                      },
                      child: Text("$number2"),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 100,
              width: 280,
              child: Text('Correct Answer : $correctCount'),
            ),
            SizedBox(
              height: 100,
              width: 280,
              child: Text("Incorrect Answer : $incorrectCount"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RandomNumberButton()),
                );
              },
              child: const Text("Restart Game"),
            ),
          ],
        ),
      ),
    );
  }
}
