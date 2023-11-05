import 'package:flutter/material.dart';
import 'package:shikshamiraz/model/courses.dart';
import 'package:shikshamiraz/screens/Subject/subject_page.dart';


class CourseItem extends StatelessWidget {
  final Course courses;
  const CourseItem(this.courses, {super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 380,
          width: 197,
          decoration: BoxDecoration(
              color: const Color.fromARGB(207, 0, 0, 0),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      courses.imgPath,
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        courses.course,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 28, 7), shape: BoxShape.circle),
                      ),
                      Text(
                        courses.length,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
            bottom: 40,
            right: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 243, 33, 33),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SubjectPage(courses.course,courses.modules)));
              },
              child: const Text('Start'),
            ))
      ],
    );
  }
}
