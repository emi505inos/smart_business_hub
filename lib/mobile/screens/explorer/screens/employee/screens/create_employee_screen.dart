import 'package:business_repository/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smart_business_hub/mobile/screens/explorer/explorer_blocs.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/employee/employee_screen.dart';
import 'package:uuid/uuid.dart';

class CreateEmployeeScreen extends StatefulWidget {
  const CreateEmployeeScreen({super.key});

  @override
  State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  late Employee employee;

  @override
  void initState() {
    super.initState();
    employee = Employee.empty;
    employee.employeeId = const Uuid().v1();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateEmployeeBloc, CreateEmployeeState>(
      listener: (context, state) {
        if(state is CreateEmployeeSuccess) {

        }else if (state is CreateEmployeeLoading) {
          setState(() {
            employee = Employee.empty;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EmployeeScreen()));
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 30,
              ),
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          title: Text(
            'Nuevo Empleado',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          onPressed: () {
            final parsedDate = DateFormat.yMMMMd('es_AR').parse(dateController.text);
            setState(() {
              employee.name = nameController.text;
              employee.phoneNumber = int.parse(phoneController.text);
              employee.dateOfAdmission = parsedDate;
              context.read<CreateEmployeeBloc>().add(CreateEmployee(Employee.empty));
              Navigator.pop(context);
            });
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.onSecondary),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            fixedSize: WidgetStatePropertyAll(Size(
                MediaQuery.of(context).size.width * 0.8,
                MediaQuery.of(context).size.height * 0.06)),
          ),
          child: Text(
            'Crear Empleado',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Nombre del empleado',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              SizedBox(
                width: MediaQuery.of(context).size.width * 4,
                child: TextFormField(
                    controller: nameController,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      hintText: 'Nombre',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please fill in this field';
                      }
                      return null;
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    'Telefono',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              SizedBox(
                width: MediaQuery.of(context).size.width * 4,
                child: TextFormField(
                    controller: phoneController,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      hintText: 'Telefono',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please fill in this field';
                      }
                      return null;
                    }),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                children: [
                  Text(
                    'Fecha de ingreso',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              // DateSelector()
              SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context, 
                      initialDate: employee.dateOfAdmission, 
                      firstDate: DateTime(2000), 
                      lastDate: DateTime.now()
                    );

                    if (newDate != null) {
                      setState(() {
                        dateController.text = DateFormat.yMMMMd('es_AR').format(newDate);
                        employee.dateOfAdmission = newDate;
                      });
                    }
                  },
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), 
                      borderSide: BorderSide.none
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
