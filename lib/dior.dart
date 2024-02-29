import 'package:dio/dio.dart';
import 'package:flutter_application_1/a.dart';

Future<List<A>> fetchTitles() async {
  try {
    // Create a Dio instance
    Dio dio = Dio();

    // Make a GET request
    Response response =
        await dio.get('https://leafbazar.org/wp-json/wp/v2/media');

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Extract the 'title' from each item in the response data
      final List<A> titles =
          List<A>.from(response.data.map((item) => A.fromJson(item)));
      return titles;
    } else {
      // If the request was not successful, print the status code
      print('Request failed with status: ${response.statusCode}');
      return []; // Return an empty list
    }
  } catch (e) {
    // Print any errors that occur during the request
    print('Error: $e');
    return []; // Return an empty list
  }
}
