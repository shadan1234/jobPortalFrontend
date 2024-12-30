import 'dart:convert';

import 'package:job_portal_frontend/commons/error_handling.dart';
import 'package:job_portal_frontend/globals.dart';
import 'package:job_portal_frontend/models/job.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class JobService{

 Future<List<Job>?> fetchJobs() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('x-auth-token');

    var response = await http.get(
      Uri.parse('$uri/user/all-jobs'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> decodedJson = jsonDecode(response.body);
      List<Job> jobs = [];
      for (Map<String, dynamic> mp in decodedJson) {
        jobs.add(Job.fromJson(mp));
      }
      return jobs;
    } else {
      throw Exception('Failed to fetch jobs: ${response.statusCode}');
    }
  } catch (e) {
    showSnackBar(e.toString());
    return null; // Return null in case of an error
  }
}

}