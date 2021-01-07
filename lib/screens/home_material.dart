import 'package:flutter/material.dart';
import '../models/user.dart';

class HomeMaterial extends StatefulWidget {
  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Builder(
          builder: (context) => Form(
            key: _formKey,
            // main container for form fields.
            child: Column(
              // Each child in our column will be a different component.
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'First Name'),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your first name";
                    }
                  },
                  onSaved: ((val) => setState(() => _user.firstName = val)),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Last Name'),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your last name";
                    }
                  },
                  onSaved: ((val) => setState(() => _user.lastName = val)),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: Text('Subscribe'),
                ),
                SwitchListTile(
                    title: const Text("Monthly news!"),
                    value: _user.newsLetter,
                    onChanged: (bool val) {
                      setState(() => _user.newsLetter = val);
                    }),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: Text('Interests'),
                ),
                CheckboxListTile(
                    title: const Text("Cooking"),
                    value: _user.passions[User.PassionCooking],
                    onChanged: (bool val) => setState(
                        () => _user.passions[User.PassionCooking] = val)),
                CheckboxListTile(
                    title: const Text("Hiking"),
                    value: _user.passions[User.PassionHiking],
                    onChanged: (bool val) => setState(
                        () => _user.passions[User.PassionHiking] = val)),
                CheckboxListTile(
                    title: const Text("Traveling"),
                    value: _user.passions[User.PassionTraveling],
                    onChanged: (bool val) => setState(
                        () => _user.passions[User.PassionTraveling] = val)),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form.validate()) {
                        form.save();
                        _user.save();
                        _showDialog(context);
                      }
                    },
                    child: Text('Save'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_showDialog(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Submitting form')));
}
