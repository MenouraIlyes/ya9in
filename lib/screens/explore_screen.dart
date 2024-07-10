import 'package:flutter/material.dart';
import 'package:ya9in/widgets/custom_heading.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // Heading
            SizedBox(height: 30),
            CustomHeading(
              title: 'Explore',
              subTitle: 'Seek for your preference',
              color: Colors.black,
            ),

            // Search bar

            // Top Searches

            // Categories
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
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: getBody(),
    );
  }
}
