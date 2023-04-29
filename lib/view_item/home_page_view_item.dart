import 'package:flutter/material.dart';
import 'package:movie_app/widgets/easy_text.dart';

class SearchMovieBarAndSearchIconViewItem extends StatelessWidget {
  const SearchMovieBarAndSearchIconViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 250,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(padding: EdgeInsets.all(10),
                child: EasyText(text: 'Search Movies ...',color: Colors.white,fontSize: 16,),
          ),
          ),
             const SizedBox(
              width: 15,
            ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.search,color:Colors.white,size: 25,
            ),
          )
        ],
      ),
    );
  }
}

class MovieGenereScrollViewItem extends StatelessWidget {
  const MovieGenereScrollViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
         return Container(

         );
        },


      ),

      );

  }
}
