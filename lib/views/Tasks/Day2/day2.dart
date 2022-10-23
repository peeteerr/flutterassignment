import 'package:flutter/material.dart';
import 'package:it/views/Tasks/Day2/dummydata.dart';

import 'details.dart';

class DAY2 extends StatelessWidget {
  const DAY2({Key? key}) : super(key: key);
  static const String router = 'Day2';
  @override
  Widget build(BuildContext context) {
    final dummyData = Dummy().getAllData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Post By  user  > ${dummyData[index]['userId'].toString()}',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('post title >> \n\n ${dummyData[index]['title']}'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.amber,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Details.router, arguments: dummyData[index]);
                      },
                      child: const Text('See Details'),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
