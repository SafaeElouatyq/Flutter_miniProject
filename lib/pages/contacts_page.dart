import 'package:flutter/material.dart';
import '../models/contact.dart';
import 'add_contact.dart';

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
    final q = query.toLowerCase();
    setState(() {
      filteredContacts = contacts.where((c) {
        return c.name.toLowerCase().contains(q) ||
            c.phone.toLowerCase().contains(q);
      }).toList();
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
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: "Search by name or phone",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          filterContacts('');
                        },
                      ),
                    ),
                    onChanged: filterContacts,
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  mini: true,
                  child: const Icon(Icons.add),
                  onPressed: () async {
                    final newContact = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AddContactPage()),
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              final updated = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddContactPage(contact: contact),
                                ),
                              );

                              if (updated != null) {
                                setState(() {
                                  filteredContacts = contacts;
                                });
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                contacts.remove(contact);
                                filteredContacts = contacts;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
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
