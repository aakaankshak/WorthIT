import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/evaluation_result.dart';

class ApiService {
  static const String _baseUrl =
      'https://worth-it-backend.worthitbackend.workers.dev';

  static Future<EvaluationResult> evaluateProduct({
    required String productName,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/v1/evaluate'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'productName': productName,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to analyze product');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);

    return EvaluationResult.fromJson(data['result']);
  }
}
