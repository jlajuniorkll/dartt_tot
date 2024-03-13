import 'package:dartt_tot/page_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final appBar = AppBar(
  actionsIconTheme: const IconThemeData(color: Colors.white),
  iconTheme: const IconThemeData(color: Colors.white),
  backgroundColor: Colors.transparent,
  elevation: 0,
);

final drawerCustom = Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
          decoration: BoxDecoration(color: Color(0xFF252C4A)),
          child: Text(
            'Dartt-Tot',
            style: TextStyle(color: Colors.white),
          )),
      ExpansionTile(
        title: const Text("Check List"),
        children: [
          ListTile(
            title: const Text("Perguntas"),
            onTap: () => Get.toNamed(PageRoutes.issues),
          ),
          ListTile(
            title: const Text("Respostas"),
            onTap: () => Get.toNamed(PageRoutes.listAnswer),
          ),
        ],
      )
    ],
  ),
);
