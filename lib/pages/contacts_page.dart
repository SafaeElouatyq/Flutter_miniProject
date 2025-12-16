
import 'package:flutter/material.dart';
import '../models/contact.dart';


class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> contacts=[
    Contact(name:"safae",phone:"1234567890"),
  ];

  List<Contact> filteredContacts =[];

  final TextEditingController searchController = TextEditingController();

  @override
  void initState(){
    super.initState();
    filteredContacts = contacts;
  }

  void filterContacts(String query){
    final filtered =contacts.where((contact){
      final nameLower = contact.name.toLowerCase();
      final phoneLower= contact.phone.toLowerCase();
      final queryLower = query.toLowerCase();

      return nameLower.contains(queryLower) || phoneLower.contains(queryLower);
    }).toList();

    setState(() {
      filteredContacts = filtered;
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts ${contacts.length}"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller:searchController,
            decoration: InputDecoration(
              labelText: "Search by name or phone",
              border: OutlineInputBorder(),
            ),
            onChanged: filterContacts,
          ),
          SizedBox(height: 10),
          Expanded(child: ListView.builder(itemCount: filteredContacts.length,itemBuilder: (context,index){
            final contact = filteredContacts[index];
            return ListTile(
              title: Text(contact.name),
              subtitle: Text(contact.phone),
            );
          },),)
        ],
      ),

    );
  }





}
