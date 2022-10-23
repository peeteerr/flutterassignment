import 'package:flutter/material.dart';
import 'package:it/views/Tasks/Day2/day2.dart';
import '../Tasks/Day3/day3.dart';
import '../Tasks/Day4/day4.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const sizedbox = SizedBox(width: 15);
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: Center(
            child: Text(
              'Welcome To ITI \nFLUTTER ASSIGNMENTS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Please Select Assignment Day',
            style: TextStyle(fontSize: 18, decoration: TextDecoration.underline),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, DAY2.router);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.black87),
                ),
                child: const Text('Day 2'),
              ),
              sizedbox,
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Day3.router);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.black87),
                ),
                child: const Text('Day 3'),
              ),
              sizedbox,
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Day4.router);
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.black87)),
                child: const Text('Day4'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
            child: const Text(
              'By Peter Abdo 😅 \n code can be improved and be cleaner so sorry about that  \n ',
              style: TextStyle(color: Colors.amber, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
