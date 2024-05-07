import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

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
