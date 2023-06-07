import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:moonshine_fe/config.dart' as globals;

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (globals.userId == 0) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Account Setting'),
        ),
        body: Center(
          child: FlutterLogin(
            onLogin: (_) => Future(() => null),
            onRecoverPassword: (_) => Future(() => null),
            hideForgotPasswordButton: true,
            onSignup: (_) => Future(() => null),
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
      return Container(
        child: Center(
          child: Text('${globals.userId}'),
        ),
      );
    }
  }
}
