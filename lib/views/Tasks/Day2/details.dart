import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);
  static const String router = 'Details';
  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Text('user id > ${post['userId']} \n\n post id > ${post['id']}  \n\n post>>  \n\n ${post['body']}'),
      ),
    );
  }
}
