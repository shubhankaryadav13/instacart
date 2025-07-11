import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instacart/sceens/register_page.dart';
import 'package:provider/provider.dart';
import 'package:instacart/colors/colors.dart';
import '../view_model/signup_viewmodel.dart';
import '../widgets/CustomButton.dart';
import '../widgets/cuberto_navbar.dart';
import '../widgets/email_password.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: Consumer<AuthViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.black,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          '\$0 delivery fees on your first 3 orders',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          'Service fees and terms apply',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: emailController,
                          labelText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          controller: passwordController,
                          labelText: 'Password',
                          obscureText: true,
                          prefixIcon: Icons.lock,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30),
                        RichText(
                          text: TextSpan(
                            text: 'By continuing, you agree to our ',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' & ',
                              ),
                              TextSpan(
                                text: 'Privacy Policy.',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'click to register.',
                                style: TextStyle(
                                  color: Color(0xFF5B6840),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => RegisterPage()),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          child: viewModel.isLoading
                              ? Center(child: CircularProgressIndicator())
                              : CustomButton(
                            text: 'Continue',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                bool success = await viewModel.signIn(
                                  emailController.text,
                                  passwordController.text,
                                );
                                if (success) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("SignIn Successful!"),
                                  ));
                                  // Navigate if needed
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BottomBarExample(), // Your target screen
                                    ),
                                  );

                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(viewModel.errorMessage ??
                                        "Signup Failed"),
                                  ));
                                }
                              }
                            },
                            color: Color(0xFF5B6840),
                            textColor: Colors.white,
                            borderRadius: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
