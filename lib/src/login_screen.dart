import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/signup_screen.dart';
import 'package:online_learning_huweii/src/widgets/custom_clippath.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              child: FormLogin(),
            ))
      ],
    ));
  }
}

// ignore: must_be_immutable
class FormLogin extends StatelessWidget {
  FormLogin({
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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 11,
                    color: const Color(0xff323643).withOpacity(0.5),
                    fontFamily: 'Metro',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    color: const Color(0xff323643),

                    // color: const Color(0xff323643).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xffffffff),
                    fontFamily: 'Metro',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 71),
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
        const SizedBox(height: 10),
        const Text('Forgot Password?',
            style: TextStyle(
                color: Color(0xff323643),
                fontSize: 11,
                fontWeight: FontWeight.bold,
                fontFamily: 'Metro')),
        const SizedBox(height: 84),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            primary: const Color(0xff3FB6F7),
            minimumSize: const Size(double.infinity,
                46), // double.infinity is the width and 30 is the height
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/walk_through');
          },
          child: const Text('Log In'),
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
