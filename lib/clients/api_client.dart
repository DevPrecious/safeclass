import 'dart:convert';
import 'package:http/io_client.dart';
import 'dart:io';
import 'package:nsafeclass/constants/constants.dart';
import 'package:http/http.dart' as http;

class APIClient {
  Future loginUser({
    required String email,
    required String password,
  }) async {
    var formData = {
      'grant_type': grantType,
      'username': email,
      'password': password,
      'audience': audioence,
      'scope': scope,
      'client_id': clientid,
      'client_secret': clientSecrets,
    };
    try {
      final ioc = HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = IOClient(ioc);
      final response = await http.post(
        Uri.parse('$endpoint/oauth/token'),
        body: formData,
        headers: {
          'content-type': 'application/x-www-form-urlencoded',
        },
      );
      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future registerUser({
    required String fullname,
    required String email,
    required String password,
  }) async {
    var formData = jsonEncode({
      'name': fullname,
      'email': email,
      'password': password,
      'connection': databaseConnection,
      'clientid': clientid,
    });
    try {
      final ioc = HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = IOClient(ioc);
      final response = await http.post(
        Uri.parse('$endpoint/dbconnections/signup'),
        body: formData,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
