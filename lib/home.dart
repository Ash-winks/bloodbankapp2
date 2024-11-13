import 'package:bloodbankapp1/donner%20details.dart';
import 'package:bloodbankapp1/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dbhelp.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  List<Widget>page=[Page1(),Page3()];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
   right: true,
        left: true,
        bottom: true,
        top: true,
        child:Scaffold(
          appBar: AppBar(elevation: 5,
            automaticallyImplyLeading: false,
            
            title: Text('WELCOME',style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 25),),
          ),
          body: Column(
                   children: [
                     Stack(
                       children:[
                         Container(height: 210,width: double.infinity,
                         child: PageView.builder(itemCount: page.length,
                           controller: controller,
                           itemBuilder: (BuildContext context, int index) {
                           return Padding(
                             padding: const EdgeInsets.all(1.0),
                             child: Container(
                               child: page[index],
                             ),
                           );
                           },)
                       ),]
                     ),
                      Flexible(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          color: Color(0x42d5cfcf),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16.5, 10, 10, 0),
                                child: Row(
                                  children: [
                                    Stack(
                                        children:[
                                          Container(
                                            width: 120,height: 110,
                                            child: Padding(
                                                padding:EdgeInsets.fromLTRB(15,65 , 1, 10) ,
                                                child: Text('Campaign',style: GoogleFonts.lato(
                                                    fontSize: 19,fontWeight: FontWeight.bold
                                                ),)),
                                            decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.white
                                                        )
                                                      ],
                                                borderRadius: BorderRadius.circular(20),
                                                      color: Colors.white
                                            ),
                                          ),
                                          Positioned(left: 29,top: 10,
                                              child: Icon(Icons.campaign_sharp,color: Color(0xffe91d62),size: 50,),
                                            ),

                                        ]
                                    ),
                                    SizedBox(width: 10,),
                                    Stack(
                                        children:[
                                          Container(
                                            width: 120,height: 110,
                                            child: Padding(
                                                padding:EdgeInsets.fromLTRB(27,65 , 1, 10) ,
                                                child: Text('Donate',style: GoogleFonts.lato(
                                                  fontSize: 19,fontWeight: FontWeight.bold
                                                ),)),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.white
                                                  )
                                                ],
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.white
                                            ),
                                          ),
                                          Positioned(bottom: 30,left: 10,
                                            child: Image.asset('asset/image/bloodbag2n.png',width: 95,)
                                          ),
                                          // Icon(Icons.bloodtype,color:Color(0xffe91d62) ,)
                                        ]
                                    ),
                                    SizedBox(width: 10,),
                                    Stack(
                                        children:[
                                          Container(
                                            width: 120,height: 110,
                                            child: Padding(
                                                padding:EdgeInsets.fromLTRB(10,65 , 1, 10) ,
                                                child: Text('Blood Bank',style: GoogleFonts.lato(
                                                  fontSize: 19,fontWeight: FontWeight.bold
                                                ),)),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.white
                                                  )
                                                ],
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.white
                                            ),
                                          ),
                                          Positioned(left: 29,top: 10,
                                            child: Icon(Icons.bloodtype,color: Color(0xffe91d62),size: 50,),
                                          ),

                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 170, 10),
                                child: Container(
                                  width: 200,height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xff3b3b3b)
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(child: Text('DONATION REQUEST',style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Card(elevation: 8,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 250,height: 100,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color(0xd7ff0052)
                                                    )
                                                  ],
                                                  borderRadius: BorderRadius.circular(20)
                                              ),
                                            ),
                                            Positioned(top: 10,left: 5,
                                                child: Icon(Icons.person)),
                                            Positioned(
                                                left: 35,top: 8,
                                                child: Text('John',style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white),)),
                                            Positioned(left: 5,top: 40,
                                                child: Icon(Icons.location_on_outlined)),
                                            Positioned(
                                                left: 35,top: 40,
                                                child: Text('Multispeciality '
                                                    'Hospital',style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white),))
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 20,),
                                      Stack(
                                        children: [
                                          Card(elevation: 8,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                            child: Container(
                                              width: 250,height: 100,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color(0xd6ff0052)
                                                    )
                                                  ],
                                                  borderRadius: BorderRadius.circular(20),

                                              ),
                                            ),
                                          ),
                                          Positioned(top: 10,left: 5,
                                              child: Icon(Icons.person)),
                                          Positioned(
                                              left: 35,top: 8,
                                              child: Text('Ajith',style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white),)),
                                          Positioned(left: 5,top: 40,
                                              child: Icon(Icons.location_on_outlined)),
                                          Positioned(
                                              left: 35,top: 40,
                                              child: Text('Harmony Health Center',style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.bold,color:Colors.white ),))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 5, 110, 5),
                                child: Container(
                                  width: 200,height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xff3b3b3b)
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(child: Text('AVAILABLE DONNERS',style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),)),
                                ),
                              ),

                                  InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                                          return Donnerlist();
                                        }));
                                      },
                                      child: Text('SEE All',style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.bold),)),

                            ],
                          ),
                              Container(
                                height: 150,
                                child: Mylistt(),
                              ) ,
                            ],
                          ),
                        ),
                      )



                   ],
              ),

          ),
          );
  }
}
class Mylistt extends StatelessWidget {
  const Mylistt({super.key});

