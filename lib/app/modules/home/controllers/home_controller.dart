import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trivia_app/app/models/question_model.dart';
import 'package:trivia_app/app/modules/result_screen/result_screen.dart';
import 'package:trivia_app/app/routes/app_pages.dart';
import 'package:trivia_app/constants/colors.dart';

// ignore: deprecated_member_use
class HomeController extends GetxController with SingleGetTickerProviderMixin {
  //TODO: Implement HomeController

  final count = 0.obs;
  RxBool selected = false.obs;

  String name = '';
  List _items = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('lib/api/questions.json');
    final data = await json.decode(response);

    _items = data["questions"].obs;
  }

  //question variables
  int get countOfQuestion => _questionsList.length;
  final List<QuestionModel> _questionsList = [
    QuestionModel(
      id: 1,
      question: "Which is the tallest mountain?",
      answer: 0,
      options: ['Mt. Everest', 'Manaslu', 'K2', 'Annapurna'],
    ),
    QuestionModel(
      id: 2,
      question: "What is the largest island in the Mediterranean Sea?",
      answer: 1,
      options: ['Venice', 'Sicily', 'Gerogia', 'Mudane'],
    ),
    QuestionModel(
      id: 3,
      question: "How many pairs of ribs are in a typical human body?",
      answer: 1,
      options: ['22', '12', '1', '13'],
    ),
    QuestionModel(
      id: 4,
      question: "Where did the croissant originate?",
      answer: 1,
      options: ['paris', 'budapest', 'kathmandu', 'tokyo'],
    ),
    QuestionModel(
      id: 5,
      question: "What drugs are derived from the poppy plant?",
      answer: 3,
      options: ['Heroin', 'Brown sugar', 'Cocaine', 'Opium'],
    ),
    QuestionModel(
      id: 6,
      question: "Which continent includes Cambodia?",
      answer: 1,
      options: ['Africa', 'Asia', 'South America', 'Australia'],
    ),
    QuestionModel(
      id: 7,
      question: "Which is the second largest country in Iberia?",
      answer: 1,
      options: ['nepal', 'Portugal', 'brazil', 'spain'],
    ),
    QuestionModel(
      id: 8,
      question: "What company owns the trademark to the Ouija board?",
      answer: 2,
      options: ['puma', 'nike', 'Hasbro', 'blackhorse'],
    ),
    QuestionModel(
      id: 9,
      question: "Which blood type is known as the universal recipient?",
      answer: 1,
      options: ['AB', 'A', 'B', 'O'],
    ),
    QuestionModel(
      id: 10,
      question: "Which sea creature has an eye the size of a basketball?",
      answer: 1,
      options: ['Goldfish', 'The Giant Squid', 'Whale', 'Shark'],
    ),
    QuestionModel(
      id: 11,
      question: "What region of the brain controls appetite?",
      answer: 0,
      options: ['The Hypothalamus', 'Spine', 'The right', 'Marooo bone'],
    ),
    QuestionModel(
      id: 12,
      question: "How many years can a snail sleep?",
      answer: 1,
      options: ['3', '1', '2', '9'],
    ),
    QuestionModel(
      id: 13,
      question: "Who was the first woman in space?",
      answer: 0,
      options: [
        'Galentina Tereshkova',
        'Valentina Tereshkova',
        'Teressa',
        'Victoria'
      ],
    ),
    QuestionModel(
      id: 14,
      question: "Which English city was Alfred the Great's capital city?",
      answer: 2,
      options: ['Venice', 'Manchester', 'Winchester', 'London'],
    ),
    QuestionModel(
      id: 15,
      question: "What color are flamingos when they hatch out of the egg?",
      answer: 1,
      options: ['Pink', 'Gray', 'red', 'black'],
    ),
    QuestionModel(
      id: 16,
      question: "Turkey is considered to be part of which continent?",
      answer: 3,
      options: ['paris', 'europe', 'africa', 'asia'],
    ),
    QuestionModel(
      id: 17,
      question: "What company was originally named Blue Ribbon Sports?",
      answer: 1,
      options: ['Addidas', 'Nike', 'Puma', 'New balance'],
    ),
    QuestionModel(
      id: 18,
      question: "Which Asian capital used to be called Peking?",
      answer: 0,
      options: ['Beijing', 'Tokyo', 'kathmandu', 'thimpu'],
    ),
    QuestionModel(
      id: 19,
      question:
          "Which among the following team was first winner of “World Cup Hockey” ?",
      answer: 1,
      options: ['India', 'Pakistan', 'England', 'Spain'],
    ),
    QuestionModel(
      id: 20,
      question:
          "Between which two teams did FIFA organise a Match of the Century in 2004?",
      answer: 2,
      options: [
        'Germany and France',
        'Brazil and German',
        'France and Brazil',
        'Italy and Brazil'
      ],
    ),
  ];

  List<QuestionModel> get questionsList => [..._questionsList];
  bool _isPressed = false;
  bool get isPressed => _isPressed; //To check if the answer is pressed
  double _numberOfQuestion = 1;
  double get numberOfQuestion => _numberOfQuestion;
  int? _selectAnswer;
  int? get selectAnswer => _selectAnswer;
  int? _correctAnswer;
  int _countOfCorrectAnswers = 0;
  int get countOfCorrectAnswers => _countOfCorrectAnswers;

  //map for check if the question has been answered
  final Map<int, bool> _questionIsAnswerd = {};
  //page view controller
  late PageController pageController;
  //timer
  Timer? _timer;
  final maxSec = 10;
  final RxInt _sec = 10.obs;
  RxInt get sec => _sec;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetAnswer();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  //get final score
  double get scoreResult {
    return _countOfCorrectAnswers * 100 / _questionsList.length;
  }

  void checkAnswer(QuestionModel questionModel, int selectAnswer) {
    _isPressed = true;

    _selectAnswer = selectAnswer;
    _correctAnswer = questionModel.answer;

    if (_correctAnswer == _selectAnswer) {
      _countOfCorrectAnswers++;
    }
    stopTimer();
    _questionIsAnswerd.update(questionModel.id, (value) => true);
    Future.delayed(const Duration(seconds: 3)).then((value) => nextQuestion());
    update();
  }

  //check if the question has been answered
  bool checkIsQuestionAnswered(int quesId) {
    return _questionIsAnswerd.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  void nextQuestion() {
    if (_timer != 0 || _timer!.isActive) {
      stopTimer();
    }

    if (pageController.page == _questionsList.length - 1) {
      // Get.offAndToNamed(ResultScreen);
      Get.toNamed(Routes.RESULTS);
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

      startTimer();
    }
    _numberOfQuestion = pageController.page! + 2;
    update();
  }

  //called when start again quiz
  void resetAnswer() {
    for (var element in _questionsList) {
      _questionIsAnswerd.addAll({element.id: false});
    }
    update();
  }

  //get right and wrong color
  Color getColor(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Colors.green.shade700;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Colors.red.shade700;
      }
    }
    return AppColor.borderClr;
  }

  //het right and wrong icon
  IconData getIcon(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  void startTimer() {
    resetTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec.value > 0) {
        _sec.value--;
      } else {
        stopTimer();
        nextQuestion();
      }
    });
  }

  void resetTimer() => _sec.value = maxSec;

  void stopTimer() => _timer?.cancel();
  //call when start again quiz
  void startAgain() {
    _correctAnswer = null;
    _countOfCorrectAnswers = 0;
    resetAnswer();
    _selectAnswer = null;
    Get.offAllNamed(Routes.SPLASH_SCREEN);
  }
}
