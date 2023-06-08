import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:moonshine_fe/config.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});
  // static const baseUrl = 'http://3.135.207.29:3000/user';
  // static const baseUrl = 'http://10.210.61.107:3000/user';
  static final baseUrl = '${globals.baseUrl}/user';

  Future<String?> _authUser(LoginData data) async {
    // print('${data.name} ${data.password}');
    // jsonEncode({'id': data.name, 'password': data.password});
    print(
      jsonEncode({
        'email': data.name,
        'password': sha256.convert(utf8.encode(data.password)).toString(),
      }),
    );
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': data.name,
        'password': sha256.convert(utf8.encode(data.password)).toString(),
      }),
    );
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      if (decode['status'] == 200) {
        globals.userId = decode['id'];
        globals.userName = decode['name'];
        final preferenceResponse = await http.get(
          Uri.parse('$baseUrl/${globals.userId}/preference'),
        );
        if (preferenceResponse.statusCode == 200) {
          var preferenceDecode = jsonDecode(preferenceResponse.body);
          globals.user_gentle = preferenceDecode['gentle'].toDouble();
          globals.user_boozy = preferenceDecode['boozy'].toDouble();
          globals.user_sweet = preferenceDecode['sweet'].toDouble();
          globals.user_dry = preferenceDecode['dry'].toDouble();
          globals.user_alcohol = preferenceDecode['alcohol'].toDouble() / 10.0;
        }
        return null;
      } else {
        return 'Failed';
      }
    } else {
      return 'Network Error';
    }
  }

  Future<String?> _signupUser(SignupData data) async {
    // print('Signup Name: ${data.name}, Password: ${data.password}');
    // data.additionalSignupData!['name'];
    print(
      jsonEncode({
        'email': data.name,
        'password': sha256.convert(utf8.encode(data.password!)).toString(),
        'name': data.additionalSignupData!['name'],
      }),
    );
    var response = await http.post(
      Uri.parse('$baseUrl/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': data.name,
        'password': sha256.convert(utf8.encode(data.password!)).toString(),
        'name': data.additionalSignupData!['name'],
      }),
    );
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      if (decode['status'] == 200) {
        globals.userId = decode['id'];
        globals.userName = data.additionalSignupData!['name']!;
        // return 'Success';
        return null;
      } else {
        return 'Failed';
      }
    } else {
      return 'Network Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (globals.userId <= 1) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Account Setting'),
        ),
        body: Center(
          child: FlutterLogin(
            // onLogin: (_) => Future(() => null),
            onSubmitAnimationCompleted: () {
              Navigator.pop(context);
            },
            onLogin: _authUser,
            onRecoverPassword: (_) => Future(() => null),
            hideForgotPasswordButton: true,
            onSignup: _signupUser,
            onSwitchToAdditionalFields: (_) => Future(() => null),
            loginAfterSignUp: true,
            additionalSignupFields: const [
              UserFormField(
                keyName: 'name',
                // keyName: '1',
                displayName: 'Name',
                icon: Icon(Icons.account_circle),
                userType: LoginUserType.name,
              ),
            ],
            messages: LoginMessages(
              forgotPasswordButton: '',
              recoverPasswordButton: '',
              signupButton: 'Sign Up',
            ),
            confirmSignupKeyboardType: TextInputType.name,
            theme: LoginTheme(
              primaryColor: Colors.black87,
              accentColor: Colors.black87,
              errorColor: Colors.redAccent,
              titleStyle: TextStyle(
                color: Colors.black87,
                fontFamily: Theme.of(context).textTheme.titleLarge!.fontFamily,
              ),
              bodyStyle: TextStyle(
                color: Colors.black87,
                fontFamily: Theme.of(context).textTheme.titleLarge!.fontFamily,
              ),
              textFieldStyle: const TextStyle(
                backgroundColor: Colors.transparent,
              ),
              buttonStyle: TextStyle(
                backgroundColor: Colors.transparent,
                color: Colors.white,
                fontFamily: Theme.of(context).textTheme.titleLarge!.fontFamily,
              ),
              cardTheme: const CardTheme(
                color: Colors.white,
              ),
              inputTheme: const InputDecorationTheme(
                filled: false,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Account Setting'),
        ),
        body: Container(
          child: Center(
            child: Text('${globals.userId}'),
          ),
        ),
      );
    }
  }
}
