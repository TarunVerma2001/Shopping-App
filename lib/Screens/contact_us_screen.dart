import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
late String name;
late String message;
late String email;
class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_rounded,
                          color: Colors.black, size: 30))),
              SizedBox(
                height: 20,
              ),
              Text('Contact Us',
                  style: GoogleFonts.quicksand(
                      fontSize: 40, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 40,
              ),
              infoCard('Name', 'Ex: John Wick', 1, 50, 0),
              infoCard('Email', 'Ex: someone@email.com', 1, 50, 1),
              infoCard('Message', 'Ex: Hii There!', 8, 150, 2),
              Center(
                child: GestureDetector(
                  onTap: (){
                    _launchURL('verma.tarun200109@gmail.com', name + " " + email, message);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 2],
                        colors: [Colors.yellow, Colors.orange],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Send',
                        style: GoogleFonts.quicksand(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget infoCard(
    String title,
    String hintText,
    int lines,
    double height,
    int index,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.quicksand(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.w500)),
        SizedBox(
          height: 30,
        ),
        Container(
          height: height,
          child: TextFormField(
            maxLines: lines,
            onChanged: (value) {
              if(index == 0){
                name = value;
              } else if(index == 1){
                email = value;
              } else{
                message = value;
              }
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              // hintMaxLines: 7,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: Colors.black12.withOpacity(0.05),
              filled: true,
              contentPadding: EdgeInsets.only(left: 15, top: 15),
              hintText: hintText,
              hintStyle: GoogleFonts.quicksand(color: Colors.grey),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
