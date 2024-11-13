import 'package:bloodbankapp1/login.dart';
import 'package:bloodbankapp1/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Choice extends StatefulWidget {
  const Choice({super.key});

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(60, 190, 20, 0),
            child: Image.asset('asset/image/appstore.png',width: 180,)
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text('Saving lives is in your hands – donate blood',style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(45, 20, 20, 0),
            child: Container(width: 320,height: 45,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                  return Loginpage();
                }));
              },
                  child: Text('LOGIN',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Color(0xfffc2b6f),fontSize: 18),),
                style: ElevatedButton.styleFrom(
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
          Padding(
            padding: EdgeInsets.fromLTRB(45, 20, 20, 0),
            child: Container(width: 320,height: 45,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                  return Signuppage();
                }));
              },
                child: Text('SIGNUP',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),),
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
          )
        ],
      ) ,
    ));
  }
}
