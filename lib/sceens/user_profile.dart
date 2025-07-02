import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../colors/colors.dart';
import '../model/Auth/UserModel.dart';
import '../view_model/signup_viewmodel.dart';
import '../view_model/user_info_service.dart';
import '../widgets/CustomButton.dart';
import '../widgets/email_password.dart';
import '../widgets/shimmer_loader.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
  UserModel? userModel;

  final nameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();

  final ImagePicker picker = ImagePicker();
  File? _imageFile;

  bool status = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    final data = await UserService().getUserByUid(uid);
    setState(() {
      userModel = data;
      nameController.text = userModel?.userName ?? '';
      mobileNumberController.text = userModel?.mobileNumber ?? '';
      emailController.text = userModel?.emailId ?? '';
      isLoading = false;
    });
  }

  Future<void> _takePhoto() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile  = File(image.path);
      });
  }
  }

  void showProfileImageDialog(BuildContext context, String uid) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF5B6840),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: Text(
          "Choose an option",
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.white),
              title: Text("Take Photo", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
                _takePhoto();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library, color: Colors.white),
              title: Text("Choose from Gallery", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
                _pickFromGallery();
              },
            ),
            ListTile(
              leading: Icon(Icons.image, color: Colors.white),
              title: Text("Choose from Photo", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
                // implement view photo fullscreen if you want
              },
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: CustomButton(
                    text: 'Close',
                    color: Colors.black,
                    textColor: Colors.white,
                    borderRadius: 0,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 100,
                  child: CustomButton(
                    text: 'Upload',
                    color: Colors.black,
                    textColor: Colors.white,
                    borderRadius: 0,
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (_imageFile != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Ready to upload: ${_imageFile!.path}")),
                        );
                        // call upload function here if needed
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("No image selected")),
                        );
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: isLoading
            ? ShimmerLoader()
            : userModel == null
            ? Center(
          child: Text(
            "No user data found",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF5B6840),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                      ),
                    ),
                    const Spacer(),
                    const Text('Profile',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5B6840),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(Icons.share, color: Colors.white, size: 30),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: const Color(0xFF5B6840),
                        backgroundImage: _imageFile != null
                            ? FileImage(_imageFile!)
                            : AssetImage('assets/images/ak.png') as ImageProvider,
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.width / 2 - 60,
                      top: 110,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            status = true;
                          });
                          showProfileImageDialog(context, userModel!.uid);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(Icons.edit, color: Colors.black, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text('${userModel?.userName ?? ''}',
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5B6840),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn("Balance", "000"),
                      Container(width: 2, height: 60, color: Colors.white),
                      _buildStatColumn("Orders", "000"),
                      Container(width: 2, height: 60, color: Colors.white),
                      _buildStatColumn("Total Spent", "000"),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: nameController,
                  labelText: 'User name',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icons.account_circle,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'User name is required';
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
                    if (value == null || value.isEmpty) return 'Email is required';
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Enter a valid email';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: mobileNumberController,
                  labelText: 'Mobile number',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Mobile number is required';
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: CustomButton(
                    text: status ? 'Update' : 'Continue',
                    color: const Color(0xFF5B6840),
                    textColor: Colors.white,
                    borderRadius: 12.0,
                    onPressed: () async {
                      if (status) {
                        final viewModel = Provider.of<AuthViewModel>(context, listen: false);
                        bool success = await viewModel.updateUser(
                          nameController.text.trim(),
                          emailController.text.trim(),
                          mobileNumberController.text.trim(),
                          uid,
                        );
                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Profile updated successfully')),
                          );
                          setState(() {
                            status = false;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(viewModel.errorMessage ?? 'Update failed')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Tap on edit icon to edit')),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
