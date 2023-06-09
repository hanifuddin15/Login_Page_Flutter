import 'package:flutter/material.dart';
import 'package:login_page_flutter/api_manager/loginresponsemodel.dart';
import 'package:login_page_flutter/login/login_api_repository.dart';
import 'package:login_page_flutter/login/login_response_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<ScaffoldState>();
  String _phoneNumber = '';
  String _password = '';
      LoginResponseModel? loginAPIresponse ;

  bool _isButtonEnabled = false;

  void _updateButtonEnabled() {
    setState(() {
      _isButtonEnabled = _phoneNumber.isNotEmpty && _password.isNotEmpty;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                const FlutterLogo(size: 100.0),

                const SizedBox(height: 24.0),

                // Phone Number TextFormField with validation
                TextFormField(
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone Number can not be empty';
                    }
                    // String? errorMsg = _validateBangladeshiPhoneNumber(value!);
                    // return errorMsg;
                  },
                  onChanged: (value) {
                    _phoneNumber = value;
                    print(value);
                    _updateButtonEnabled();
                  },
                ),

                const SizedBox(height: 16.0),

                // Password TextFormField
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _password = value;

                    _updateButtonEnabled();
                  },
                ),

                const SizedBox(height: 24.0),

                // Login Button
                ElevatedButton(
                  onPressed: () async {
                   var loginRepo  = LoginAPIRepository( _formKey);
                   

                    if (_isButtonEnabled) {
                     loginAPIresponse = await loginRepo.postAPICall(_phoneNumber, _password);
                      print(_phoneNumber);
                      print(_password);
                    }
                   
                    if (loginAPIresponse!.statusCode==200){
                      print("successful");
                      
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validateBangladeshiPhoneNumber(String phoneNumber) {
    // Regular expression pattern for Bangladeshi phone numbers
    String pattern = r'^\+?(?:880|0)[1-9][0-9]{9}$';

    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(phoneNumber)) {
      return 'Please enter a valid Bangladeshi phone number';
    }
    return null; // Returns null if the phone number is valid
  }
}
