import 'package:flutter/material.dart';
import 'package:shikshamiraz/screens/home/widgets/category_title.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActiveCourse extends StatelessWidget {
  const ActiveCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryTitle("Active Courses", "View All courses"),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
              border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 1),
              borderRadius: BorderRadius.circular(8)),
          child:Column(children: [
           Row(
            children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/images/physics.png', width: 100,height: 100)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Laws of Motion',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text("2 lessons left",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 250, 2, 2),
                    ))
              ],
            ),
            Expanded(
              child: CircularPercentIndicator(
                radius: 40,
                lineWidth: 5.0,
                percent: 0.75,
                center: const Text(
                  "75%",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                progressColor: const Color.fromARGB(255, 255, 2, 2),
              ),
            ),
          ],
          ),
          Row(
            children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/images/chemistry.png', width: 100,height: 100,)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  's-Block',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text("3 lessons left",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 250, 2, 2),
                    ))
              ],
            ),
            Expanded(
              child: CircularPercentIndicator(
                radius: 40,
                lineWidth: 5.0,
                percent: 0.65,
                center: const Text(
                  "65%",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                progressColor: const Color.fromARGB(255, 255, 2, 2),
              ),
            ),
          ],
          ),
      ],)
  
        ),
      ],
    );
  }
}
