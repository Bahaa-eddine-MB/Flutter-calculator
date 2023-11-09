import 'package:get/get.dart';
import 'package:personal_project/HomePage.dart';

class HomeController extends GetxController {
  String userAnswer = "";
  String userQuestion = "";
  String Ans = '';
  String operator = '';

  void setUserQuestion(var x) {
    userQuestion = x;
    update();
  }

  updateUserQuestion(var x) {
    userQuestion += x;
    update();
  }

  void setUserAnswer(var x) {
    userAnswer = x;
    update();
  }

  void setAns(var x) {
    Ans = x;
    update();
  }

  void setOperator(var x) {
    operator = x;
    update();
  }
}
