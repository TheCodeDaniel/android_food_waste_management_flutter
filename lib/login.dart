import 'package:android_food_waste_management/holder.dart';
import 'package:android_food_waste_management/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool one = false;
  bool two = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Login to acount"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Hello Again, \nWelcome back",
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 40),
                TextFormField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        one = true;
                      });
                    } else if (value.isEmpty) {
                      setState(() {
                        one = false;
                      });
                    }
                  },
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "youremailaccount@gmail.com",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        two = true;
                      });
                    } else if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                      setState(() {
                        two = false;
                      });
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: one != false && two != false
                      ? () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const AppHolder();
                            },
                          ));
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Login to account"),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Don't have an account?",
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const RegisterPage();
                          },
                        ));
                      },
                      child: const Text(
                        "Create an account",
                        style: TextStyle(color: Colors.brown),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
