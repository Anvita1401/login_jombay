import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final usernameControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final passwordControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginImage(),
              SizedBox(height: 20),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Image.asset('assets/images/jombay.png'));
  }
}

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usernameController = ref.read(usernameControllerProvider);
    final passwordController = ref.read(passwordControllerProvider);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              labelText: 'Username',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final username = usernameController.text;
              final password = passwordController.text;

            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.black),
              minimumSize: MaterialStateProperty.all<Size>(const Size(
                  double.infinity,
                  50)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white, // Set text color to white
                fontSize: 16.0, // Set text size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
