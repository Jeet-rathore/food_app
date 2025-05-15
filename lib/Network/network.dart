import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  static const String _baseUrl =
      "https://your-api-url.com/api"; // Replace with your base URL

  // Common headers
  static Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    // "Authorization": "Bearer <your_token>", // Add token if needed
  };

  // GET request
  static Future<dynamic> get(String endpoint) async {
    final Uri url = Uri.parse("$_baseUrl$endpoint");

    try {
      final response = await http.get(url, headers: headers);
      return _processResponse(response);
    } catch (e) {
      throw Exception("GET request error: $e");
    }
  }

  // POST request
  static Future<dynamic> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final Uri url = Uri.parse("$_baseUrl$endpoint");

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception("POST request error: $e");
    }
  }

  // PUT request
  static Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    final Uri url = Uri.parse("$_baseUrl$endpoint");

    try {
      final response = await http.put(
        url,
        headers: headers,
        body: jsonEncode(data),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception("PUT request error: $e");
    }
  }

  // DELETE request
  static Future<dynamic> delete(String endpoint) async {
    final Uri url = Uri.parse("$_baseUrl$endpoint");

    try {
      final response = await http.delete(url, headers: headers);
      return _processResponse(response);
    } catch (e) {
      throw Exception("DELETE request error: $e");
    }
  }

  // Handle response
  static dynamic _processResponse(http.Response response) {
    final int statusCode = response.statusCode;
    final String responseBody = response.body;

    if (statusCode >= 200 && statusCode < 300) {
      return jsonDecode(responseBody);
    } else {
      throw Exception(
        "Request failed\nStatus Code: $statusCode\nBody: $responseBody",
      );
    }
  }
}
