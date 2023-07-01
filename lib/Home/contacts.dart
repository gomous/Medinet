import 'package:flutter/material.dart';


class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  var color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text("Contacts Page"),
      ),
    );
  }
}

