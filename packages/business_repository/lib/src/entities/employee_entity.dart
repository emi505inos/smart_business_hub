class EmployeeEntity {
 String employeeId;
  String name;
  int phoneNumber;
  DateTime dateOfAdmission;

  EmployeeEntity({
    required this.employeeId,
    required this.name,
    required this.phoneNumber,
    required this.dateOfAdmission,
  });

  Map<String, Object?> toDocument() {
    return {
      'employeeId': employeeId,
      'name': name,
      'phoneNumber': phoneNumber,
      'dateOfAdmission': dateOfAdmission,
    };
  }
  static EmployeeEntity fromDocument(Map<String, dynamic> doc) {
    return EmployeeEntity(
      employeeId: doc['employeeId'],
      name: doc['name'],
      phoneNumber: doc['phoneNumber'],
      dateOfAdmission: (doc['dateOfAdmission']).toDate(),
    );
  }
}