import 'package:flutter/material.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/data/models/app_route.dart';
import 'package:provider/provider.dart';

class RouteIcon extends StatelessWidget {
  final AppRoute route;
  const RouteIcon(this.route, {super.key});
  @override
  Widget build(BuildContext context) {
    final currentRoute = context.watch<CurrentRoute>();
    return Expanded(
        child: MaterialButton(
            minWidth: 0,
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            onPressed: () => {currentRoute.value = route},
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                      color: currentRoute.value == route
                          ? AppColors.primary
                          : AppColors.neutral60,
                      currentRoute.value == route
                          ? route.iconActive
                          : route.icon),
                  Text(route.name,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: currentRoute.value == route
                              ? AppColors.primary
                              : AppColors.neutral60))
                ])));
  }
}
