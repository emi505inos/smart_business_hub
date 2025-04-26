import 'package:business_repository/src/entities/employee_entity.dart';
import 'package:uuid/uuid.dart';

class Employee {
  String employeeId;
  String name;
  int phoneNumber;
  DateTime dateOfAdmission;

  Employee({
    required this.employeeId,
    required this.name,
    required this.phoneNumber,
    required this.dateOfAdmission,
  });

  static final empty = Employee(
    employeeId: Uuid().v1(),
    name: '',
    phoneNumber: 0,
    dateOfAdmission: DateTime.now(),
  );
  EmployeeEntity toEntity() {
    return EmployeeEntity(
      employeeId: employeeId,
      name: name,
      phoneNumber: phoneNumber,
      dateOfAdmission: dateOfAdmission,
    );
  }
  static Employee fromEntity(EmployeeEntity entity) {
    return Employee(
      employeeId: entity.employeeId,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
      dateOfAdmission: entity.dateOfAdmission,
    );
  }
}