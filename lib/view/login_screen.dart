import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/components/button_1.dart';
import 'package:mvvm_architecture/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email)),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_open_rounded),
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
            ),
            SizedBox(
              height: height * .085,
            ),
            Button1(
              title: 'Login',
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'Please enter 6 digit password', context);
                }
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
                onTap: () {},
                child: const Text("Don't have an accont? Sign Up"))
          ],
        ),
      ),
    );
  }
}
