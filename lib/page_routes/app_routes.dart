import 'package:dartt_tot/pages/answer/answer_list.dart';
import 'package:dartt_tot/pages/answer/answer_screen.dart';
import 'package:dartt_tot/pages/answer/binding/answer_binding.dart';
import 'package:dartt_tot/pages/answer/binding/listanswer_binding.dart';
import 'package:dartt_tot/pages/answer/components/forms/form_answerchek.dart';
import 'package:dartt_tot/pages/home/home_screen.dart';
import 'package:dartt_tot/pages/issues/binding/issues_binding.dart';
import 'package:dartt_tot/pages/issues/view/issues_form.dart';
import 'package:dartt_tot/pages/issues/view/issues_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
        name: PageRoutes.home,
        page: () => const HomeScreen(),
        bindings: [IssuesBinding(), CadAnswewrBinding()]),
    GetPage(
      name: PageRoutes.cadAnswer,
      page: () => const FormAnswer(),
    ),
    GetPage(
      name: PageRoutes.listAnswer,
      page: () => const ListAnswer(),
    ),
    GetPage(
        name: PageRoutes.answer,
        page: () => const ScreenAnswer(),
        bindings: [AnswerBinding()]),
    GetPage(
      name: PageRoutes.issues,
      page: () => const IssuesScreen(),
    ),
    GetPage(
      name: PageRoutes.issuesForm,
      page: () => IssuesForm(),
    )
  ];
}

abstract class PageRoutes {
  static const String home = '/';
  static const String answer = '/answer';
  static const String listAnswer = '/list-answer';
  static const String cadAnswer = '/form-answer';
  static const String issues = '/issues';
  static const String issuesForm = '/issues-form';
}
