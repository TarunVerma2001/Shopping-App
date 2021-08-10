import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(left: 15, right: 15),
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: 
            // SizedBox(height: 85,),
            Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      // color: Color(0xfffdd148),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.1, 2],
                          colors: [Color(0xfffdd148), Colors.white],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -200,
                      right: 100,
                      child: Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Color(0xfffee16d),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -150,
                      left: 200,
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          color: Color(0xfffee16d).withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  // top: 50,
                  // left: 15,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50,),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.arrow_back_rounded,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Text(
                            'Privacy Policy',
                            style: GoogleFonts.quicksand(
                                fontSize: 50, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xff423F3E),
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            child: infoCard(
                                context,
                                'WHAT DO WE DO WITH YOUR INFORMATION?',
                                'When you purchase something from our store, as part of the buying and selling process, we collect the personal information you give us such as your name, address and email address. When you browse our store, we also automatically receive your computer’s internet protocol (IP) address in order to provide us with information that helps us learn about your browser and operating system. Email marketing (if applicable): With your permission, we may send you emails about our store, new products and other updates.'),
                          ),
                          Container(
                            child: infoCard(
                                context,
                                'DISCLOSURE',
                                'We may disclose your personal information if we are required by law to do so or if you violate our Terms of Service.'),
                          ),
                          Container(
                            child: infoCard(
                                context,
                                'THIRD-PARTY SERVICES',
                                'In general, the third-party providers used by us will only collect, use and disclose your information to the extent necessary to allow them to perform the services they provide to us. However, certain third-party service providers, such as payment gateways and other payment transaction processors, have their own privacy policies in respect to the information we are required to provide to them for your purchase-related transactions. For these providers, we recommend that you read their privacy policies so you can understand the manner in which your personal information will be handled by these providers. In particular, remember that certain providers may be located in or have facilities that are located a different jurisdiction than either you or us. So if you elect to proceed with a transaction that involves the services of a third-party service provider, then your information may become subject to the laws of the jurisdiction(s) in which that service provider or its facilities are located. Once you leave our store’s website or are redirected to a third-party website or application, you are no longer governed by this Privacy Policy or our website’s Terms of Service. Links When you click on links on our store, they may direct you away from our site. We are not responsible for the privacy practices of other sites and encourage you to read their privacy statements.'),
                          ),
                          Container(
                            child: infoCard(context, 'SECURITY', 'To protect your personal information, we take reasonable precautions and follow industry best practices to make sure it is not inappropriately lost, misused, accessed, disclosed, altered or destroyed.'),
                          ),
                          Container(child: infoCard(context, 'CHANGES TO THIS PRIVACY POLICY', 'We reserve the right to modify this privacy policy at any time, so please review it frequently. Changes and clarifications will take effect immediately upon their posting on the website. If we make material changes to this policy, we will notify you here that it has been updated, so that you are aware of what information we collect, how we use it, and under what circumstances, if any, we use and/or disclose it. If our store is acquired or merged with another company, your information may be transferred to the new owners so that we may continue to sell products to you.'),)
                        ]),
                  ),
                ),
              ],
            ),
      ),
    );
  }

  Widget infoCard(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 15,
          child: Text(
            title,
            style: GoogleFonts.quicksand(
                fontSize: 25,
                color: Color(0xff362222),
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width - 15,
          child: Text(
            content,
            style: GoogleFonts.quicksand(fontSize: 20, color: Colors.black),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
