import 'package:flutter/material.dart';
import '../theme/main_theme.dart';
import '../bloc/svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../routes.dart';
import '../bloc/logic/requests.dart';
import '../../data/models/user.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final AllTheme paywavetheme = AllTheme();

  bool filter = false;

  Future<void> getNotificationTion() async {
    try {
      final res = await apiGet("/Notification/GetNotification/");
      print(res);
    } catch (err) {
      print(err);
    }
  }

  List<Widget> _buildChildren() {
    return [
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.notification_important, weight: 20, size: 40),
              const SizedBox(width: 6),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.transaction);
                  },
                  child: const Text(
                    "Notifications",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 38,
                        fontStyle: FontStyle.normal,
                        fontFamily: "Roboto"),
                  ))
            ],
          ),
          // Icon(
          //   Icons.filter_alt_rounded,
          //   size: 40,
          // ),
          GestureDetector(
              onTap: () {
                setState(() {
                  filter = !filter;
                });
              },
              child: !filter
                  ? SvgPicture.string(NotificationSvg().filter,
                      width: 30, height: 30)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              )),
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          width: 80,
                          child: const Text("Day"),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                )),
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            width: 80,
                            child: const Text("Month"))
                      ],
                    ))
        ],
      ),
      const SizedBox(
        height: 26.0,
      ),
      const Text(
        "Today",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "6:40 am",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: paywavetheme.customColor),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Payment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  "You payed #150 for tansportation",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: paywavetheme.normalColor),
                )
              ],
            ),
            SvgPicture.string(NotificationSvg().notificationDollar,
                width: 30, height: 30),
          ],
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2:40 am",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: paywavetheme.customColor),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Payment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  "You payed #150 for tansportation",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: paywavetheme.normalColor),
                )
              ],
            ),
            SvgPicture.string(NotificationSvg().notificationDollar,
                width: 30, height: 30),
          ],
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1:40 am",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: paywavetheme.customColor),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Payment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  "You payed #150 for tansportation",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: paywavetheme.normalColor),
                )
              ],
            ),
            SvgPicture.string(NotificationSvg().notificationDollar,
                width: 30, height: 30),
          ],
        ),
      ),
      const SizedBox(
        height: 28,
      ),
      const Text(
        "5/27/15",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "6:40 am",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: paywavetheme.customColor),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Payment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  "You payed #150 for tansportation",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: paywavetheme.normalColor),
                )
              ],
            ),
            SvgPicture.string(NotificationSvg().notificationDollar,
                width: 30, height: 30),
          ],
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2:40 am",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: paywavetheme.customColor),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Payment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  "You payed #150 for tansportation",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: paywavetheme.normalColor),
                )
              ],
            ),
            SvgPicture.string(NotificationSvg().notificationDollar,
                width: 30, height: 30),
          ],
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1:40 am",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: paywavetheme.customColor),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Payment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  "You payed #150 for tansportation",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: paywavetheme.normalColor),
                )
              ],
            ),
            SvgPicture.string(NotificationSvg().notificationDollar,
                width: 30, height: 30),
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildChildren(),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
