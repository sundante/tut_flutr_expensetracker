import 'package:flutter/material.dart';
import 'package:tut_flutr_expensetracker/screens/login_screen.dart';
import 'package:tut_flutr_expensetracker/utils/appvalidator.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
        const SnackBar(content: Text("Form submitted successfully")),
      );
    }
  }

  // utils class for all validation functions
  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252634),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 80.0,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    "Create New Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("Username", Icons.person),
                  validator: appValidator.validateUsername,
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _buildInputDecoration("Email", Icons.email),
                  validator: appValidator.validateEmail,
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.phone,
                  decoration: _buildInputDecoration("Phone Number", Icons.call),
                  validator: appValidator.validatePhoneNumber,
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.phone,
                  decoration: _buildInputDecoration("Password", Icons.lock),
                  validator: appValidator.validatePassword,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                        onPressed: _submitForm,
                        child: Text(
                          "Creat",
                          style: TextStyle(fontSize: 20),
                        ))),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    child: Text("Login",
                        style: TextStyle(color: Colors.orange, fontSize: 20))),
              ],
            )),
      ),
    );
  }

  // This is generic code to build the input tiles
  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        fillColor: Color(0xAA494A59),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x35949494))),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        filled: true,
        labelStyle: TextStyle(color: Color(0xFF949494)),
        labelText: label,
        suffixIcon: Icon(
          suffixIcon,
          color: Color(0xFF949494),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}
