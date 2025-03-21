import 'package:brain_box/services/form_validator.dart';
import 'package:brain_box/route/route_names.dart';
import 'package:brain_box/views/widgets/custom_app_bar.dart';
import 'package:brain_box/views/widgets/custom_elevated_button.dart';
import 'package:brain_box/views/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FormValidator _formValidator = FormValidator();

  Future<bool> createUserWithEmailAndPassword() async {
    try {
      // Create the user account
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text.trim(),
      );

      // Save the user's name to their profile
      await userCredential.user
          ?.updateDisplayName(_nameTEController.text.trim());

      // If you want to also store in Firestore (recommended for more user data)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'name': _nameTEController.text.trim(),
        'email': _emailTEController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      print(userCredential);
      return true; // Signup successful
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false; // Signup failed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const SizedBox(
                  width: 200,
                  height: 100,
                  child: Text(
                    'Create your Account',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  hintText: 'Enter your full name ',
                  prefixIcon: Icons.person_2_outlined,
                  textEditingController: _nameTEController,
                  validator: _formValidator.validateName,
                ),
                const SizedBox(height: 22),
                CustomTextFormField(
                  hintText: 'Enter your email address ',
                  prefixIcon: Icons.mail_outlined,
                  textEditingController: _emailTEController,
                  validator: _formValidator.validateEmail,
                ),
                const SizedBox(height: 22),
                CustomTextFormField(
                  hintText: 'Password ',
                  prefixIcon: Icons.lock_outline,
                  showToggle: true,
                  textEditingController: _passwordTEController,
                  validator: _formValidator.validatePassword,
                ),
                const SizedBox(height: 38),
                CustomElevatedButton(
                    onTap: _registerButton,
                    btnText: 'Register',
                    bgColor: Colors.black87,
                    textColor: Colors.white),
                const SizedBox(height: 22),
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Sign In',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(RouteNames.logInScreen);
                              }),
                      ],
                      text: 'Already Have An Account? ',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Divider(
                  height: 44,
                  thickness: 0.8,
                  color: Colors.grey.shade300,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Continue With Accounts',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onTap: () {},
                        bgColor: Colors.red.shade100,
                        textColor: Colors.red.shade600,
                        btnText: 'GOOGLE',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomElevatedButton(
                        onTap: () {},
                        bgColor: Colors.blue.shade100,
                        textColor: Colors.blue.shade600,
                        btnText: 'FACEBOOK',
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

  void _registerButton() {
    _formValidator.validateAndProceed(_formKey, () async {
      bool signupSuccess = await createUserWithEmailAndPassword();
      if (signupSuccess) {
        Get.snackbar("Registration Successful", " Now Login ",
            snackPosition: SnackPosition.BOTTOM);
        // Navigate to next screen or show success message
        Get.toNamed(RouteNames.logInScreen);
      } else {
        // Show error message
        Get.snackbar(
            "Signup Failed", "Could not create account. Please try again.",
            snackPosition: SnackPosition.BOTTOM);
      }
    });
  }
}
