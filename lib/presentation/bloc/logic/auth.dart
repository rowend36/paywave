import 'package:paywave/data/models/user.dart';
import 'package:paywave/data/models/account_details.dart';
import './requests.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:provider/provider.dart';
import 'package:paywave/data/state/user.dart';

class UserSerializer implements JSONSerializer<User> {
  @override
  User fromJSON(Map<String, dynamic> map) {
    return User(
        id: map["id"], email: map["email"], phoneNumber: map["phoneNumber"]);
  }

  @override
  Map<String, dynamic> toJSON(User obj) {
    return {"email": obj.email, "phoneNumber": obj.phoneNumber};
  }
}

// final currentUser = CurrentUser(null);
final _spaceRe = RegExp(' +');

Future<AccountModel> signUp(BuildContext context,
    {required String email,
    required String password,
    required String name,
    required String address,
    required String phone}) async {
  final res = await apiPost("/Auth/signUp", body: {
    "email": email,
    "password": password,
    "confirmpassword": password,
    "userName": name
  });

  // {data: {id: 28b9c1c0-46b5-4134-b3cb-0c7aa161eba9, userName: rowendduke36@gmail.com, email: rowendduke36@gmail.com}, message: User registered Successfully, status: true, statusCode: 201}

  return await signIn(context, email: email, password: password);

  // final names = name.split(_spaceRe);
  // await apiPost("/Auth/updateInformation", body: {
  //   "firstName": names.first,
  //   "middleName":
  //       names.length > 2 ? names.sublist(1, names.length - 1).join(" ") : "",
  //   "lastName": names.last,
  //   "address": _parseAddress(address),
  //   "phoneNumber": phone
  // });

  // Fluttertoast.showToast(msg: "signup successfully");
}

Map<String, String> _parseAddress(String address) {
  // final match = _addressRe.firstMatch(address);
  return {
    "street": "",
    "city": address,
    "local_government": "",
    "country": "NG"
  };
}

Future<AccountModel> signIn(BuildContext context,
    {required String email, required String password}) async {
  try {
    final res = await apiPost("/Auth/signIn", body: {
      "email": email,
      "password": password,
    });
    //{data: {accessToken: "...", userId: 84292337-46a6-4f43-bdbf-384923571820, status: true, expiresIn: 2023-08-11T14:42:36.0026278+00:00, clientId: 84292337-46a6-4f43-bdbf-384923571820, refreshToken: "...", message: Login Successful, status: true, statusCode: 200}
    setAccessToken(res["data"]["accessToken"], res["data"]["refreshToken"]);
    return updateUser(context, res["data"]["clientId"], email);
  } catch (err) {
    print(err);
    throw Exception(err);
  }
}

Future<AccountModel> updateUser(
    BuildContext context, String uid, String email) async {
  try {
    final info = await apiGet("/Auth/getClient");
    //{data: {bvn: null, address: null, next_of_kin: null, isVerified: false, hasPin: false, deviceToken: null, phoneNumber: null}, message: The process was completed successully, status: true, statusCode: 200}
    print(info);
    User user = User(email: email, id: uid);
    Provider.of<UserProvider>(context, listen: false).setUserModel(user);
    return createAccount(context, uid, 7777);
    // return user;
  } catch (err) {
    print(err);
    throw Exception(err);
  }
}

Future<AccountModel> createAccount(
    BuildContext context, String uid, int pin) async {
  try {
    final info =
        await apiPost("/v1/Account/createAccount/$uid?transactionPin=$pin");
    print(104);
    print(info);
    AccountModel accountModel = AccountModel.fromJson(info);
    print(107);
    print(accountModel.accountNumber);
    return accountModel;
    // Provider.of<AccountProvider>(context, listen: false)
    //     .setAccountModel(accountModel);
  } catch (err) {
    print(err);
    throw Exception(err);
  }
}
