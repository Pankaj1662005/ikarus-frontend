import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  // For Android emulator
  static const bool isProd = false; // toggle for testing locally or prod
  //static const String baseUrl = 'http://10.0.2.2:8000/api';
  static String get baseUrl {
    if (isProd) {
      return 'https://ikarus-backend.onrender.com/api';
    } else {
      return 'http://127.0.0.1:8000/api';
    }
  }

  // static const String baseUrl = 'http://127.0.0.1:8000/api';

// // For Android emulator
//   static const String baseUrl = 'http://10.0.2.2:8000/api';
//
// // For iOS simulator
//   static const String baseUrl = 'http://localhost:8000/api';
//
// // For physical device (replace with your computer's IP)
//   static const String baseUrl = 'http://192.168.1.XXX:8000/api';

  static const Duration timeout = Duration(seconds: 30);

  static Future<List<Product>> fetchRecommendations(String prompt) async {
    try {
      final url = Uri.parse('$baseUrl/recommend/raw');

      final response = await http
          .post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'prompt': prompt}),
      )
          .timeout(timeout);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List results = data['results'] ?? [];

        return results
            .map((e) => Product.fromJson(e['product']))
            .where((product) => product.title.isNotEmpty)
            .toList();
      } else if (response.statusCode == 404) {
        throw Exception('API endpoint not found');
      } else if (response.statusCode >= 500) {
        throw Exception('Server error. Please try again later.');
      } else {
        throw Exception('Failed to fetch recommendations: ${response.statusCode}');
      }
    } on http.ClientException {
      throw Exception('Network error. Please check your connection.');
    } on FormatException {
      throw Exception('Invalid response format from server.');
    } catch (e) {
      if (e.toString().contains('TimeoutException')) {
        throw Exception('Request timeout. Please try again.');
      }
      rethrow;
    }
  }
}