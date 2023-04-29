import 'package:flutter/material.dart';

import '../view_item/home_page_view_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 30,
            ),
            SearchMovieBarAndSearchIconViewItem(),

          ],
        ),
      ),
    );
  }
}
