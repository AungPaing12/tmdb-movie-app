import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/constant/dimens.dart';
import 'package:movie_app/widgets/text_rating_votes_on_image.dart';

import '../constant/strings.dart';
import 'easy_text.dart';

class ActorsInfoAndHisMovies extends StatelessWidget {
  const ActorsInfoAndHisMovies({Key? key, required this.actorName, required this.biography, required this.placeOfBirth, required this.birthday, required this.deadDay, required this.gender, required this.popularity, required this.biography1, required this.biography2, required this.actorImageURL}) : super(key: key);
  final String actorName;
  final String biography;
  final String biography1;
  final String biography2;
  final String placeOfBirth;
  final String birthday;
  final String deadDay;
  final String gender;
  final String popularity;
  final String actorImageURL;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true ,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

        SliverAppBar(
            floating: true,
            backgroundColor: kBlackColor,
            expandedHeight: kActorSliveAppBarHeight,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: EasyText( text: actorName,fontSize: 20,fontWeight: FontWeight.w600,color: kWhiteColor),
              collapseMode: CollapseMode.parallax,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                    actorImageURL,
                    fit: BoxFit.cover,

                    placeholder: (context, url) => Center(child: ClipRRect(
                        borderRadius: BorderRadius.circular(kSP20x),
                        child: Image.asset('images/tmdb_place_holder.png'))),
                    errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 60,top: 40),
                  //   child: Align(
                  //     alignment:Alignment.topLeft ,
                  //     child: GestureDetector(
                  //       onTap:  () {
                  //         Navigator.of(context).pop();
                  //       },
                  //       child: const CircleAvatar(
                  //         radius: 20,
                  //         backgroundColor: Colors.pinkAccent,
                  //         child: Icon(
                  //           Icons.arrow_back,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              )

            )
        ),
      ], body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Container(
            width: kDetailScreenOfActorSizeWidth,
            color: kBlackColor,
            child: Column(
              children:  [
                const Padding(padding: EdgeInsets.only(top: kSP40x,left: kSP10x),
                  child: Align(alignment: Alignment.topLeft,
                      child: EasyText(text: kBiographyText,color: kWhiteColor,fontSize: kFontSize18x,fontWeight: FontWeight.w600,)),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: kSP10x),
                  child: Divider(
                    color: kGreyColor,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSP10x,vertical: kSP10x),
                  child: EasyText(text: biography,fontSize: kFontSize16x,color: kGreyColor,),
                ),
               Padding(padding: const EdgeInsets.symmetric(vertical: kSP10x,horizontal: kSP10x),
                    child: EasyText(text: biography1,color: kGreyColor,fontSize: kFontSize16x,)),
                 Padding(padding: const EdgeInsets.symmetric(horizontal: kSP10x,vertical: kSP10x),
                    child: EasyText(text: biography2,color: kGreyColor,fontSize: kFontSize16x,)),

                const Padding(
                  padding: EdgeInsets.only(left: kSP10x,top: kSP30x),
                  child: Align(alignment: Alignment.topLeft,
                      child: EasyText(text: kMoreInformationText,fontSize: kFontSize20x,color: kWhiteColor,fontWeight: FontWeight.w600,)),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: kSP10x),
                  child: Divider(
                    color:kGreyColor,
                    thickness: 1,
                  ),
                ),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(left: kSP10x),
                          child: EasyText(text: kPlaceOfBirthText,color: kGreyColor,fontSize: kFontSize16x,)),
                      const SizedBox(width: kSP75x,),
                      Expanded(
                        child: EasyText(text: placeOfBirth,color: kGreyColor,fontSize: kFontSize16x,),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: kSP10x,
                ),
                Row(
                  children:  [
                    const Padding(padding: EdgeInsets.only(left: kSP10x),
                        child: EasyText(text: kBirthdayText,color: kGreyColor,fontSize: kFontSize16x,)),
                    const SizedBox(
                      width: 115,
                    ),
                    EasyText(text: birthday,color: kGreyColor,fontSize: kFontSize16x,),
                  ],
                ),
                const SizedBox(
                  height: kSP10x,
                ),
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 10),
                        child: EasyText(text: kDeadDayText,color: kGreyColor,fontSize: 16,)),
                    const SizedBox(
                      width: kSP115x,
                    ),
                    EasyText(text: deadDay,color: kGreyColor,fontSize: 16,),
                  ],
                ),
                const SizedBox(
                  height: kSP10x,
                ),
                Row(
                  children:[
                    const Padding(padding: EdgeInsets.only(left: 10),
                        child: EasyText(text: kGenderText,color: kGreyColor,fontSize: 16,)),
                    const SizedBox(
                      width: kSP125x
                    ),
                    EasyText(text: gender,color: kGreyColor,fontSize: 16,),
                  ],
                ),
                const SizedBox(
                  height: kSP10x,
                ),
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: kSP10x),
                        child: EasyText(text: kPopularityText,color: kGreyColor,fontSize: kFontSize16x,)),
                    const SizedBox(
                      width: kSp104x,
                    ),
                    EasyText(text: popularity,color: kGreyColor,fontSize: kFontSize16x,),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: kSP10x,top: kSP30x),
                  child: Align(alignment: Alignment.topLeft,
                      child: EasyText(text: kKnowForText,fontSize: kFontSize20x,color: kWhiteColor,fontWeight: FontWeight.w600,)),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: kSP10x),
                  child: Divider(
                    color: kGreyColor,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  width: kKnownForMoviesSizeWidth,
                  height: kKnownForMoviesSizeHeight,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      TextRatingVotesOnImages(imageURL: 'https://www.abystyle.com/3679429-large_default/demon-slayer-poster-entertainment-district-915x61cm.jpg', movieName: 'Demon Slayer', rating: '9.8', votes: '4390 votes',positionFillTop1: 140,),
                      TextRatingVotesOnImages(imageURL: 'https://thecomicbookstore.in/wp-content/uploads/2022/09/TCBS2491.jpg', movieName: 'Attack On Titan', rating: '6.8', votes: '3290 votes',  positionFillTop1: 140,),
                      TextRatingVotesOnImages(imageURL: 'https://ih1.redbubble.net/image.3304365345.6778/poster,504x498,f8f8f8-pad,600x600,f8f8f8.jpg', movieName: 'One Piece', rating: '8.5', votes: '41280 votes', positionFillTop1: 140,),
                      TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/I/71xz7wU39xL._AC_UF894,1000_QL80_.jpg',movieName: 'Bleach', rating: '7.8', votes: '7390 votes', positionFillTop1: 140,),
                      TextRatingVotesOnImages(imageURL: 'https://pbs.twimg.com/media/FNLNGSSXEAE7-5_.jpg', movieName: 'Spy Family', rating: '9.5', votes: '68390 votes', positionFillTop1: 140,),
                      TextRatingVotesOnImages(imageURL: 'https://resize.cdn.otakumode.com/ex/1200.1200/shop/product/24a2289b9fec4ecea7cf49b919a337c5.jpg', movieName: 'Susume No Tojimaru', rating: '8.7', votes: '6390 votes',positionFillTop1: 140,),

                    ],
                  ),
                ),
              ],
            ),
          ),
      ),

      ),
    );
  }
}
