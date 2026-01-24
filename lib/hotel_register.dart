import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/service.dart';
import 'package:image_picker/image_picker.dart';

class HotelRegister extends StatefulWidget {
  const HotelRegister({super.key});

  @override
  State<HotelRegister> createState() => _HotelRegisterState();
}

class _HotelRegisterState extends State<HotelRegister> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  String role = "user";

  File? selectedimage;
  Future<void> pickimage() async {
    final picker = ImagePicker();
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      setState(() {
        selectedimage = File(PickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EFE9),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),

            Image.asset("assets/top.png", scale: 2),

            Text(
              "Create account",
              style: GoogleFonts.cinzel(
                color: Color(0xFF404B38),
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " Name",
                      style: TextStyle(color: Color(0xFF404B38)),
                    ),
                  ),
                  TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: "Name",
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
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " ConfirmPassword",
                      style: TextStyle(color: Color(0xFF404B38)),
                    ),
                  ),
                  TextField(
                    controller: confirmpasswordcontroller,
                    decoration: InputDecoration(
                      hintText: "ConfirmPassword",
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
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: pickimage,
                      child: Container(
                        color: Colors.transparent,
                        height: 30,
                        width: 130,
                        child: Center(
                          child: Row(
                            children: [
                              Icon(Icons.upload),
                              Text("Upload proof"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
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
                        hotelregister(
                          name: namecontroller.text,
                          email: emailcontroller.text,
                          password: passwordcontroller.text,
                          confirmpassword: confirmpasswordcontroller.text,
                          role: role,
                          context: context,
                          proof: selectedimage!,
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF1EFE9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
