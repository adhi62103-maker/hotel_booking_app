import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<String> uploadtocloudinary(File image) async {
  final response =
      await CloudinaryPublic(
        "dhso8sbmu",
        "hotel_management_images",
        cache: false,
      ).uploadFile(
        CloudinaryFile.fromFile(
          image.path,
          resourceType: CloudinaryResourceType.Image,
        ),
      );
  return response.secureUrl;
}

Future<void> userregister({
  required String name,
  required String email,
  required String password,
  required String confirmpassword,
  required String role,
  required BuildContext context,
  required File image,
}) async {
  try {
    final profileimage = await uploadtocloudinary(image);
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;
    await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
      "name": name,
      "email": email,
      "role": role,
      "image": profileimage,
    });
    ScaffoldMessenger.of(context)
  ..removeCurrentSnackBar()
  ..showSnackBar(
    SnackBar(
      content: Text("Login as user successfully"),
      backgroundColor: Colors.blueGrey,
    ),
  );

  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.toString()), backgroundColor: Colors.blueGrey),
      snackBarAnimationStyle: AnimationStyle(),
    );
  }
}

Future<void> hotelregister({
  required String name,
  required String email,
  required String password,
  required String confirmpassword,
  required String role,
  required BuildContext context,
  required File proof,
}) async {
  try {
    final uploapProof = await uploadtocloudinary(proof);
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;
    await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
      "name": name,
      "email":email,
      "role": role,
      "proof":uploapProof
    });
   ScaffoldMessenger.of(context)
  ..removeCurrentSnackBar()
  ..showSnackBar(
    SnackBar(
      content: Text("Login as hotel successflly"),
      backgroundColor: Colors.blueGrey,
    ),
  );

  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.toString()), backgroundColor: Colors.blueGrey),
      snackBarAnimationStyle: AnimationStyle(),
    );
  }
}

Future<String> login({required String email, required String password}) async {
  UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection("users")
      .doc(user.user!.uid)
      .get();
  return snapshot["role"];
}
