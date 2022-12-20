// ignore_for_file: non_constant_identifier_names

class EmployeeModel
{
  String? name;
  String? phone;
  String? jopTitle;
  String? salary;
  String? year;
  String? dateTime;
   String? uid;

  EmployeeModel({
    this.name,
    this.phone,
    this.jopTitle,
    this.salary,
    this.year,
    this.dateTime,
    this.uid
  });

  EmployeeModel.fromJson(Map<String,dynamic> json)
  {
    name=json['name'];
    phone=json['phone'];
    jopTitle=json['jopTitle'];
    salary=json['salary'];
    year=json['year'];
    dateTime=json['dateTime'];
     uid=json['uid'];
  }

 Map <String,dynamic> toMap(){
    return
      {
        'name':name,
        'phone':phone,
        'jopTitle':jopTitle,
        'salary':salary,
        'year':year,
        'dateTime':dateTime,
        'uid':uid,



      };

}
}