import 'src/models/models.dart';

abstract class EmployeeRepository {

  Future<void> createEmployee(Employee employee);

  Future<List<Employee>> getEmployee();
  
}