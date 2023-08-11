import 'package:paywave/data/models/user.dart';
import './requests.dart';

class UserSerializer implements JSONSerializer<User> {
  @override
  User fromJSON(Map<String, dynamic> map) {
    return User(
        id: map["id"],
        email: map["email"],
        firstName: map["firstName"],
        lastName: map["lastName"],
        phoneNumber: map["phoneNumber"]);
  }

  @override
  Map<String, dynamic> toJSON(User obj) {
    return {
      "email": obj.email,
      "firstName": obj.firstName,
      "lastName": obj.lastName,
      "phoneNumber": obj.phoneNumber
    };
  }
}

final currentUser = CurrentUser(null);
final _spaceRe = RegExp(' +');
Future<User> signUp(
    {required String email,
    required String password,
    required String name,
    required String address,
    required String phone}) async {
  final res = await apiPost("/Auth/signUp", body: {
    "email": email,
    "password": password,
    "confirmpassword": password,
    "userName": email
  });
  // {data: {id: 28b9c1c0-46b5-4134-b3cb-0c7aa161eba9, userName: rowendduke36@gmail.com, email: rowendduke36@gmail.com}, message: User registered Successfully, status: true, statusCode: 201}

  await signIn(email: email, password: password);

  final names = name.split(_spaceRe);
  await apiPost("/Auth/updateInformation", body: {
    "firstName": names.first,
    "middleName":
        names.length > 2 ? names.sublist(1, names.length - 1).join(" ") : "",
    "lastName": names.last,
    "address": _parseAddress(address),
    "phoneNumber": phone
  });
  return await updateUser(res["data"]["clientId"], email);
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

Future<User> signIn({required String email, required String password}) async {
  final res = await apiPost("/Auth/signIn", body: {
    "email": email,
    "password": password,
  });
  //{data: {accessToken: "...", userId: 84292337-46a6-4f43-bdbf-384923571820, status: true, expiresIn: 2023-08-11T14:42:36.0026278+00:00, clientId: 84292337-46a6-4f43-bdbf-384923571820, refreshToken: "...", message: Login Successful, status: true, statusCode: 200}
  setAccessToken(res["data"]["accessToken"], res["data"]["refreshToken"]);
  return await updateUser(res["data"]["clientId"], email);
}

Future<User> updateUser(String uid, String email) async {
  final info = await apiGet("/Auth/getClient");
  //{data: {bvn: null, address: null, next_of_kin: null, isVerified: false, hasPin: false, deviceToken: null, phoneNumber: null}, message: The process was completed successully, status: true, statusCode: 200}
  User user = User(
      email: email,
      id: uid,
      firstName: "User",
      lastName: "User",
      phoneNumber: info["data"]["phoneNumber"] ?? "");
  currentUser.value = user;
  return user;
}
