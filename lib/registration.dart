import 'package:bloodbankapp1/dashboard.dart';
import 'package:bloodbankapp1/dbhelp.dart';
import 'package:bloodbankapp1/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
enum gender {Male,female,others}//to create radiobutton to select gender

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  Databasehelp databasehelp=Databasehelp();
  final _formkey=GlobalKey<FormState>();
  List<String>Bldgroup=['A','A+','B','B+'];
  String? selc=null;
  dynamic defaultgender=gender.others;
  TextEditingController name=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController Weight=TextEditingController();
  TextEditingController Phone=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: true,
        left: true,
        bottom: true,
        right: true,
        child: Scaffold(
          appBar: AppBar(
            elevation: 10,
              automaticallyImplyLeading: false,
              title: Text('ADD DONNER DETAILS',style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 23)),
              centerTitle: true
          ),
          body: Padding(padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
              child: Form(key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Name',
                          labelText: 'Enter your Name'
                      ),
                      validator: (value){
                        if (value?.length==0){
                          return 'must fill';
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(width: 100,height: 70,
                          child: Stack(
                              children:[ Radio(value: gender.Male, groupValue: defaultgender, onChanged:(values){
                                setState(() {
                                  defaultgender=values;
                                });
                              } ),
                                Positioned(left: 25,
                                    child: Image(image: AssetImage('asset/image/man.png'),width: 70,))
                              ]
                          ),
                        ),
                        Container(width: 100,height: 70,
                          child: Stack(
                              children:[ Radio(value: gender.female, groupValue: defaultgender, onChanged:(values){
                                setState(() {
                                  defaultgender=values;
                                });
                              } ),
                                Positioned(left: 40,
                                    child: Image(image: AssetImage('asset/image/women.png'),width: 70,))
                              ]
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: age,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Age',
                          labelText: 'Enter your Age'
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: Weight,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Weight',
                          labelText: 'Enter your weight'
                      ),
                    ),
                    SizedBox(height: 10,),
                    InputDecorator(//to give border or margin to dropdownbutton/wrapping of dropdwonbutton within a visible margini
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                      ),
                      child: DropdownButton( value: selc,hint: Text('Select your blood group '),elevation: 1,isDense: true,isExpanded: true,
                          menuWidth: 100,borderRadius: BorderRadius.circular(20),
                          items: [
                            DropdownMenuItem(child: Text('${Bldgroup[0]}'),value: Bldgroup[0],),
                            DropdownMenuItem(child: Text('${Bldgroup[1]}'),value: Bldgroup[1],),
                            DropdownMenuItem(child: Text('${Bldgroup[2]}'),value: Bldgroup[2],),
                            DropdownMenuItem(child: Text('${Bldgroup[3]}'),value: Bldgroup[3],),
                          ], onChanged: (Object? value) {
                            setState(() {
                              selc=value.toString();
                            });
                          }),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      maxLength: 10,
                      controller: Phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Phone number',
                          labelText: 'Enter your Phone number'
                      ),
                      validator: (value){
                        if(value?.length==0){
                          return 'must fill';
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10,),
                    Container(width: 200,height: 60,
                      child: ElevatedButton(onPressed: (){
                              if(_formkey.currentState!.validate()){
                                User u=User(Name: name.text, Phonenumber:Phone.text,  Age: age.text, weight: Weight.text, bloodgroup: selc??'Not specified');
                                databasehelp.insertuser(u).then((onValue){
                                  name.clear();
                                  Phone.clear();
                                  age.clear();
                                  Weight.clear();
                                  setState(() {
                                    selc=null;
                                  });
                                });
                              }
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                                return Dashboard();
                              }));
                            },
                                child:Text('REGISTER',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18),),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    width: 3.0,
                                    color:  Color(0xfffc2b6f),
                                  )
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
