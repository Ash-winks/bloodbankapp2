import 'package:bloodbankapp1/dashboard.dart';
import 'package:bloodbankapp1/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController Namecontroller =TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController Phonecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController confirmcontroller= TextEditingController();
  final GlobalKey<FormState>_fromkey=GlobalKey<FormState>();
  bool pvisvible= true;
  bool visible=true;
  void toggle(){
    setState(() {
      pvisvible=!pvisvible;
    });
  }
  void togle(){
      setState(() {
        visible=!visible;
      });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Form(key: _fromkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.fromLTRB(35, 60, 20, 0),
                child: Container(child: Image.asset('asset/image/appstore.png',width: 180,)),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: Namecontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            hintText: 'Username',
                            prefixIcon: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                    child: Icon(Icons.person,color: Color(0xfffc2b6f))),
                                Positioned(
                                    left: 65,
                                    child: Container(
                                      width: 1,
                                      height: 40,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                            prefixIconConstraints: BoxConstraints(minWidth: 80)
                        ),
                        validator: (value){
                          if(value!.length==0){
                            return 'Must fill';
                          }else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller:emailcontroller ,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            hintText: 'Email',
                            prefixIcon: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                    child: Icon(Icons.email_outlined,color: Color(0xfffc2b6f))),
                                Positioned(
                                    left: 65,
                                    child: Container(
                                      width: 1,
                                      height: 40,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                            prefixIconConstraints: BoxConstraints(minWidth: 80)
                        ),
                        validator: (value){
                          if(value!.length==0){
                            return 'Must fill';
                          }else{
                            return null;
                          }
                        },
                      ), SizedBox(height: 10,),
                      TextFormField(
                        controller: Phonecontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            hintText: 'Phone number',
                            prefixIcon: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                    child: Icon(Icons.phone_in_talk_outlined,color: Color(0xfffc2b6f))),
                                Positioned(
                                    left: 65,
                                    child: Container(
                                      width: 1,
                                      height: 40,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                            prefixIconConstraints: BoxConstraints(minWidth: 80)
                        ),
                        validator: (value){
                          if(value!.length==0){
                            return 'Must fill';
                          }else{
                            return null;
                          }
                        },
                      ), SizedBox(height: 10,),
                      TextFormField(
                        controller: passcontroller,
                        obscureText: pvisvible,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            hintText: 'Password',
                            prefixIcon: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                    child: Icon(Icons.lock_open,color: Color(0xfffc2b6f))),
                                Positioned(
                                    left: 65,
                                    child: Container(
                                      width: 1,
                                      height: 40,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                            prefixIconConstraints: BoxConstraints(minWidth: 80),
                          suffixIcon: IconButton(onPressed: (){
                            toggle();
                            }, 
                              icon: pvisvible?Icon(Icons.visibility):Icon(Icons.visibility_off))
                        ),
                        validator: (value){
                          if(value!.length==0){
                            return 'Must fill';
                          }else{
                            return null;
                          }
                        },
                      ), SizedBox(height: 10,),
                      TextFormField(
                        controller: confirmcontroller,
                        obscureText: visible,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            hintText: 'Confirm Password',
                            prefixIcon: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                    child: Icon(Icons.lock_outlined,color: Color(0xfffc2b6f))),
                                Positioned(
                                    left: 65,
                                    child: Container(
                                      width: 1,
                                      height: 40,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                            prefixIconConstraints: BoxConstraints(minWidth: 80),
                          suffixIcon: IconButton(onPressed: (){
                            togle();
                          }, icon:visible?Icon(Icons.visibility):Icon(Icons.visibility_off) )
                        ),
                        validator: (value){
                          if(value!.length==0){
                            return 'Must fill';
                          }else if(value!=passcontroller.text){
                            return 'password does not match';
                          }
                          else{
                            return null;
                          }
                        },
                      ), SizedBox(height: 20,),
                    Container(width: 250,height: 45,
                      child: ElevatedButton(onPressed: () async {
                        if(_fromkey.currentState!.validate()){
                          SharedPreferences pref=await SharedPreferences.getInstance();
                          pref.setString("username",Namecontroller.text);
                          pref.setString("Mail ID", emailcontroller.text);
                          pref.setString("Password", passcontroller.text);
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                            return Dashboard();
                          }));
                        }
                      },
                          child:Text('REGISTER',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),),
                          style: ElevatedButton.styleFrom(backgroundColor:   Color(0xfffc2b6f),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  width: 3.0,
                                  color:  Color(0xfffc2b6f),
                                )
                            ),
                          ) ),
                    ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(75, 10, 10, 0),
                child: Row(
                  children: [
                    Text('Already have an account?',style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 18),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                        return Loginpage();
                      }));
                    }, child: Text('Login',style: GoogleFonts.lato(color:  Color(0xfffc2b6f),fontWeight: FontWeight.bold,fontSize: 18),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
