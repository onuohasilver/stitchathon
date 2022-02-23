import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkRequests {
  ///Generic  post Requests
  Future<http.Response> post(String url, Map<String, dynamic> body) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/x-www-form-urlencoded",
    };
    http.Response response;
    // try {
    response = await http.post(Uri.parse(url),
        headers: requestHeaders,
        body: body,
        encoding: Encoding.getByName('utf-8'));
    print(response.body);
    // } on SocketException {
    //   return http.Response(
    //       "{\"success\":false,\"message\":\"Failure in Socket\",\"errors\":[\"fail\"]}",
    //       901);
    // } catch (e) {
    //   print(e);
    //   return http.Response(
    //       "{\"success\":false,\"message\":\"Failure in Socket\",\"errors\":[\"fail\"] }",
    //       903);
    // }

    return response;
  }
}
