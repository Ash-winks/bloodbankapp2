
class User{
  String? Id;
  late String Name;
  late String Phonenumber;
  late String gender;
  late String Age;
  late String weight;
  late String bloodgroup;


  User(
      {this.Id,
      required this.Name,
      required this.Phonenumber,
     // required this.gender,
      required this.Age,
      required this.weight,
      required this.bloodgroup});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      "Name":Name,
      "Phonenumber":Phonenumber,
      "gender":gender,
      "Age":Age,
      "weight":weight,
      "bloodgroup":bloodgroup
    };
    if (Id != null) {
      map['Id'] = Id;
    }
    return map;
  }
}
class Donationrequest{
  late String name;
  late String loaction;
  Donationrequest({required this.name,
    required this.loaction
  });
  Map<String,Object?> toMap(){
    var map=<String,Object?>{
      "name":name,
      "location":loaction
    };
    return map;
  }
}
