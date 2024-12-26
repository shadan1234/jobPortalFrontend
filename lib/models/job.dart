class Job {
  String? id;
  String compName;
  String jobTitle;
  String jobDescription;
  String jobLocation;
  String empId;

  Job({
    this.id,
    required this.compName,
    required this.jobTitle,
    required this.jobDescription,
    required this.jobLocation,
    required this.empId,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['_id'],
      compName: json['compName'],
      jobTitle: json['jobTitle'],
      jobDescription: json['jobDescription'],
      jobLocation: json['jobLocation'],
      empId: json['empId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'compName': compName,
      'jobTitle': jobTitle,
      'jobDescription': jobDescription,
      'jobLocation': jobLocation,
      'empId': empId,
    };
  }
}
