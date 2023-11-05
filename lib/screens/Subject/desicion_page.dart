import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shikshamiraz/common/styles/colors.dart';
import 'package:shikshamiraz/screens/Subject/longcourse_card.dart';
import 'package:shikshamiraz/screens/chat/chat_learn.dart';
import 'package:shikshamiraz/screens/home/widgets/category_title.dart';
import 'package:shikshamiraz/screens/test/test_home.dart';
import 'package:http/http.dart' as http;

class DesPage extends StatelessWidget {
  final String subtitle;

  const DesPage(this.subtitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 25,top: 25),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Learn : $subtitle ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
            ),
                        const SizedBox(height: 20),

            Center(child: InkWell(
              child: LongCourseCard(
                background: AppColors.pink,
                title: "Learning Module",
                subtitle: subtitle,
                image: "assets/images/physics.png",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatLearn(subtitle),
                  ),
                );
              },
            ),),
            const SizedBox(height: 20),
            Column(
              children: [
                const CategoryTitle("Take Quiz", " ",),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/physics.png',
                            width: 100),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Take a quiz',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30, bottom: 40),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          var url = Uri.parse(
                              'http://127.0.0.1:5000/api/ques?data=$subtitle');
                          var response = await http.get(url);

                          if (response.statusCode == 200) {
                            var body = response.body;
                            final json =
                                jsonDecode(body) as Map<String, dynamic>;
                            final data = Map<String, Map<String, dynamic>>.from(
                              json.cast<String, Map<String, dynamic>>(),
                            );
                            // print(data);

                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TestHome(
                                questions: data,
                              ),
                            ));
                          } else {
                            // Handle HTTP error responses, e.g., response.statusCode is not 200
                            // print('HTTP Request Error: ${response.statusCode}');
                          }
                        } catch (e) {
                          // Handle any exceptions that occur during the request
                          // print('Network Request Error: $e');
                        }
                      },
                      child: const Text('Start'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
