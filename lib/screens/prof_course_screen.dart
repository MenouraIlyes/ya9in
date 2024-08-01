import 'package:flutter/material.dart';

class ProfCourseScreen extends StatefulWidget {
  const ProfCourseScreen({super.key});

  @override
  State<ProfCourseScreen> createState() => _ProfCourseScreenState();
}

class _ProfCourseScreenState extends State<ProfCourseScreen> {
  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [],
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
