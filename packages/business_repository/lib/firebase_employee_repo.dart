import 'dart:developer';

import 'package:business_repository/src/entities/employee_entity.dart';
import 'package:business_repository/src/models/employee.dart';
import 'package:business_repository/employee_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseEmployeeRepo implements EmployeeRepository{
  final employeeRepository = FirebaseFirestore.instance.collection('employee');

  @override
  Future<void> createEmployee(Employee employee) async{
    try {
      await employeeRepository.doc(employee.employeeId)
      .set(employee.toEntity().toDocument());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Employee>> getEmployee() async{
  try {
    return await employeeRepository.get()
    .then((value) => value.docs.map((e) => 
    Employee.fromEntity(EmployeeEntity.fromDocument(e.data()))
    ).toList());
  } catch (e) {
    log(e.toString());
    rethrow;
  }
  }
}