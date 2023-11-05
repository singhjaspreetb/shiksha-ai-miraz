import 'package:flutter/material.dart';
import 'package:shikshamiraz/model/courses.dart';
import 'package:shikshamiraz/screens/Subject/desicion_page.dart';
import 'package:shikshamiraz/screens/Subject/longcourse_card.dart';
import 'package:shikshamiraz/common/styles/colors.dart';
import 'package:shikshamiraz/common/styles/styles.dart';

class SubjectPage extends StatelessWidget {
  final String course;
  final List<ModuleData> modules;

  const SubjectPage(this.course, this.modules, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Subject: $course",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Gordita',
      ),
      home: Scaffold(
        body: CategoryPage(course, modules),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String course;
  final List<ModuleData> modules;

  const CategoryPage(this.course, this.modules, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        Container(
          height: size.height / 6,
          width: size.width,
          decoration: const BoxDecoration(
            color: AppColors.purple,
            image: DecorationImage(
              image: AssetImage('assets/images/BG-Gradient.png'),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                child : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  'Subject: $course',
                  style: AppStyle.b32w,
                ),
                const SizedBox(height: 4),
                Text(
                  'Choose the module',
                  style: AppStyle.r18w,
                ),
              ],
            ),
            ),
          ),
        ),
        Container(
          
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          width: size.width,
          decoration: BoxDecoration(
            
            color: Colors.black,
            borderRadius: BorderRadius.circular(34),
          ),
          child: 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: modules.map((module) {
                    return Column(
                      children: [InkWell(
                        child: LongCourseCard(
                              background: AppColors.pink,
                              title: module.title,
                              subtitle: module.subtitle,
                              image: module.image,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DesPage(module.subtitle),
                            ),
                          );
                        },
                      ),]
                    );
                  }).toList(),
                ),
              ),
        ),
      ],
    );
  }
}
