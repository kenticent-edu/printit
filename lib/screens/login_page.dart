import 'package:flutter/material.dart';

const backgroundColor = Color(0xFF181818);

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'PrintIt',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
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
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Email',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
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
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            SizedBox(
              width: 300,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // handle login/registration
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: backgroundColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
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
                  color: Colors.white,
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
