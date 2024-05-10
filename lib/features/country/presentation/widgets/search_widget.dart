// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  const SearchWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      decoration: BoxDecoration(
          color: Color(0xFFEAEAEA),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 3)),
      child: Center(
        child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 18),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  size: 32,
                  color: Colors.black,
                ))),
      ),
    );
  }
}
