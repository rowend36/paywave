import 'package:flutter/material.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:paywave/data/models/app_route.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return const Text("Notifications");
  }
}

const notificationsRoute = AppRoute(
    name: "Notifications",
    icon: IconsaxOutline.notification,
    iconActive: IconsaxBold.notification,
    page: NotificationsPage());
