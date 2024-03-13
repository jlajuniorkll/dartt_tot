import 'package:dartt_tot/models/subgrupo.dart';
import 'package:dartt_tot/pages/issues/components/issue_form.dart';
import 'package:dartt_tot/pages/issues/components/issues_listtile.dart';
import 'package:dartt_tot/pages/issues/controller/issues_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RIssuesListTile extends StatelessWidget {
  RIssuesListTile(
      {super.key, required this.subGupoReceived, required this.indexSBGruoup});

  SubGrupo subGupoReceived;
  int indexSBGruoup;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            subGupoReceived.title!,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          )),
          Text(subGupoReceived.obs!),
          if (subGupoReceived.issue!.isNotEmpty)
            ReorderableListView.builder(
              key: UniqueKey(),
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(8, 8, 32, 8),
              itemCount: subGupoReceived.issue!.length,
              itemBuilder: (_, index) {
                return IssuesListTile(
                  key: ValueKey(index),
                  issuesReceived: subGupoReceived.issue![index],
                  indexIssue: index,
                );
              },
              onReorder: (oldIndex, newIndex) {
                Get.find<IssuesController>()
                    .reorderIssues(oldIndex, newIndex, indexSBGruoup);
              },
            ),
          Center(
            child: Wrap(
              children: [
                IconButton(
                    onPressed: () {
                      Get.dialog(IssueForm(index: indexSBGruoup));
                    },
                    icon: const Icon(
                      Icons.add_rounded,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_rounded,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
