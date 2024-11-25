import 'package:bloodbankapp1/features/dashboard/dashboard.dart';
import 'package:bloodbankapp1/core/dbhelp.dart';
import 'package:bloodbankapp1/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Donnerlist extends StatefulWidget {
  const Donnerlist({super.key});

  @override
  State<Donnerlist> createState() => _DonnerlistState();
}

class _DonnerlistState extends State<Donnerlist> {

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext) {
                return Dashboard();
              }));
            },
            icon: Icon(Icons.arrow_back_sharp),
          ),
          title: Text(
            'DONORS LIST',
            style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Container(
          color: Color(0xb8d5cfcf).withOpacity(0.3),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by blood group',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (query) {
                    setState(() {
                      _searchQuery = query;
                    });
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(width: 300,
                    child: Mylistt(searchQuery: _searchQuery),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Mylistt extends StatelessWidget {
  final String searchQuery;

  const Mylistt({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    Databasehelp databasehelp = Databasehelp();

    return FutureBuilder<List<User>?>(
      future: databasehelp.getall(),
      builder: (BuildContext context, AsyncSnapshot<List<User>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 90,
                width: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(11, 30, 0, 0),
                  child: Text(
                    'No Donor Available',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          // Filter donors based on blood group search query
          final filteredDonors = snapshot.data!
              .where((user) =>
              user.bloodgroup.toLowerCase().contains(searchQuery.toLowerCase()))
              .toList();

          if (filteredDonors.isEmpty) {
            return Center(child: Text('No matching donors found.'));
          }

          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: filteredDonors.length,
            itemBuilder: (BuildContext context, int index) {
              final user = filteredDonors[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0x42d5cfcf),
                      borderRadius: BorderRadius.circular(10),
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
                          left: 15,
                          top: 25,
                          child: Icon(Icons.person),
                        ),
                        Positioned(
                          left: 199,
                          top: 60,
                          child: InkWell(
                            child: CircleAvatar(
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
                              child: Icon(Icons.call),
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
                          left: 224,
                          child: Container(
                            height: 45,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xfffc2b6f),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(36, 36),
                                topRight: Radius.elliptical(17, 17),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 1, 0),
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
              return SizedBox(height: 10);
            },
          );
        }
      },
    );
  }
}
