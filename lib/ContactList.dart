import 'package:flutter/material.dart';
import 'package:flutter_contact_list/ContactData.dart';

class ContactList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactListState();
  }
}

ContactData param;

class ContactListState extends State<ContactList> {
  List<ContactData> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact List')),
      body: Container(
        child: ListView(children: _buildList()),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              if (param != null) {
                data.add(param);
                param = null;
              }
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          }),
    );
  }

  List<Widget> _buildList() {
    return data
        .map((ContactData n) => ListTile(
              title: Text(n.name + n.surname),
              subtitle: Text(n.phone_number.toString()),
              leading: CircleAvatar(
                child: Text("${n.name[0] + " " + n.surname[0]}"),
              ),
            ))
        .toList();
  }
}

final nameController = TextEditingController();
final surnameController = TextEditingController();
final phoneNumberController = TextEditingController();

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding a contact..."),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          if (phoneNumberController.text != "") {
            param = ContactData(
              //123
                name: nameController.text,
                surname: surnameController.text,
                phone_number: int.tryParse(phoneNumberController.text));
          }
          nameController.text = "";
          surnameController.text = "";
          phoneNumberController.text = "";
          Navigator.pop(context);
        },
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name...',
            ),
          ),
          TextField(
            controller: surnameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Surname...',
            ),
          ),
          TextField(
            controller: phoneNumberController,
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone number...',
            ),
          ),
        ],
      )),
    );
  }
}
