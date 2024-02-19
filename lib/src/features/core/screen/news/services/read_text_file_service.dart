import 'package:flutter/services.dart';

class ReadTextFileService {
  static Future<String> readApiKey() async {
    try {
      // Load the text file from assets/api/apikey.txt
      String apiKey = await rootBundle.loadString('assets/api/apikey.txt');
      return apiKey.trim(); // Trim any extra whitespace
    } catch (e) {
      // Handle any errors that might occur while reading the file
      print("Error reading API key: $e");
      return "Error reading API key: $e";
    }
  }
}