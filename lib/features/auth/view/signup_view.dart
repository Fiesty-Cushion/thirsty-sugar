import 'package:attendy/features/auth/view/login_view.dart';
import 'package:attendy/features/auth/widgets/my_button.dart';
import 'package:attendy/resources/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const SignupView(),
      );

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignUp() async{
    setState(() {
      isLoading = true;
    });
    await FirebaseAuthMethods().userSignUp(
        email: emailController.text,
        password: passwordController.text,
        context: context);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: HexColor("#F0F0F0"),
        body: ListView(
          padding: EdgeInsets.fromLTRB(0, screenHeight / 3, 0, 0),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      height: (2 / 3) * screenHeight - 28,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HexColor("#ffffff"),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context, LoginView.route());
                                    },
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 67,
                                  ),
                                  Text(
                                    "Sign Up",
                                    style: GoogleFonts.poppins(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#4f4f4f"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 0, 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: HexColor("#8d8d8d"),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      style:
                                          TextStyle(color: HexColor('#4F4F4F')),
                                      controller: emailController,
                                      onChanged: (value) {},
                                      onSubmitted: (value) {},
                                      cursorColor: HexColor("#4f4f4f"),
                                      decoration: InputDecoration(
                                        hintText: "hello@gmail.com",
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                20, 20, 20, 20),
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 15,
                                          color: HexColor("#8d8d8d"),
                                        ),
                                        fillColor: HexColor("#f0f3f1"),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Password",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: HexColor("#8d8d8d"),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      style:
                                          TextStyle(color: HexColor('#4F4F4F')),
                                      onChanged: (value) {},
                                      onSubmitted: (value) {},
                                      obscureText: true,
                                      controller: passwordController,
                                      cursorColor: HexColor("#4f4f4f"),
                                      decoration: InputDecoration(
                                        hintText: "*************",
                                        fillColor: HexColor("#f0f3f1"),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                20, 20, 20, 20),
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 15,
                                          color: HexColor("#8d8d8d"),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        focusColor: HexColor("#44564a"),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    MyButton(
                                      buttonText: 'Proceed',
                                      onPressed: () async {
                                        onSignUp();
                                      },
                                      isLoading: isLoading,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Already have an account?",
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: HexColor("#8d8d8d"),
                                            )),
                                        TextButton(
                                            child: Text(
                                              "Log In",
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                color: HexColor("#44564a"),
                                              ),
                                            ),
                                            onPressed: () => Navigator.push(
                                                context, LoginView.route())),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -270),
                      child: Image.asset(
                        'assets/images/reading-side.png',
                        scale: 1,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
