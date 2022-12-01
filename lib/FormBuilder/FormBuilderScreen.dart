import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../Home/HomeScreen.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  final _formKey = GlobalKey<FormBuilderState>();
  List gender = ["Male", "Female", "Others"];

  String? username;
  String? password;
  String? genderselected;
  String? DateTime;
  String? Slider;
  String? Email;
  String? Phone;
  String? RadioButton;
  String? Segments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Details"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: "username",
                  decoration: InputDecoration(
                      hintText: "Enter Your UserName", labelText: "username"),
                  readOnly: false,
                  enabled: true,
                  onChanged: (value) {
                    setState(() {
                      username = value;
                      print(username);
                    });
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),
                  ]),
                ),
                FormBuilderTextField(
                  name: "password",
                  decoration: InputDecoration(
                      hintText: "Enter Your Password", labelText: "password"),
                  readOnly: false,
                  enabled: true,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                      print(password);
                    });
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),
                  ]),
                ),
                FormBuilderDropdown(
                  name: "gender",
                  items: gender
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),
                  ]),
                  // FormBuilderTextField(
                  //   name: "gender",
                  decoration: InputDecoration(
                      hintText: "selectgender", labelText: "gender"),
                  // readOnly: false,
                  // enabled: true,
                  onChanged: (newValue) {
                    setState(() {
                      genderselected = newValue.toString();
                    });
                  },
                  // validator: FormBuilderValidators.compose([
                  //   FormBuilderValidators.required(
                  //       errorText: "this field is required"),
                  //   ]),
                ),
                FormBuilderDateTimePicker(
                  name: "DateTime",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),
                  ]),
                  decoration: InputDecoration(
                      hintText: "select date", labelText: "Date&Time"),
                  onChanged: (newValue) {
                    setState(() {
                      DateTime = newValue.toString();
                    });
                  },
                ),
                FormBuilderSlider(
                  name: "Slider",
                  initialValue: 5,
                  min: 0,
                  max: 10,
                  decoration: InputDecoration(
                    labelText: "Range",
                  ),
                ),
                FormBuilderTextField(
                  name: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "this field is required"),
                    FormBuilderValidators.email(),
                  ]),
                  decoration: InputDecoration(
                      hintText: "Type your email address", labelText: "E-mail"),
                  onChanged: (newValue) {
                    setState(() {
                      Email = newValue.toString();
                    });
                  },
                ),
                FormBuilderTextField(
                  name: "Phone",
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: FormBuilderValidators.numeric(),
                  decoration: InputDecoration(
                      hintText: "Enter your number", labelText: "Phone"),
                  onChanged: (newValue) {
                    Phone = newValue.toString();
                    setState(() {});
                  },
                ),
                FormBuilderRadioGroup(
                  name: "Radio Button",
                  options: ["Yes", "No"]
                      .map((e) => FormBuilderFieldOption(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  decoration: InputDecoration(labelText: "Do you like this"),
                  controlAffinity: ControlAffinity.leading,
                ),
                FormBuilderCheckboxGroup(
                  name: "CheckBoxGroup",
                  options: ["1", "2", "3", "4", "5"]
                      .map((e) => FormBuilderChipOption(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  decoration: InputDecoration(labelText: "Ratings"),
                ),
                FormBuilderSegmentedControl(
                  name: "Segments",
                  options: ["1", "2", "3"]
                      .map((e) => FormBuilderFieldOption(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  decoration: InputDecoration(labelText: "Select"),
                ),
                // FormBuilderFilterChip(
                //   name: "Filterchip",
                //   options: ["good", "ok", "better"]
                //       .map((e) => FormBuilderChipOption(
                //             value: e,
                //             child: Text(e),
                //           ))
                //       .toList(),
                //   decoration: InputDecoration(labelText: "Comment"),
                // ),
                FormBuilderCheckbox(
                  name: "Checkbox",
                  title: Row(
                    children: [
                      Text(
                        "Terms and Conditions",
                      ),
                      Text("Agree", style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                FormBuilderChoiceChip(
                  name: "ChoiceChip",
                  options: ["good", "ok", "better"]
                      .map((e) => FormBuilderChipOption(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  decoration: InputDecoration(labelText: "Comment"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: (() {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      username =
                          _formKey.currentState!.value["username"].toString();
                      password =
                          _formKey.currentState!.value["password"].toString();
                      genderselected =
                          _formKey.currentState!.value["gender"].toString();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                    username: username!,
                                    password: password!,
                                    gender: genderselected!,
                                  )));
                    }
                  }),
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
