import 'package:flutter/material.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/data/models/page_data.dart';
import 'package:provider/provider.dart';

class PageIcon extends StatelessWidget {
  final PageData pageData;
  const PageIcon(this.pageData, {super.key});
  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<CurrentPage>();
    return Expanded(
        child: MaterialButton(
            minWidth: 0,
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            onPressed: () => {currentPage.value = pageData},
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                      color: currentPage.value == pageData
                          ? AppColors.primary
                          : AppColors.neutral60,
                      currentPage.value == pageData
                          ? pageData.iconActive
                          : pageData.icon),
                  Text(pageData.name,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: currentPage.value == pageData
                              ? AppColors.primary
                              : AppColors.neutral60))
                ])));
  }
}
