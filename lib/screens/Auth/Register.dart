// ignore: file_names
import 'package:bilaw_waye/screens/Auth/APIs/UserServices.dart';
import 'package:bilaw_waye/screens/Auth/login.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreen();
}


// ignore: camel_case_types
class _registerScreen extends State<registerScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  final UserServices userServices = UserServices();

  void register() {
    userServices.register(
      context: context,
        name: namecontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text,
        address: addresscontroller.text,
        phone: int.parse(phonecontroller.text));
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
                      flex: 12,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height / 12,
                              child: TextFormField(
                                controller: namecontroller,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.blue)),
                                  hintText: "Enter your Name",
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
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
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            SizedBox(
                              height: size.height / 12,
                              child: TextFormField(
                                controller: addresscontroller,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.blue)),
                                  hintText: "Enter your Address",
                                  prefixIcon: const Icon(Icons.location_city),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            SizedBox(
                              height: size.height / 12,
                              child: TextFormField(
                                controller: phonecontroller,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.blue)),
                                  hintText: "Enter your Phone",
                                  prefixIcon: const Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            SizedBox(
                              height: size.height / 12,
                              child: TextFormField(
                                controller: passwordcontroller,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.blue)),
                                  hintText: "Enter your Password",
                                  prefixIcon: const Icon(Icons.password),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40)),
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
                                onTap: register,
                                child: Container(
                                  width: double.infinity,
                                  height: size.height / 14,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Register',
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
                      "Already have an account",
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
                                builder: ((context) => const loginScreen())));
                      },
                      child: const Text(
                        "SingIn Here",
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
