import "dart:convert";
import "package:http/http.dart";
import "package:fluttertoast/fluttertoast.dart";

abstract class JSONSerializer<T> {
  T fromJSON(Map<String, dynamic> map);
  Map<String, dynamic> toJSON(T obj);
}

class ResponseError implements Exception {
  final int code;
  final String message;
  ResponseError(this.code, this.message);
}

enum HttpMethod { get, post }

Map<String, dynamic> _tryDecode(dynamic e) {
  try {
    Map<String, dynamic> response = json.decode(e);
    return jsonDecode(e);
  } catch (err) {
    return {"message": e};
  }
}

const _origin =
    "http://paywave-dev.eba-ypxxxpkf.us-east-1.elasticbeanstalk.com/api";

String _accessToken = "noToken";
/* refreshUser */
String? _refreshToken;

void setAccessToken(String token, String? refreshToken) {
  _accessToken = token;
  _refreshToken = refreshToken;
}

Future<Map<String, dynamic>> apiRequest(String path, HttpMethod method,
    {Map<String, String>? headers, Map<String, dynamic>? body}) async {
  final allHeaders = {
    "Authorization": "Bearer $_accessToken",
    "Content-Type": "application/json"
  };

  final uri = Uri.parse("$_origin$path");
  if (headers != null) allHeaders.addAll(headers);
  final response = await (method == HttpMethod.get
      ? get(uri, headers: allHeaders)
      : post(
          uri,
          body: body != null ? jsonEncode(body) : null,
          headers: allHeaders,
        ));
  print(response.body);
  if (response.statusCode >= 200 && response.statusCode < 400) {
    Fluttertoast.showToast(msg: _tryDecode(response.body)["message"]);

    return _tryDecode(response.body);
  } else {
    final msg = _tryDecode(response.body);
    Fluttertoast.showToast(msg: msg["message"]);
    print(msg["message"]);
    throw ResponseError(response.statusCode,
        msg.containsKey("message") ? msg["message"] : response.body);
  }
}

Future<Map<String, dynamic>> apiGet(String path,
        {Map<String, String>? headers}) =>
    apiRequest(path, HttpMethod.get, headers: headers);

Future<Map<String, dynamic>> apiPost(String path,
        {Map<String, String>? headers, Map<String, dynamic>? body}) =>
    apiRequest(path, HttpMethod.post, headers: headers, body: body);
