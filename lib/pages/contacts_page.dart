import 'package:flutter/material.dart';
import 'package:flutter_mini_project/pages/add_contact.dart';
import '../models/contact.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> contacts = [
    Contact(name: "Safae", phone: "1234567890"),
    Contact(name: "Mustapha", phone: "9876543210"),
  ];

  List<Contact> filteredContacts = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void filterContacts(String query) {
    final filtered = contacts.where((contact) {
      final nameLower = contact.name.toLowerCase();
      final phoneLower = contact.phone.toLowerCase();
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
        title: Text("Contacts (${contacts.length})"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: "Search by name or phone",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          filterContacts('');
                        },
                      ),
                    ),
                    onChanged: filterContacts,
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  mini: true,
                  child: Icon(Icons.add),
                  onPressed: () async {
                    final newContact = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddContactPage()),
                    );

                    if (newContact != null) {
                      setState(() {
                        contacts.add(newContact);
                        filteredContacts = contacts;
                      });
                    }
                  },
                ),
              ],
            ),
          ),


          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = filteredContacts[index];
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(contact.name[0].toUpperCase()),
                      ),
                      title: Text(contact.name),
                      subtitle: Text(contact.phone),
                      trailing: IconButton(icon: Icon(Icons.delete),onPressed: (){setState(() {
                        contacts.remove(contact);
                        filteredContacts = contacts;
                      });},),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}