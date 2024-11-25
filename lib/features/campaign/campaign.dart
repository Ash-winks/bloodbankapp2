import 'package:bloodbankapp1/features/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Campaign extends StatefulWidget {
  const Campaign({super.key});

  @override
  State<Campaign> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  Future<void> _openLocation(double latitude, double longitude) async {
    final googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
            return Dashboard();
          }));
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text('CAMPAIGN',style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
      ),
      body: Container(color: Color(0xb8d5cfcf).withOpacity(0.3),
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.05, // Adjust opacity as needed
                child: Image.asset(
                  'asset/image/megaphone.png', // Replace with your image path
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(left: 10,top: 10,
              child: Container(
                child: Row(
                  children: [
                    Text('We have Total',style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 2, 0, 0),
                      child: Text('04 active Campaigns',style: GoogleFonts.lato(color:Color(0xfffc2b6f),fontSize: 17,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
              child: ListView(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'DECEMBER, 20 2024',
                              style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold,color:Color(0xfffc2b6f)),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Invite your friends and colleagues for new blood donation campaign.',
                              style:GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    TextButton.icon(onPressed: (){},
                                      icon: Icon(Icons.radio_button_off,size: 16,color: Colors.grey),
                                      label: Text('I am in',style:GoogleFonts.lato(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),)
                                    )
                                  ],
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    _openLocation(28.62623, 77.21808);
                                  },
                                  icon: Icon(Icons.location_on, color: Colors.black.withOpacity(0.5)),
                                  label: Text(
                                    'VIEW LOCATION',
                                    style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'DECEMBER, 25 2024',
                              style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold,color:Color(0xfffc2b6f)),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Invite your friends and colleagues for new blood donation campaign.',
                              style:GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    TextButton.icon(onPressed: (){},
                                        icon: Icon(Icons.radio_button_off,size: 16,color: Colors.grey),
                                        label: Text('I am in',style:GoogleFonts.lato(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),)
                                    )
                                  ],
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    _openLocation(12.903081, 77.497415);
                                  },
                                  icon: Icon(Icons.location_on, color: Colors.black.withOpacity(0.5)),
                                  label: Text(
                                      'VIEW LOCATION',
                                      style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'DECEMBER, 29 2024',
                              style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold,color:Color(0xfffc2b6f)),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Invite your friends and colleagues for new blood donation campaign.',
                              style:GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    TextButton.icon(onPressed: (){},
                                        icon: Icon(Icons.radio_button_off,size: 16,color: Colors.grey,),
                                        label: Text('I am in',style:GoogleFonts.lato(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),)
                                    )
                                  ],
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    _openLocation(33.348930, 44.377571);
                                  },
                                  icon: Icon(Icons.location_on, color: Colors.black.withOpacity(0.5)),
                                  label: Text(
                                      'VIEW LOCATION',
                                      style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'January, 04 2024',
                              style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold,color:Color(0xfffc2b6f)),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Invite your friends and colleagues for new blood donation campaign.',
                              style:GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    TextButton.icon(onPressed: (){},
                                        icon: Icon(Icons.radio_button_off,size: 16,color: Colors.grey,),
                                        label: Text('I am in',style:GoogleFonts.lato(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),)
                                    )
                                  ],
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    _openLocation(17.495081, 78.403450);
                                  },
                                  icon: Icon(Icons.location_on, color: Colors.black.withOpacity(0.5)),
                                  label: Text(
                                      'VIEW LOCATION',
                                      style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ]
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
