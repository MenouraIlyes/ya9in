import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_expand_card.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // WhatsApp
            CustomExpandCard(
              contact: '(213) 542 40 66 21',
              icon: FaIcon(
                FontAwesomeIcons.whatsapp,
                color: appPrimary,
              ),
              title: 'WhatsApp',
            ),
            SizedBox(height: 20),

            // website
            CustomExpandCard(
              contact: 'yakin.education.dz',
              icon: FaIcon(
                FontAwesomeIcons.globe,
                color: appPrimary,
              ),
              title: 'Website',
            ),
            SizedBox(height: 20),

            // Facebook
            CustomExpandCard(
              contact: 'Yakin Education',
              icon: FaIcon(
                FontAwesomeIcons.facebook,
                color: appPrimary,
              ),
              title: 'Facebook',
            ),
            SizedBox(height: 20),

            // Twitter
            CustomExpandCard(
              contact: 'Yakin_edu',
              icon: FaIcon(
                FontAwesomeIcons.twitter,
                color: appPrimary,
              ),
              title: 'Twitter',
            ),
            SizedBox(height: 20),

            // Instagram
            CustomExpandCard(
              contact: 'yakin_off',
              icon: FaIcon(
                FontAwesomeIcons.instagram,
                color: appPrimary,
              ),
              title: 'Instagram',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        backgroundColor: appSecondary,
        centerTitle: true,
        title: Text(
          'Support',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: appWhite,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appWhite),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: getBody(),
    );
  }
}
