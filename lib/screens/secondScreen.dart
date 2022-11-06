import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iron_ore_frontend/providers/mainStateProvider.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter IP address'),
        backgroundColor: context.watch<MainState>().accentColour,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Current address: ${context.watch<MainState>().server_address}",
            ),
            FormWidget(),
          ],
        ),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidget();
}

class _FormWidget extends State<FormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter the desired server address',
              contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              context.read<MainState>().setAddress(value);
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: Center(child: const Text('Submit')),
            ),
          ),
        ],
      ),
    );
  }
}
