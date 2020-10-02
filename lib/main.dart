import 'package:flutter/material.dart';

import 'ContactList.dart';

void main() =>runApp(ContactListApp());

class ContactListApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ContactList',
      theme: ThemeData(
        primarySwatch:Colors.red
      ),
      home: ContactList()
    );
  }
}