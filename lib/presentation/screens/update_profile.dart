import 'dart:io';
import 'dart:math';

import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paywave/data/state/user.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/presentation/theme/app_theme.dart';
import 'package:paywave/presentation/widget/user_avatar.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key, this.title});

  final String? title;

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final picker = ImagePicker();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  updateProfilePhoto() {
    if (!Platform.isWindows) {
      picker.pickImage(source: ImageSource.gallery).then(
        (value) {
          if (value != null) {
            // TODO - Handle upload when API to update photo is out
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).userModel;
    return Theme(
      data: appTheme2,
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: AppColors.background,
          body: ListView(children: [
            Stack(alignment: Alignment.topCenter, children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18, left: 18),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              IconsaxOutline.arrow_left,
                              size: 24,
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 23),
                    child: Align(
                      child: Text(
                        "Update Profile",
                        style: MainStyles.headlineMedium(context,
                            color: AppColors.black),
                      ),
                    ),
                  ),
                  // Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 43.5),
                    padding: const EdgeInsets.only(
                        top: 45, left: 24, right: 24, bottom: 42),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 37),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'User name',
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'User name cannot be empty';
                              }
                              // Check for special characters using a regular expression
                              final specialChars =
                                  RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
                              if (specialChars.hasMatch(text)) {
                                return 'User name must not contain special characters';
                              }
                            },
                            onChanged: (text) =>
                                setState(() => userNameController.text = text),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 37),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email address',
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Email address cannot be empty';
                              }
                              // Check for special characters using a regular expression
                              final specialChars =
                                  RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
                              if (specialChars.hasMatch(text)) {
                                return 'Email address must not contain special characters';
                              }
                            },
                            onChanged: (text) =>
                                setState(() => userNameController.text = text),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 37),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Phone number',
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Phone number cannot be empty';
                              }
                              // Check for special characters using a regular expression
                              final specialChars =
                                  RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
                              if (specialChars.hasMatch(text)) {
                                return 'Phone number must not contain special characters';
                              }
                            },
                            onChanged: (text) =>
                                setState(() => userNameController.text = text),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: max(37,
                                    MediaQuery.of(context).size.height - 591)),
                            child: Row(children: [
                              Expanded(
                                  child: ElevatedButton(
                                style: MainStyles.elevatedButton(context),
                                onPressed: () {
                                  /*TODo Update */
                                },
                                child: Text("Update",
                                    style: MainStyles.titleMedium(context,
                                        color: AppColors.white)),
                              ))
                            ])),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 146.5,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    UserAvatar(user, radius: 43.5),
                    SizedBox.fromSize(
                        size: const Size.square(32),
                        child: ElevatedButton(
                          onPressed: updateProfilePhoto,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.lightOnPrimary,
                              padding: EdgeInsets.zero,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)))),
                          child: const Icon(IconsaxBold.add_square, size: 20),
                        ))
                  ],
                ),
              ),
            ])
            // ])
          ]),
        ),
      ),
    );
  }
}
