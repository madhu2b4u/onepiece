import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();

}
class _LoginScreenState extends State<LoginScreen> {
  bool isMobilePressed = false;
  bool isEmailPressed = false;

  void toggleMobileButton() {
    setState(() {
      isMobilePressed = !isMobilePressed;
    });
  }

  void toggleEmailButton() {
    setState(() {
      isEmailPressed = !isEmailPressed;
    });
  }
  @override
  Widget build(BuildContext context) {

    Widget first =Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 175),
          child: const Text(
            "Sign In",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff000000),
            ),
          ),
        ),
        const SizedBox(width: 75), // Adjust the width between text and image as needed
        SvgPicture.asset(
          'assets/images/signin_image.svg',
        )
      ],
    );

    Widget second = const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "You can sign in using mobile no. or email",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xffbdbdbd),
              height: 24/14,
            ),
            textAlign: TextAlign.left,
          )
        ]
    );

    Widget third = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          FloatingActionButton.extended(
          label: const Text(
              'Mobile',
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 21/14,
              )
          ), // <-- Text
          backgroundColor: Color(0xff2f5fe3),
          icon: const Icon( // <-- Icon
          Icons.phone_android,
          size: 24.0,
          ),
          onPressed: () {},
          ),

        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: toggleMobileButton,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              isEmailPressed ? Colors.blue : Colors.lightBlue,
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          child: Text(
            isEmailPressed ? 'Email' : 'Email',
            style: TextStyle(
              color: isEmailPressed ? Colors.white : Colors.black,
            ),
          ),
        )
      ],
    );

    return MaterialApp(
        home: Scaffold(
            body :ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                first,
                second,
                third
              ],
            )
        )
    );
  }
}
