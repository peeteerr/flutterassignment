import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/task-model.dart';

class TaskShapeDay4 extends StatelessWidget {
  const TaskShapeDay4({Key? key, required this.model}) : super(key: key);
  final TaskModelDay3 model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.lightBlue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(model.title),
              Text(model.createdDate),
            ],
          ),
        ],
      ),
    );
  }
}
