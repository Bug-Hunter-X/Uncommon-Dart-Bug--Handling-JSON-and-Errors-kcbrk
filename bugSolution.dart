```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      //Check for key existence before accessing it.
      final value = jsonData.containsKey('nonExistentKey') ? jsonData['nonExistentKey'] : null; 
      print(value);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    //Implement retry logic here if needed
    //Example (uncomment for actual retry logic):
    //await Future.delayed(Duration(seconds: 2));
    //await fetchData();
  }
}
```