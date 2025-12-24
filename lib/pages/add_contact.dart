import 'package:flutter/material.dart';
import '../models/contact.dart';

class AddContactPage extends StatefulWidget {
  final Contact? contact;

  const AddContactPage({super.key, this.contact});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();


    if (widget.contact != null) {
      nameController.text = widget.contact!.name;
      phoneController.text = widget.contact!.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isEdit = widget.contact != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Contact" : "Add Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration:  InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a phone number";
                  }
                  if (value.length < 10) {
                    return "Phone number must be 10 digits";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (isEdit) {
                      // update
                      widget.contact!.name = nameController.text;
                      widget.contact!.phone = phoneController.text;
                      Navigator.pop(context, widget.contact);
                    } else {
                      // add
                      final newContact = Contact(
                        name: nameController.text,
                        phone: phoneController.text,
                      );
                      Navigator.pop(context, newContact);
                    }
                  }
                },
                child: Text(isEdit ? "Update" : "Add Contact"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
