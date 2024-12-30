import 'package:flutter/material.dart';

class ApplicationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ApplicationCard(
          jobTitle: 'Software Engineer',
          company: 'Google',
          status: 'In Review',
        ),
        ApplicationCard(
          jobTitle: 'Flutter Developer',
          company: 'Facebook',
          status: 'Shortlisted',
        ),
      ],
    );
  }
}

class ApplicationCard extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String status;

  const ApplicationCard({
    required this.jobTitle,
    required this.company,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(jobTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 5),
            Text(company, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
            const SizedBox(height: 10),
            Text('Status: $status', style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
