import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/data/models/user_account.dart';
import 'package:paywave/presentation/routes.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/screens/main/widgets/floating_menu_dialog.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/presentation/widget/preview_receiver_widget.dart';
import 'package:paywave/presentation/screens/send_funds/send_details.dart';

enum SendFundsResult { done }

class SendFunds extends StatefulWidget {
  const SendFunds({super.key});

  @override
  State<SendFunds> createState() => _SendFundsState();
}

class _SendFundsState extends State<SendFunds> {
  //global key
  final _formKey = GlobalKey<FormState>();
  final amountTextEditingController = TextEditingController();
  final accountNumberTextEditingController = TextEditingController();

  String userID = "";
  String amount = "";
  bool loading = false;
  UserAccount? receiver;

  Future _openDialog(Widget dialog, {dismissible = true}) {
    return showDialog<SendFundsResult>(
        context: context,
        barrierDismissible: dismissible,
        builder: (BuildContext context) {
          return dialog;
        }).then(_handleResult);
  }

  Future? _handleResult(SendFundsResult? result) {
    switch (result) {
      default:
        return null;
    }
  }

  void _sendFunds() {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          loading = true;
        });

        final Map<String, dynamic> details = {
          "amount": amountTextEditingController.text.trim(),
          "accountNumber": accountNumberTextEditingController.text.trim()
        };

        // Navigator.pushNamed(context, AppRoutes.send_funds_details,
        //     arguments: details);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SendFundDetails(
                      send_details: details,
                    )));
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    print(68);
    print(args);

    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      insetPadding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        finishWithResult(context, null);
                      },
                      icon: const Icon(IconsaxOutline.close_square))),
              Text("Send Funds", style: MainStyles.headlineMedium(context)),
              Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Account Number",
                      hintText: "12524252452",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'account number can\'t be empty';
                      }
                      if (text.length < 11) {
                        return "Please enter a valid account number";
                      }
                      if (text.length > 11) {
                        return 'account number can\t be more than 11';
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        accountNumberTextEditingController.text = value;
                      });
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 64),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Amount",
                        hintText: '1200',
                        suffixIcon: Icon(IconsaxOutline.coin_1)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'amount can\'t be empty';
                      }
                      if (text.length < 2) {
                        return "Please enter a valid amount";
                      }
                      if (text.length > 49) {
                        return 'amount can\t be more than 50';
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        amountTextEditingController.text = value;
                      });
                    },
                  )),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: MainStyles.elevatedButton(context),
                      onPressed: _sendFunds,
                      child: const Text("Send"))),
              loading
                  ? const Center(
                      heightFactor: 2.5,
                      child: SizedBox.square(
                          dimension: 122,
                          child: CircularProgressIndicator(
                            strokeWidth: 9.0,
                          )),
                    )
                  : receiver != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 56),
                          child: PreviewReceiverWidget(receiver!))
                      : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
