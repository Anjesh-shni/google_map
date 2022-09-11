import 'package:flutter/material.dart';
import '../../model/model.dart';

class Searchapge extends StatefulWidget {
  const Searchapge({Key? key}) : super(key: key);

  @override
  State<Searchapge> createState() => _SearchapgeState();
}

class _SearchapgeState extends State<Searchapge> {
  final formkey = GlobalKey<FormState>();
  String? name;

  void addToContact(Contact contact) {
    debugPrint('name: ${contact.name}');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Form(
        key: formkey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "name"),
                      keyboardType: TextInputType.name,
                      onSaved: (value) => name = value!,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Search")),
          ],
        ),
      ),
    );
  }
}