  @override
  Widget build(BuildContext context) {
    Databasehelp databasehelp=Databasehelp();
    return SizedBox.expand(
      child:FutureBuilder(future: databasehelp.getall(),
        builder: (BuildContext context, AsyncSnapshot<List<User>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Card(
            elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                height: 90,width: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(11, 30, 0, 0),
                    child: Text('No Donor Available',style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 17),),
                  )),
            ));
          }else{
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length> 2 ? 2: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final user = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  Container(
                        height: 90,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0x42d5cfcf),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 43, 0, 0),
                              child: Divider(
                                thickness: 2,
                                indent: 17,
                                endIndent: 70,
                              ),
                            ),
                             Positioned(
                              left: 10,
                              top: 25,
                              child: Icon(Icons.person),
                            ),
                            Positioned(
                              left: 199,
                              top: 60,
                              child: InkWell(
                                child:  CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: InkWell(
                                    onTap: () async {
                                      final Uri smsUri = Uri(scheme: 'sms', path: user.Phonenumber);//message functionality using urllauncher
                                      if (await canLaunchUrl(smsUri)) {
                                      await launchUrl(smsUri);
                                      } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Could not launch SMS')),
                                      );
                                      }
                                    },
                                      child: Icon(Icons.message)),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 150,
                              top: 60,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: InkWell(
                                  onTap: () async {
                                    final Uri phoneUri = Uri(scheme: 'tel', path: user.Phonenumber);//  call functionality using urllauncher
                                    if (await canLaunchUrl(phoneUri)) {
                                    await launchUrl(phoneUri);
                                    } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Could not launch call')),
                                    );
                                    }
                                  },
                                  child:  Icon(Icons.call),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 22,
                              left: 50,
                              child: Text(
                                user.Name,
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 65,
                              left: 16,
                              child: Text(
                                user.Phonenumber,
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 210,
                              child: Container(
                                height: 45,
                                width: 50,
                                decoration: BoxDecoration(
                                  color:  Color(0xfffc2b6f),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.elliptical(36, 36),
                                    topRight: Radius.elliptical(17, 17)
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(6, 4, 1, 0),
                                  child: Text(
                                    user.bloodgroup,
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
              },
              separatorBuilder: (BuildContext context, int index) {
                return  SizedBox(width: 8);
              },
            );
          }
        },
      ),
    );
  }
}
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          child: Container(
              width: double.infinity,height:double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

              ),
              child: Container(
                child: Stack(
                  children: [
                    Positioned(right: 130,bottom: 5,
                        child: Image.asset('asset/image/bloodbag2n.png',width: 200,height: 200,)),
                    Positioned(left: 120,top: 20,
                        child: Text('BLOOD',style: GoogleFonts.lato(fontSize: 23,fontWeight: FontWeight.bold),)),
                    Positioned(left: 120,top: 47,
                        child: Text('DONATION',style: GoogleFonts.lato(fontSize: 23,fontWeight: FontWeight.bold),)),
                    Positioned(left: 120,top: 74,
                        child: Text('DRIVE',style: GoogleFonts.lato(fontSize: 23,fontWeight: FontWeight.bold),)),
                    Positioned(left: 115,top: 115,
                      child: Container(
                        width: 120,height: 30,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff3b3b3b)
                          )
                        ],
                        borderRadius: BorderRadius.circular(10)
                      ),
                        child: Center(child: Text('30 November',style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)),
                      ),
                    ),
                    Positioned(left: 120,top: 145,
                        child: Text('10 AM Onwards',style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold),))
                  ],
                ),
              )
          ),
        ),
      )
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Container(
              width: double.infinity,height:double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

              ),
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,top: 15,
                        child: Text('YOUR BLOOD',style: GoogleFonts.lato(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)) ,
                    Positioned(
                        left: 32,top: 40,
                        child: Text('MAKE',style: GoogleFonts.lato(color: Color(0xffe91d62),fontWeight: FontWeight.bold,fontSize: 25),)),
                    Positioned(
                        left: 31,top: 70,
                        child: Text('OTHERS',style: GoogleFonts.lato(color: Color(0xffe91d62),fontWeight: FontWeight.bold,fontSize: 25),)),
                    Positioned(
                        left: 32,top: 100,
                        child: Text('HAPPY',style: GoogleFonts.lato(color: Color(0xffe91d62),fontWeight: FontWeight.bold,fontSize: 25),)),
                    Positioned(left: 130,top: 10,
                        child: Image.asset('asset/image/bloodicon.png',width: 160,))

                  ],
                ),
              )
            ),
          ),
        )
    );
  }
}



