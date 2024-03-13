import 'package:dartt_tot/commons/components/body_commons.dart';
import 'package:dartt_tot/consts.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBar,
        drawer: drawerCustom,
        body: const BodyCommon(widget: Column(), title: "Home"));
  }
}
