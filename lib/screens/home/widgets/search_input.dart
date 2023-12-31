import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    Container(
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color.fromARGB(255, 255, 0, 0).withOpacity(0.1)),
      ),
      // ignore: prefer_const_constructors
      child: TextField(
          cursorColor: Colors.black,
          // ignore: prefer_const_constructors
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 82, 78, 78),
            filled: true,
            contentPadding: const EdgeInsets.all(18),
            border: InputBorder.none,
            hintText: 'Search for Physics , Chemistry or Maths,....',
            hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          )),
    )
      ],
    );
  }
}
