import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool toggle = true;
late String name;
late String contactNumber;
List<bool> selected = [true, false, false, false];

class AddressScreen extends StatefulWidget {
  int price;
  AddressScreen({required this.price});
  bool toggle = true;
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  void toggleSelected(int ind) {
    setState(() {
      for (int i = 0; i < 4; i++) {
        selected[i] = false;
      }
      selected[ind] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,
                            color: Colors.black, size: 30))),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text('Add Address',
                    style: GoogleFonts.quicksand(
                        fontSize: 40, fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CupertinoSwitch(
                    value: toggle,
                    onChanged: (s) {
                      setState(() {
                        toggle = s;
                      });
                    },
                    // trackColor: Colors.white,
                    activeColor: Color(0xfffdd148),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text('set as default address',
                    style: GoogleFonts.quicksand(
                        fontSize: 15, color: Colors.grey)),
              ),
              SizedBox(height: 40),
              infoCard('Recipient', 'Ex: Tom Cruize'),
              SizedBox(height: 30),
              infoCard('Contact Number', 'Ex: 9836****91'),
              SizedBox(height: 30),
              infoCard('Area', 'Ex: New Town'),
              SizedBox(height: 30),
              infoCard('Address', 'Ex: street y, block x, city z'),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Set label',
                  style: GoogleFonts.quicksand(
                      fontSize: 20, color: Colors.black54),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: labelSelector(),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 2],
                    colors: [Colors.yellow, Colors.orange],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 40,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Center(
                    child: Text(
                      'Save and Use',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget labelSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            // print(0);
            setState(() {
              toggleSelected(0);
            });
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: selected[0] ? Color(0xfffdd148) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Center(
                child: Text(
                  'Home',
                  style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: selected[0] ? Colors.white : Colors.black38,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // print(1);
            setState(() {
              toggleSelected(1);
            });
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: selected[1] ? Color(0xfffdd148) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Center(
                child: Text(
                  'Office',
                  style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: selected[1] ? Colors.white : Colors.black38,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // print(2);
            setState(() {
              toggleSelected(2);
            });
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: selected[2] ? Color(0xfffdd148) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Center(
                child: Text(
                  'School',
                  style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: selected[2] ? Colors.white : Colors.black38,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // print(3);
            setState(() {
              toggleSelected(3);
            });
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: selected[3] ? Color(0xfffdd148) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Center(
                child: Text(
                  'Other',
                  style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: selected[3] ? Colors.white : Colors.black38,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget infoCard(
    String title,
    String hintText,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(title,
                style: GoogleFonts.quicksand(
                    fontSize: 20, color: Colors.black54))),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextFormField(
            onChanged: (value) {
              // name = value;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              fillColor: Colors.black12.withOpacity(0.05),
              filled: true,
              contentPadding: EdgeInsets.only(left: 15, top: 15),
              hintText: hintText,
              hintStyle: GoogleFonts.quicksand(color: Colors.grey),
            ),
          ),
        )
      ],
    );
  }
}
