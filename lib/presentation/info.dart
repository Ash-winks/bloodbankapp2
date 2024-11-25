import 'package:bloodbankapp1/features/authentication/choiceloginorreg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appinfo extends StatefulWidget {
  const Appinfo({super.key});

  @override
  State<Appinfo> createState() => _AppinfoState();
}

class _AppinfoState extends State<Appinfo> {
  PageController pageController=PageController(initialPage: 0);
  int currentpage=0;
  List<Widget>page=[Page1(),Page2(),Page3()];
  void next(){
    setState(() {
      if(currentpage==page.length-1) {
        currentpage = 0;
      }
      if(currentpage<page.length-1){
        currentpage++;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          body: Stack(
            children: [
              PageView(
                controller: pageController,
                children: page,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int page){
                  setState(() {
                    currentpage=page;
                  });
                },
              ),
              Positioned(
                left: 165,top: 770,
                  child: Row(
                    children:[
                      CircleAvatar(radius: 8,
                      backgroundColor: currentpage==0?Color(0xff4F4A45):Color(0xffdee2e6),
                    ),
                      SizedBox(width: 10,),
                      CircleAvatar(radius: 8,
                        backgroundColor: currentpage==1?Color(0xff4F4A45):Color(0xffdee2e6),
                      ),
                      SizedBox(width: 10,),
                      CircleAvatar(radius: 8,
                        backgroundColor: currentpage==2?Color(0xff4F4A45):Color(0xffdee2e6),
                      ),
                    ]
                  ))
            ],
          ),
      floatingActionButton: TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
          return Choice();
        }));
      }, child: Text('SKIP'))
        )
    );
  }
}
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final Shader lineargradient=LinearGradient(
      colors:[Color(0xffee7272),Color(0xffa31818)]
  ).createShader(Rect.fromLTRB(0.0, 0.0, 150.0, 100.0));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,end: Alignment.bottomRight,
                  colors:[Color(0xffe8e3ec),Color(0xffFFFFFF),Color(0xffe8e3ec)]
              )
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(20, 130, 20, 0),
                child: Container(
                         width: 400,height: 250,decoration: BoxDecoration(
                         image: DecorationImage(image: AssetImage('asset/image/blddo.jpg'),fit: BoxFit.fill
                         ),
                         borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffe8e3ec),
                          spreadRadius: 2
                      )
                    ]
                       ),
                     ),
              ),
              SizedBox(height: 50,),
              Padding(padding: EdgeInsets.fromLTRB(20, 20, 20,0 ),
                child: Column(
                  children:[ Text('EVERYONE COULD BE A HERO',
                    style: GoogleFonts.lato(
                        fontSize: 20
                    ),
                  ),
                    Text('Saving life,spreading smiles',
                      style: GoogleFonts.lato(
                          fontSize: 20
                      ),
                    )
                  ]
                ),
              )

            ]
          ),
        ),
      ),
    );
  }
}
class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final Shader lineargradient=LinearGradient(
      colors:[Color(0xffee7272),Color(0xffa31818)]
  ).createShader(Rect.fromLTRB(0.0, 0.0, 150.0, 100.0));
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
     body: Container(
       decoration: BoxDecoration(
           gradient: LinearGradient(
               begin: Alignment.topLeft,end: Alignment.bottomRight,
               colors:[Color(0xffe8e3ec),Color(0xffFFFFFF),Color(0xffe8e3ec)]
           )
       ),
       child: Column(
           children: [
             Padding(padding: EdgeInsets.fromLTRB(20, 130, 20, 0),
               child: Container(
                 width: 400,height: 250,decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage('asset/image/bldo2.jpg'),fit: BoxFit.fill
                   ),
                   borderRadius: BorderRadius.circular(20),
                 boxShadow: [
                   BoxShadow(
                     color: Color(0xffe8e3ec),
                     spreadRadius: 2
                   )
                 ]
               ),
               ),
             ),
             SizedBox(height: 50,),
             Padding(padding: EdgeInsets.fromLTRB(20, 20, 20,0 ),
               child: Text('Donating blood can save multiple lives. There are also several health benefits for donors, including improved heart health, emotional health, and more.',
                 style: GoogleFonts.lato(
                     fontSize: 20
                   ),
             )
             )
           ]
       ),
     ),
    ));
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
    return SafeArea(child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,end: Alignment.bottomRight,
                colors:[Color(0xffe8e3ec),Color(0xffFFFFFF),Color(0xffe8e3ec)]
            )
        ),
        child: Column(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(20, 130, 20, 0),
                child: Container(
                  width: 400,height: 290,decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('asset/image/bldo3.jpg'),fit: BoxFit.fill
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffe8e3ec),
                          spreadRadius: 2
                      )
                    ]
                ),
                ),
              ),
              SizedBox(height: 50,),
              Padding(padding: EdgeInsets.fromLTRB(20, 20, 20,0 ),
                child: Text('“Every drop counts in the journey of saving lives. When you choose to donate blood, you’re not just giving a gift; you’re sharing hope with those in need. Your kindness can make all the difference.”',
                  style: GoogleFonts.lato(
                    fontSize: 20
                  ),
                ),
              )
            ]
        ),
      ),
    ));
  }
}


