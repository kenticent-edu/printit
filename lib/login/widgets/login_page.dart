import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printit/page_list/widgets/photo_list_page.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => const PhotoListPage())),
            );
          }
        },
        child: const _LoginForm(),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'PrintIt',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const _EmailField(),
            const SizedBox(
              height: 20,
            ),
            const _PasswordField(),
            const SizedBox(
              height: 20,
            ),
            const _LoginButton(),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // handle navigation to registration screen
              },
              child: const Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Colors.tealAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => current.email != previous.email,
      builder: (context, state) => Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 2,
            ),
          ],
        ),
        child: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(12),
            hintText: 'Email',
          ),
          style: const TextStyle(color: Colors.black),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(value));
          },
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => current.password != previous.password,
      builder: (context, state) => Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 2,
            ),
          ],
        ),
        child: TextField(
          obscureText: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(12),
            hintText: 'Password',
          ),
          style: const TextStyle(color: Colors.black),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(value));
          },
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => current.status != previous.status,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const CircularProgressIndicator();
        }
        return SizedBox(
          width: 300,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              context.read<LoginBloc>().add(const LoginButtonPressed());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                color: Color(0xff303030),
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
