// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, use_key_in_widget_constructors, must_be_immutable, camel_case_types, unnecessary_new, avoid_print, unused_local_variable, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, unused_import

import 'package:assigment/cubit/cubit.dart';
import 'package:assigment/cubit/states.dart';
import 'package:assigment/modules/empList.dart';
import 'package:assigment/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addEmployee extends StatelessWidget {
  var nameControler = TextEditingController();

  var phoneControl = TextEditingController();

  var jobTitleContoler = TextEditingController();

  var salaryPerHourControler = TextEditingController();
  var experienceControler = TextEditingController();

  var startDateControler = TextEditingController();

  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<employeeCubit,employeeSates>(
      listener: (context, state) {
        if(state is createEmployeeSuccessState)
        {
           nameControler.clear();
          phoneControl.clear();
          salaryPerHourControler.clear();
          startDateControler.clear();
          jobTitleContoler.clear();
          experienceControler.clear();
           showToast(text: '${nameControler.text}  has been successfully added', state: Toaststate.SUCCESS);
          employeeCubit.get(context).getEmployee();
          navigateTo(context, EmployeeList());

         
        }

      },
      builder: (context, state) {
        var cubit =employeeCubit.get(context);
        return Scaffold(
        appBar: AppBar(
          title: Text('Create employee'),
    
        ),
        body: Form(
          key:formKey ,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(height: 15.0,),
                  // full name
                  DefaultFormField(
                    controller: nameControler,
                     validate: (value)
                     {
                      if(value!.isEmpty)
                      {
                        return'name must not empty ';
                      }
                      if(value.length<5)
                      {
                        return 'must write full name';
                      }
                      return null;
                     },
                      type: TextInputType.text,
                       label: 'Full name',
                       hint: 'Marina Nashat'
                       ),
                  
                  SizedBox(height: 15.0,),
                  // Phone number
                     DefaultFormField(
                    controller: phoneControl,
                     validate: (value)
                     {
                      if(value!.isEmpty)
                      {
                        return'phone number must not be empty ';
                      }
                      if(value.length<10)
                      {
                        return 'must enter invalid number';
                      }
                      return null;
                     },
                      type: TextInputType.phone,
                       label: 'phone number',
                       hint: '01065835698'
                       ),
                  
                  SizedBox(height: 15.0,),
                   // jop title
                     DefaultFormField(
                    controller: jobTitleContoler,
                     validate: (value)
                     {
                      if(value!.isEmpty)
                      {
                        return'jop title must not be empty ';
                      }
                      if(value.length<3)
                      {
                        return 'must enter invalid jop title';
                      }
                      return null;
                     },
                      type: TextInputType.text,
                       label: 'jop title',
                       hint: 'Software Engineer'
                       ),
                  
                  SizedBox(height: 15.0,),
                       // Salary per hour
                     DefaultFormField(
                    controller: salaryPerHourControler,
                     validate: (value)
                     {
                      if(value!.isEmpty)
                      {
                        return'please enter number salary per hour ';
                      }
                      
                      return null;
                     },
                      type: TextInputType.number,
                       label: 'Salary per hour',
                       hint: '10'
                       ),
                  
                  SizedBox(height: 15.0,),
                          // Experience in Years
                     DefaultFormField(
                    controller: experienceControler,
                     validate: (value)
                     {
                      if(value!.isEmpty)
                      {
                        return'please enter year Experience ';
                      }
                      if(value.length<4)
                      {
                    return'please enter valid year  ';
                  
                      }
                      
                      return null;
                     },
                      type: TextInputType.datetime,
                       label: 'Experience in Years:',
                       hint: '1993'
                       ),
                  
                  SizedBox(height: 15.0,),
                                //date
                                TextFormField(
                                  controller: startDateControler,
                                  decoration: InputDecoration(
                                    labelText: "Start Date",
                                    border: OutlineInputBorder(),
                                    suffix: Icon(Icons.date_range),
                  
                                  ),
                                  validator: ( value){
                                    if(value!.isEmpty)
                                    {
                                      return "please enter Date";
                                    }
                                    return null;
                                  },
                  
                                  onTap: () async{
                                    DateTime? date = DateTime(1900);
                                    FocusScope.of(context).requestFocus(new FocusNode());
                  
                                    date = await showDatePicker(
                                        context: context,
                                        initialDate:DateTime.now(),
                                        firstDate:DateTime(1850),
                                        lastDate: DateTime(2030));
                  
                                    startDateControler.text=date!.toString();
                                  },),
                  SizedBox(height: 15.0,),
                  
                  defaultButton(
                    
                    function: (){
          
                      if(formKey.currentState!.validate())
                      {
                          employeeCubit.get(context).createEmployee(
                            name: nameControler.text,
                             phone: phoneControl.text,
                              jopTitle: jobTitleContoler.text,
                               salary: salaryPerHourControler.text,
                                year: experienceControler.text,
                                 dateTime: startDateControler.text,
                            );
                            
                      }
                    },
                     text: 'Submit',
                     
                     ),
                  
                ],
              ),
            ),
          ),
        ),
      );
      },
    );
  }
}


