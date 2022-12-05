import 'package:flutter/material.dart';
import 'package:form/Validation/signup_validation.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SignupValidation>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 222, 184),
      appBar: AppBar(
        title: const Text(
          'Form',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        backgroundColor: const Color.fromARGB(255, 232, 144, 50),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Name:',
              style: TextStyle(
                  color: Color.fromARGB(255, 23, 23, 23),
                  fontWeight: FontWeight.w300,
                  fontSize: 18),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: "Enter your Name",
              errorText: validationService.Name.error,
            ),
            onChanged: (String value) {
              validationService.changeName(value);
            },
          ),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Address:',
              style: TextStyle(
                  color: Color.fromARGB(255, 22, 22, 22),
                  fontWeight: FontWeight.w300,
                  fontSize: 18),
            ),
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: "Enter your Address",
              errorText: validationService.Address.error,
            ),
            onChanged: (String value) {
              validationService.changeAddress(value);
            },
          ),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Gender:',
              style: TextStyle(
                  color: Color.fromARGB(255, 19, 19, 19),
                  fontWeight: FontWeight.w300,
                  fontSize: 18),
            ),
          ),
          Consumer<Gendercheck>(
            builder: (_, model, child) => Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Male',
                    style: TextStyle(
                        color: Color.fromARGB(255, 19, 18, 18),
                        fontWeight: FontWeight.w100,
                        fontSize: 14),
                  ),
                ),
                Switch(
                    inactiveThumbColor:
                        const Color.fromARGB(255, 243, 200, 126),
                    activeColor: Colors.orange,
                    value: model.ischecked,
                    onChanged: ((value) => model.changeStatus())),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Female',
                    style: TextStyle(
                        color: Color.fromARGB(255, 19, 18, 18),
                        fontWeight: FontWeight.w100,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
            width: double.infinity,
          ),
          Consumer<Boolcheck>(
            builder: (_, model, child) => Row(
              children: [
                Checkbox(
                    fillColor: MaterialStateProperty.all(Colors.orange),
                    value: model.istermchecked,
                    onChanged: ((value) => model.changeStatus())),
                const Text(
                  'Agree Terms and Conditions',
                  style: TextStyle(
                      color: Color.fromARGB(255, 14, 14, 14),
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                )
              ],
            ),
          ),
          Consumer<Boolcheck>(
              builder: (_, model, child) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orangeAccent)),
                      onPressed: model.istermchecked ? (() {}) : null,
                      child: const Text('Submit'),
                    ),
                  ))
        ],
      ),
    );
  }
}
