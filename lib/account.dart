import 'dart:io';

import 'package:bloodbankapp1/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final ImagePicker picker = ImagePicker();//object of imagepicker
  File?pickedimg;//the image picked  will be assigned to this variable
  Future<void> pickedimg_gallery() async {//image picked from gallery
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    File img=File(image!.path);//image will be converted and we will get it in file
    if(img!=null){
      setState(() {
        pickedimg=img!;
      });
    }
  }
  final ImagePicker pick = ImagePicker();//object of imagepicker
  File?pickedimag;//the image picked  will be assigned to this variable
  Future<void> pickedimag_cam() async {//image picked from gallery
    final XFile? image = await pick.pickImage(source: ImageSource.camera);
    File img=File(image!.path);//image will be converted and we will get it in file
    if(img!=null){
      setState(() {
        pickedimag=img!;
      });
    }
  }
  void _showImageSourceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  pickedimg_gallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  pickedimag_cam();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String name='';
  String email='';
  String pass='';
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  Future<void> getdata() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    setState(() {
      name=preferences.getString('username')!;
      email=preferences.getString('Mail ID')!;
      pass=preferences.getString('Password')!;
    });
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
              return Dashboard();
            }));
          }, icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text('PROFILE',style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 25)),
        ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Positioned(left: 130,top: 35,
                        child: CircleAvatar(
                          radius: 70,backgroundColor: Colors.white,
                          child: pickedimag!=null?Image.file(File(pickedimag!.path)):SizedBox(),
                        ),
                      ),
                      Positioned(
                        left: 50,top: 230,
                          child: Container(width: 300,height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.grey)
                              ),
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(48, 3, 0, 2),
                                  child: Text('$name',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18),)))),
                      Positioned(
                        left: 60,top: 235,
                          child: Icon(Icons.person,color: Color(0xffe91d62))),
                      Positioned(
                          top: 205,left: 70,
                          child: Text('Name',style:GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.grey,) ,)),
                      Positioned(
                          left: 50,top: 305,
                          child: Container(width: 300,height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.grey)
                              ),
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(48, 3, 0, 2),
                                  child: Text('$email',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18),)))),
                      Positioned(
                          left: 60,top: 310,
                          child: Icon(Icons.email_outlined,color: Color(0xffe91d62))),
                      Positioned(
                          top: 279,left: 68,
                          child: Text('Email Id',style:GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.grey,) ,)),
                      Positioned(top: 140,left: 175,
                        child: IconButton(onPressed: (){
                          _showImageSourceOptions();
                        },
                            icon: Icon(Icons.camera_alt_outlined,color: Color(0xffe91d62))),
                      )
                    ],
                  ),

            ),
          )

          )
    );
  }
}
