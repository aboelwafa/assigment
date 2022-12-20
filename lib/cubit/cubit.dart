// ignore_for_file: camel_case_types, unused_local_variable, unused_import, avoid_print, avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'dart:convert';

import 'package:assigment/cubit/states.dart';
import 'package:assigment/models/employee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class employeeCubit extends Cubit<employeeSates>
{
  employeeCubit():super(createEmployeeIntialState());

  
static employeeCubit get(context)=>BlocProvider.of(context);


EmployeeModel?employeeModel;


void createEmployee({
  required String name,
  required String phone,
  required String jopTitle,
  required String salary,
  required String year,
  required String dateTime,
  
  
})
{
  emit(createEmployeeLoadingState());
  EmployeeModel model=EmployeeModel(
    name:name ,
    phone:phone ,
    jopTitle: jopTitle,
    salary: salary,
    year: year,
    dateTime: dateTime,
    
  );
  FirebaseFirestore.instance.collection('users')
  .doc(phone)
  .set(model.toMap())
  .then((value) {    
    emit(createEmployeeSuccessState());
  })
  .catchError((error){

    emit(createEmployeeErrorState());
  });
  
}
List<EmployeeModel> emp=[];
List<String> EmployeeID=[];
void getEmployee()
{
  
  emit(GetEmployeeLoadingState());
  FirebaseFirestore.instance.collection('users')
     .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      emp=[];
      event.docs.forEach((element) {
        EmployeeID.add(element.id);
        emp.add(EmployeeModel.fromJson(element.data()));
      });
      emit(GetEmployeeSuccessState());
    });

 
}

 //get details client only
  List<EmployeeModel> detailsEmployee=[];
  void getDetailClient({required String phone,})
  {
    FirebaseFirestore.instance.collection('employee')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      //detailsClients=[];
      event.docs.forEach((element) {
        detailsEmployee.add(EmployeeModel.fromJson(element.data()));
      });
      emit(GetEmployeeDetailsSuccessState());
    });
  }
}

