import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:instacart/colors/colors.dart';
import '../view_model/signup_viewmodel.dart';
import '../widgets/CustomButton.dart';
import '../widgets/cuberto_navbar.dart';
import '../widgets/email_password.dart';
import 'login_screen.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            body: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
                    child: Center(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/signup.png'),
                           // ImageIcon(AssetImage('assets/images/images/signup.png')),
                            Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '\$0 delivery fees on your first 3 orders',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Service fees and terms apply',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(height: 50),
                            CustomTextField(
                              controller: nameController,
                              labelText: 'User ID',
                              keyboardType: TextInputType.text,
                              prefixIcon: Icons.account_circle,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'User ID is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 30),
                            SizedBox(
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              child: viewModel.isLoading
                                  ? const Center(child: CircularProgressIndicator())
                                  : CustomButton(
                                text: 'Continue',
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    bool success = await viewModel.signUp(emailController.text, passwordController.text,nameController.text);
                                    if (success) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Signup Successful!")),
                                      );
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BottomBarExample(),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(viewModel.errorMessage ?? "Signup Failed")),
                                      );
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
                  // Back button on top
                  Positioned(
                    top: 30,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => LoginPage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF5B6840),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(Icons.arrow_back, color: Colors.white, size: 35),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
