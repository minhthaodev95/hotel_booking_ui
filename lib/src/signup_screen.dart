import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/widgets/custom_clippath.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background02.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            )),
        Positioned(
            top: MediaQuery.of(context).size.height / 2 - 58,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: FormSignUp(),
            ))
      ],
    ));
  }
}

class FormSignUp extends StatelessWidget {
  FormSignUp({
    Key? key,
  }) : super(key: key);

  TextStyle style1 = const TextStyle(
    color: Color(0xff777777),
    fontSize: 11,
    fontFamily: 'Metro',
    fontWeight: FontWeight.w500,
  );
  TextStyle style2 = const TextStyle(
    color: Color(0xff323643),
    fontSize: 12,
    fontFamily: 'Metro',
    fontWeight: FontWeight.w600,
  );
  final InputDecoration _inputDecoration = InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: const Color(0xff323643).withOpacity(0.1)),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xff3FB6F7)),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.only(top: 9, bottom: 9, left: 6, right: 6),
  );

  //controller
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  color: const Color(0xff323643),
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xffffffff),
                  fontFamily: 'Metro',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    // color: const Color(0xff323643).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 11,
                    color: const Color(0xff323643).withOpacity(0.5),
                    fontFamily: 'Metro',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text('Username', style: style1),
        TextFormField(
          style: style2,
          controller: _usernameController,
          decoration: _inputDecoration,
        ),
        const SizedBox(height: 20),
        Text('Email Address', style: style1),
        TextFormField(
          style: style2,
          controller: _emailController,
          decoration: _inputDecoration,
        ),
        const SizedBox(height: 20),
        Text('Password', style: style1),
        TextFormField(
          obscureText: true,
          style: style2,
          controller: _passwordController,
          decoration: _inputDecoration,
        ),
        const SizedBox(height: 20),
        Text('Confirm Password', style: style1),
        TextFormField(
          obscureText: true,
          style: style2,
          controller: _cpasswordController,
          decoration: _inputDecoration,
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            primary: const Color(0xff3FB6F7),
            minimumSize: const Size(double.infinity,
                46), // double.infinity is the width and 30 is the height
          ),
          onPressed: () {},
          child: const Text('Sign up'),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {},
            child: const Text(
              'Connect with Facebook',
              style: TextStyle(
                color: Color(0xff384AA8),
                fontFamily: 'Metro',
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }
}
