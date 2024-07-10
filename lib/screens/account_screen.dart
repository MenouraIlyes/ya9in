import 'package:flutter/material.dart';
import 'package:ya9in/datas/account_menu_json.dart';
import 'package:ya9in/widgets/custom_button.dart';
import 'package:ya9in/widgets/custom_heading.dart';
import 'package:ya9in/widgets/custom_place_holder.dart';
import 'package:ya9in/widgets/custom_title.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Widget getBody() {
    List items = AccountMenuJson[2]['categories'];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            SizedBox(height: 30),
            CustomHeading(
              title: 'Account',
              subTitle: 'Student',
              color: Colors.black,
            ),

            // Support
            SizedBox(height: 50),
            CustomTitle(
              title: 'Support',
              extend: false,
            ),
            SizedBox(height: 25),
            Column(
              children: List.generate(
                items.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CunstomPlaceHolder(
                      title: items[index]['title'],
                    ),
                  );
                },
              ),
            ),

            // Sign in Button
            SizedBox(height: 50),
            CustomButtonBox(
              title: 'Sign in',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: getBody(),
    );
  }
}
