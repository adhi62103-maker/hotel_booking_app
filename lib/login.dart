import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/forgot_password.dart';
import 'package:hotel_booking_app/hotel_register.dart';
import 'package:hotel_booking_app/service.dart';
import 'package:hotel_booking_app/user_register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7F2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Image.asset("assets/top.png", scale: 2),

              Text(
                "Welcome back",
                style: GoogleFonts.cinzel(
                  color: Color(0xFF404B38),
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Login to continue your stay",
                style: TextStyle(color: Color(0xFF404B38)),
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        " Email",
                        style: TextStyle(color: Color(0xFF404B38)),
                      ),
                    ),
                    TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.blueGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.blueGrey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        " Password",
                        style: TextStyle(color: Color(0xFF404B38)),
                      ),
                    ),
                    TextField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.blueGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.blueGrey),
                        ),
                        counter: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              ),
                            );
                          },
                          child: Text("Forgot password?"),
                        ),
                        counterStyle: TextStyle(
                          color: Color(0xFF505A47),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Color(0xFF505A47),
                        ),
                        onPressed: () {
                          login(
                            email: emailcontroller.text,
                            password: passwordcontroller.text,
                            context: context,
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF1EFE9),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(" ---------------------- or ----------------------"),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text("Register as")],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        backgroundColor: Color(0xFFF1EFE9),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UserRegister(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "User",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF505A47),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        backgroundColor: Color(0xFF505A47),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HotelRegister(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Hotel",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFF1EFE9),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        "Create new account",
                        style: TextStyle(
                          color: Color(0xFF505A47),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
