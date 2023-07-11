import 'package:flutter/material.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:paywave/data/models/app_route.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Text("Profile");
  }
}

const profileRoute = AppRoute(
    name: "Profile",
    icon: IconsaxOutline.user,
    iconActive: IconsaxBold.user,
    page: ProfilePage());
