import 'package:flutter/material.dart';
import 'package:personal_project/Button.dart';
import 'package:get/get.dart';
import 'package:personal_project/homeController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeController controller  = Get.find();
  // var userQuestion = '';
  // var userAnswer = '';
  // var Ans = '';
  // var operator = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body:  Column(children: <Widget>[
          GetBuilder<HomeController>(
          builder: (controller) =>
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.userQuestion,
                        style: const TextStyle(fontSize: 20),
                      )),
                  Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        controller.userAnswer,
                        style: const TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),),
            Expanded(
                flex: 2,
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 7,
                            mainAxisExtent: 85),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Button(
                          onTapped: () {
                            controller.setAns("");
                            controller.setUserAnswer("");
                            controller.setUserQuestion("");
                          },
                          text: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white,
                        );
                      }
                      if (index == 1) {
                        return Button(
                          onTapped: () {
                            controller.setUserQuestion(
                                controller.userQuestion.substring(
                                    0, controller.userQuestion.length - 1));
                          },
                          text: buttons[index],
                          color: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                      return Button(
                        onTapped: () {
                          if (buttons[index] == "ANS") {
                            controller.setUserQuestion(controller.Ans);
                          } else if (buttons[index] == "=") {
                            switch (controller.operator) {
                              case "+":
                                {
                                  controller.setUserAnswer((double.parse(
                                              controller.Ans) +
                                          double.parse(controller.userQuestion))
                                      .toString());
                                }
                                break;

                              case "-":
                                {
                                  controller.setUserAnswer((double.parse(
                                              controller.Ans) -
                                          double.parse(controller.userQuestion))
                                      .toString());
                                }
                                break;
                              case "x":
                                {
                                  controller.setUserAnswer((double.parse(
                                              controller.Ans) *
                                          double.parse(controller.userQuestion))
                                      .toString());
                                }
                                break;
                              case "/":
                                {
                                  try {
                                    controller.setUserAnswer(
                                        (double.parse(controller.Ans) /
                                                double.parse(
                                                    controller.userQuestion))
                                            .toString());
                                  } catch (e) {
                                    controller.setUserAnswer(e.toString());
                                    controller.setUserQuestion("");
                                    controller.setOperator("");
                                  }
                                }
                                break;
                              case "%":
                                {
                                  controller.setUserAnswer((double.parse(
                                              controller.Ans) %
                                          double.parse(controller.userQuestion))
                                      .toString());
                                }
                                break;

                              default:
                                {
                                  controller
                                      .setUserAnswer(controller.userQuestion);
                                  controller.setAns(controller.userAnswer);
                                }
                                break;
                            }
                          } else if (isOperator(buttons[index])) {
                            if (controller.userAnswer != "") {
                              controller.setAns(controller.userAnswer);
                            } else {
                              controller.setAns(controller.userQuestion);
                            }
                            controller.setOperator(buttons[index]);
                            controller.setUserQuestion(buttons[index]);
                          } else {
                            if (isOperator(controller.userQuestion)) {
                              controller.setUserQuestion(buttons[index]);
                            } else {
                              controller.updateUserQuestion(buttons[index]);
                            }
                          }
                        },
                        text: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.deepPurple
                            : Colors.white,
                        textColor: !isOperator(buttons[index])
                            ? Colors.deepPurple
                            : Colors.white,
                      );
                    }))
          ]),
      );
  }
}

bool isOperator(String x) {
  if (x == "%" || x == "x" || x == "/" || x == "-" || x == "+" || x == "=") {
    return true;
  } else {
    return false;
  }
}
