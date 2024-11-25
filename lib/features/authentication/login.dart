import 'package:bloodbankapp1/features/dashboard/dashboard.dart';
import 'package:bloodbankapp1/features/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  final _formkey=GlobalKey<FormState>();
  void showmyalert(BuildContext context){
    AlertDialog alertDialog=AlertDialog(
      content: Text('User not found,please register'),
    );
    showDialog(context: context, barrierDismissible: true,builder: (BuildContext context) {
      return alertDialog;
    });
  }
  Future<dynamic> _log() async {
    if(_formkey.currentState!.validate()){
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      String?storedemail=sharedPreferences.getString('Mail ID');
      String?storedpass=sharedPreferences.getString('Password');
      if(storedemail==email.text && storedpass==pass.text){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext){
          return Dashboard();
        }));
      }else{
       return showmyalert(context);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Form(key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 140, 0, 0),
                child: Image.asset('asset/image/appstore.png',width: 180,),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
          
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.mail_lock_outlined,color: Color(0xfffc2b6f),),
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
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  obscureText: true,
                  controller: pass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.password_outlined,color: Color(0xfffc2b6f),),
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
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 20, 0),
                child: Container(width: 320,height: 45,
                  child: ElevatedButton(onPressed: _log,
                    child: Text('LOGIN',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),),
                    style: ElevatedButton.styleFrom(backgroundColor:   Color(0xfffc2b6f),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            width: 3.0,
                            color:  Color(0xfffc2b6f),
                          )
                      ),
                    ),),
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(10, 170, 10, 0),
                child: Row(
                  children: [
                    Text('Do not have an account?',style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 18),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                        return Signuppage();
                      }));
                    }, child: Text('Register as new user',style: GoogleFonts.lato(color:  Color(0xfffc2b6f),fontWeight: FontWeight.bold,fontSize: 18),))
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
