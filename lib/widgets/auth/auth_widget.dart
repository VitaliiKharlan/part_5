import 'package:flutter/material.dart';
import 'package:flutter_lessons_lesson_39/theme/app_button_style.dart';



class AuthWidget extends StatefulWidget {


  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login to your Account'),
        titleTextStyle: const TextStyle(
          color: Colors.yellow,
          fontSize: 20,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const _HeaderWidget(),
          const SizedBox(height: 24),
          TextField(
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'lesson_39_Theme_Of_TMDB_part_5',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const _FormWidget(),
          const SizedBox(height: 24),
          const Text(
            'In order to use the ending and rating capabilities of TMDb, '
            'as well as great personal recommendations you will need to login your account. '
            'If you do not have an account, registering for an account is free and simple.',
            style: textStyle,
          ),
          const SizedBox(height: 8),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Register'),
          ),
          const SizedBox(height: 24),
          const Text(
            'If you signed up but didn`t get your verification email.',
            style: textStyle,
          ),
          const SizedBox(height: 8),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Verify Email'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget();

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');

  String? errorText = '';

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;

      Navigator.of(context).pushNamed(
          '/main_screen'); // add new screen (screen two to screen one)
      // Navigator.of(context)
      //     .pushReplacementNamed('/main_screen'); // change one screen to other
    } else {
      errorText = 'Incorrect Login or Password';
    }
    setState(() {});
  }

  void _resetPassWord() {}

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    const color = Color(0xFF01B4E4);
    const textFieldDecorator = InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      isCollapsed: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.yellow,
          width: 0.0,
        ),
      ),
    );
    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 20),
        ],
        const Text(
          'UserName',
          style: textStyle,
        ),
        const SizedBox(height: 4),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        const SizedBox(height: 20),
        const Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(height: 4),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(width: 24),
            TextButton(
              onPressed: _resetPassWord,
              style: AppButtonStyle.linkButton,
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ],
    );
  }
}
