import 'package:flutter/material.dart';

class Sms extends StatefulWidget {
  const Sms({super.key});

  @override
  State<Sms> createState() => _SmsState();
}

class _SmsState extends State<Sms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbox"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            maxLength: 20,
            controller: TextEditingController(),
            decoration: InputDecoration(
                hintText: "text here", filled: true, suffix: Text("send")),
          ),
        ),
      ]),
    );
  }
}
