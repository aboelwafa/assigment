// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, prefer_is_empty

import 'package:assigment/cubit/cubit.dart';
import 'package:assigment/cubit/states.dart';
import 'package:assigment/models/employee.dart';
import 'package:assigment/modules/empDetails.dart';
import 'package:assigment/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<employeeCubit,employeeSates>(
      listener: (context, state) {
      },
      builder: (context, state) {
      
            return 
            Scaffold(
              appBar: AppBar(title: TextButton(
                child: Text('All Employee',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                onPressed: () => {
                  employeeCubit.get(context).getEmployee()
                },
                )),
              body:  ConditionalBuilder(
          condition: true,
          builder:(context) => ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) => employeeList(employeeCubit.get(context).emp[index],context),
              separatorBuilder: (context, index) => Container(
                width: double.maxFinite,
                height: 2,
                color: Colors.grey,
              ),
              itemCount: employeeCubit.get(context).emp.length),
          fallback: (context) => Center(child: CircularProgressIndicator()),

        ),
            );
            
           
        
         },
      
    );
    
  }
 Widget employeeList(EmployeeModel model,context)=> 
         InkWell(
          onTap: (){
        navigateTo(context, EmployeeDetails(employeeModel: model,));

          },
           child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Name: ',style: Theme.of(context).textTheme.bodyLarge,),
                            SizedBox(width: 15.0,),
                            Text('${model.name}',style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500
                            ),)
                          ],
                        ),
                        SizedBox(height: 10.0,),
                               Row(
                          children: [
                            Text('JopTitle: ',style: Theme.of(context).textTheme.bodyLarge,),
                            SizedBox(width: 15.0,),
                            Text('${model.jopTitle}',style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500
                            ),)
                          ],
                        ),
                        SizedBox(height: 10.0,),
                  
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                          children: [
                            Text('salary: ',style: Theme.of(context).textTheme.bodyLarge,),
                            SizedBox(width: 15.0,),
                            Text('${model.salary} \$',style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500
                            ),)
                          ],
                        ),
                                    ),
                        SizedBox(height: 10.0,),
                        Container(
                          width: 115.0,
                          height: 50.0,
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.blue,
                          ),
                          child: MaterialButton(
                                
                            onPressed: (){
                               navigateTo(context,EmployeeDetails(employeeModel: model,) );
                            },
                          child: Text('moreDetails',style: TextStyle(color: Colors.white),),
                          
                          ),
                          
                        ),
                        SizedBox(height: 10.0,),
                      ],
                    ),
                  ),
         );
             
}
