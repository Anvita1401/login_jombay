import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Screens/login/login_states.dart';
import '../../Providers/login_provider.dart';
import '../SuccessScreen/success_screen.dart';

late TextEditingController usernameController;

late TextEditingController passwordController;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginImage(),
            SizedBox(height: 20),
            Expanded(child: LoginForm()),
          ],
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
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final LoginState loginState = ref.watch(loginNotifierProvider);

    ref.listen<LoginState>(loginNotifierProvider, (_, LoginState next) {

      switch (next.value){
        case AsyncData():
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SuccessScreen()),
          );
          break;
        case AsyncError():
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Error occured"),
          ));
        case AsyncLoading():

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Center(child: CircularProgressIndicator());
            },
          );

      }


      /*
      if (next.value.hasError) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error occured"),
        ));
      } else if (next.value.hasValue) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SuccessScreen()),
        );
      } else if (next.value.isLoading) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(child: CircularProgressIndicator());
          },
        );
      }*/
    });

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextFormField(
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
              _attemptLoginv();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              minimumSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 50)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
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

  void _attemptLoginv() {
    final loginNotifier = ref.read(loginNotifierProvider.notifier);
    String username = usernameController.text;
    String password = passwordController.text;

    loginNotifier.login(username, password);
  }
}
