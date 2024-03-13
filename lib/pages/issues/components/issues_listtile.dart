import 'package:dartt_tot/models/issue.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IssuesListTile extends StatelessWidget {
  IssuesListTile(
      {super.key, required this.issuesReceived, required this.indexIssue});

  Issue issuesReceived;
  int indexIssue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              issuesReceived.title!,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
          Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 0, 2, 0),
                child: Icon(
                  Icons.question_mark,
                  color: issuesReceived.req! ? Colors.blue : Colors.grey,
                  size: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
                child: Icon(Icons.question_answer,
                    color: issuesReceived.reqObs! ? Colors.blue : Colors.grey,
                    size: 14),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 0, 32, 0),
                child: Icon(Icons.photo,
                    color: issuesReceived.reqMidia! ? Colors.blue : Colors.grey,
                    size: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
