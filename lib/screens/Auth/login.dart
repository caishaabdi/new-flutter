import 'package:bilaw_waye/screens/Auth/APIs/UserServices.dart';
import 'package:bilaw_waye/screens/Auth/Register.dart';
// import 'package:bilaw_waye/screens/Auth/login.dart';
// import 'package:bilaw_waye/screens/Cilent/home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

// ignore: camel_case_types
class _loginScreenState extends State<loginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  final UserServices userServices = UserServices();

  void login() {
    userServices.login(
        context: context,
        email: emailcontroller.text,
        password: passcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    const Expanded(
                      flex: 3,
                      child: Center(
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: "XALIYE",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            TextSpan(
                              text: "SHOP",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height / 12,
                              child: TextFormField(
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.blue)),
                                  hintText: "Enter your Email",
                                  prefixIcon: const Icon(Icons.mail_outline),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    // borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            SizedBox(
                              height: size.height / 12,
                              child: TextFormField(
                                controller: passcontroller,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.blue)),
                                  hintText: "Enter your Password",
                                  prefixIcon: const Icon(Icons.password),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    const Text("Remember me")
                                  ],
                                ),
                                const Text(
                                  'Forgot password',
                                  style: TextStyle(color: Colors.blue),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: GestureDetector(
                                onTap: login,
                                child: Container(
                                  width: double.infinity,
                                  height: size.height / 14,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const registerScreen())));
                      },
                      child: const Text(
                        "SingUp Here",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    )
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
