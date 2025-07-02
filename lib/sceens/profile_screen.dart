import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instacart/colors/colors.dart';
import 'package:instacart/model/Auth/UserModel.dart';
import 'package:instacart/sceens/user_profile.dart';
import 'package:instacart/view_model/user_info_service.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/shimmer_loader.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
  UserModel? userModel;
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
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: isLoading ? ShimmerLoader() : userModel == null ? Center(
          child: Text(
            "No user data found",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => UserProfile()));
                  },
                  icon: CircleAvatar(
                    radius: 75,
                    backgroundColor: Color(0xFF5B6840),
                    child: Image.asset('assets/images/ak.png'),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${userModel?.userName ?? ''}',
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(width: double.infinity, height: 2.0, color: Colors.white),
                const SizedBox(height: 50),

                // buttons
                buildMenuButton(context, "Profile", Icons.arrow_forward_ios, () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UserProfile()));
                }),
                buildMenuButton(context, "About", Icons.arrow_forward_ios, () {}),
                buildMenuButton(context, "Invite & Share", Icons.arrow_forward_ios, () {}),
                buildMenuButton(context, "Terms And Condition", Icons.arrow_forward_ios, () {}),
                buildMenuButton(context, "LogOut", Icons.login_outlined, () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => LoginPage()));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildMenuButton(BuildContext context, String label, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF5B6840),
          foregroundColor: Colors.white70,
          elevation: 5,
          shadowColor: Colors.black54,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
            Icon(icon, size: 30, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
