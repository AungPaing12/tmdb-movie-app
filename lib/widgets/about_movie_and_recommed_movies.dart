

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/widgets/easy_text.dart';
import 'package:movie_app/widgets/text_rating_votes_on_image.dart';


import '../constant/dimens.dart';
import '../constant/strings.dart';
import 'list_tile.dart';

class AboutMovieAndRecommedMovie extends StatelessWidget {
  const AboutMovieAndRecommedMovie({Key? key,
    required this.storyLine, required this.movieName,
    required this.actorName, required this.crewName,
    required this.productionCompanyName,
    required this.actorImgeURL,
    required this.crewImgeURL,
    required this.productionComapnyImgeURL,
    required this.movieImageURL,
    required this.textratingvoteonimgaes,
    required this.actorName1,
    required this.actorName2,
    required this.crewName1,
    required this.crewName2,
    required this.productionCompanyName1,
    required this.actorImgeURL1,
    required this.actorImgeURL2,
    required this.crewImgeURL1,
    required this.crewImgeURL2,
    required this.productionComapnyImgeURL1,
    required this.textratingvoteonimgaes1,
    required this.textratingvoteonimgaes2,
    required this.textratingvoteonimgaes3,
    required this.textratingvoteonimgaes4})
      : super(key: key);
  final String storyLine;

  final String movieName;
  final String actorName;
  final String actorName1;
  final String actorName2;
  final String crewName;
  final String crewName1;
  final String crewName2;
  final String productionCompanyName;
  final String productionCompanyName1;
  final TextRatingVotesOnImages textratingvoteonimgaes;
  final TextRatingVotesOnImages textratingvoteonimgaes1;
  final TextRatingVotesOnImages textratingvoteonimgaes2;
  final TextRatingVotesOnImages textratingvoteonimgaes3;
  final TextRatingVotesOnImages textratingvoteonimgaes4;
  final String movieImageURL;
  final String actorImgeURL;
  final String actorImgeURL1;
  final String actorImgeURL2;
  final String crewImgeURL;
  final String crewImgeURL1;
  final String crewImgeURL2;
  final String productionComapnyImgeURL;
  final String productionComapnyImgeURL1;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)=>[
          SliverAppBar(
            backgroundColor: kBlackColor,
            expandedHeight: kAboutMoviesSliverAppBarHeight,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: EasyText( text: movieName,fontSize: kFontSize18x,fontWeight: FontWeight.w600,color: kWhiteColor),

              background:
              CachedNetworkImage(
                imageUrl:
                movieImageURL,
                fit: BoxFit.cover,

                placeholder: (context, url) => Center(child: ClipRRect(
                    borderRadius: BorderRadius.circular(kSP20x),
                    child: Image.asset('images/tmdb_place_holder.png'))),
                errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),

              ),
            )
          ),

        ],
        body:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: kDetailScreenOfMovieSizeWidth,
            height: kDetailScreenOfMovieSizeHeight,
            color: kBlackColor,
            child: Column(
              children:  [
                  const Align(alignment: Alignment.topLeft,
                    child: Padding(padding: EdgeInsets.only(left: kSP10x,top: kSP20x),
                        child: EasyText(text: kStoryLineText,color: kWhiteColor,fontSize: kFontSize16x,fontWeight: FontWeight.w600,))),
                 Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: kSP10x,top: kSP20x),
                    child: EasyText(text: storyLine,
                      color: kGreyColor,fontSize: kFontSize12x,),
                  ),
                ),
                const Align(alignment: Alignment.topLeft,
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: kSP10x,vertical: kSP20x),
                        child: EasyText(text: kStarCastText,color: kWhiteColor,fontWeight: FontWeight.w600,fontSize: kFontSize18x,))),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:  [
                     ListTileItemView(actors: kActorText,actorsName:actorName ,imageURL: actorImgeURL, radius: 20,),
                     ListTileItemView(actors: kActressText,actorsName:actorName1 ,imageURL: actorImgeURL1,radius: 20,),
                     ListTileItemView(actors: kActorText,actorsName:actorName2,imageURL: actorImgeURL2,radius: 20,),
                   ],
                 ),
               ),
                const SizedBox(
                  height: kSP10x,
                ),
                const Align(alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: kSP10x,vertical: kSP10x),
                        child: EasyText(text: "Talent Squad",color: kWhiteColor,
                            fontWeight: FontWeight.w600,fontSize: kFontSize18x))),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ListTileItemView(actors: kCrewText,actorsName:crewName ,imageURL: crewImgeURL,radius: 20,),
                      ListTileItemView(actors: kCrewText,actorsName:crewName1,imageURL: crewImgeURL1,radius: 20,),
                      ListTileItemView(actors: kCrewText,actorsName:crewName2 ,imageURL: crewImgeURL2,radius: 20,),
                    ],
                  ),
                ),
                const SizedBox(
                  height: kSP10x,
                ),
                const Align(alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: kSP10x,vertical: kSP10x),
                        child: EasyText(text: kProductionCompanyText,color: kWhiteColor,fontWeight: FontWeight.w600,fontSize:kFontSize18x,))),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kSP10x),
                      child: ProductionCompanyViewItem(
                        text: productionCompanyName,
                        imageURL: productionComapnyImgeURL,
                      ),
                    ),
                    ProductionCompanyViewItem(
                      text: productionCompanyName1,
                      imageURL: productionComapnyImgeURL1,
                    ),
                  ],
                ),
            const SizedBox(
              height: kSP20x,
            ),
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(left: kSP20x),
                  child: Align(alignment: Alignment.topLeft,
                      child: EasyText(text: 'Recommended',fontSize: kFontSize18x,color: kWhiteColor,fontWeight: FontWeight.w600,)
                  ),
                ),
                SizedBox(
                  width: kRecommendedMoviesSizeWidth,
                  height: kRecommendedMoviesSizeHeight,

                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:  [
                    textratingvoteonimgaes,
                      textratingvoteonimgaes1,
                      textratingvoteonimgaes2,
                      textratingvoteonimgaes3,
                      textratingvoteonimgaes4,
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
            ),
          ),
        ),
      );
  }
}

class ProductionCompanyViewItem extends StatelessWidget {
  const ProductionCompanyViewItem({Key? key, required this.imageURL, required this.text}) : super(key: key);
  final String imageURL;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageURL),
          radius: kSP30x,
        ),
        const SizedBox(
          height: kSP10x,
        ),
        EasyText(text: text,fontSize: kFontSize14x,fontWeight: FontWeight.w600,color: kGreyColor,)
      ],
    );
  }
}
