import 'package:flutter/material.dart';

class JobsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        JobCard(
          title: 'Software Engineer',
          company: 'Google',
          location: 'Bangalore, India',
          salary: '₹20,00,000/year',
        ),
        JobCard(
          title: 'Flutter Developer',
          company: 'Facebook',
          location: 'Remote',
          salary: '₹18,00,000/year',
        ),
        JobCard(
          title: 'Data Analyst',
          company: 'Amazon',
          location: 'Hyderabad, India',
          salary: '₹15,00,000/year',
        ),
      ],
    );
  }
}

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String salary;

  const JobCard({
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
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
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 5),
            Text(company, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
            const SizedBox(height: 5),
            Text(location, style: TextStyle(color: Colors.blueAccent, fontSize: 14)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Salary: $salary'),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Text('Apply'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
