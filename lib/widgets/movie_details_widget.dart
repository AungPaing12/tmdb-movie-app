import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/data/model/movie_model/movie_model.dart';
import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
import 'package:movie_app/widgets/easy_text.dart';
import 'package:movie_app/widgets/text_rating_votes_on_image.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import 'list_tile.dart';

MovieModel _movieModel = MovieModelImpl();

class AboutMovieAndRecommendMovie extends StatelessWidget {
  const AboutMovieAndRecommendMovie({Key? key,
    required this.storyLine,
    required this.movieName,
    required this.actorName,
    required this.crewName,
    required this.productionCompanyName,
    required this.actorImageURL,
    required this.crewImageURL,
    required this.productionCompanyImageURL,
    required this.movieImageURL,
    required this.actorName1,
    required this.actorName2,
    required this.crewName1,
    required this.crewName2,
    required this.productionCompanyName1,
    required this.actorImageURL1,
    required this.actorImageURL2,
    required this.crewImageURL1,
    required this.crewImageURL2,
    required this.productionCompanyImageURL1,
    required this.textRatingVotesOnImages,
    required this.textRatingVotesOnImages1,
    required this.textRatingVotesOnImages2,
    required this.textRatingVotesOnImages3,
    required this.textRatingVotesOnImages4,
    required this.productionCompanyName2,
    required this.productionCompanyImageURL2,
    required this.genres,
    required this.runTime})
      : super(key: key);
  final String storyLine;
  final String genres;
  final String movieName;
  final String actorName;
  final String actorName1;
  final String actorName2;
  final String crewName;
  final String crewName1;
  final String crewName2;
  final String productionCompanyName;
  final String productionCompanyName1;
  final String productionCompanyName2;
  final TextRatingVotesOnImages textRatingVotesOnImages;
  final TextRatingVotesOnImages textRatingVotesOnImages1;
  final TextRatingVotesOnImages textRatingVotesOnImages2;
  final TextRatingVotesOnImages textRatingVotesOnImages3;
  final TextRatingVotesOnImages textRatingVotesOnImages4;
  final String movieImageURL;
  final String actorImageURL;
  final String actorImageURL1;
  final String actorImageURL2;
  final String crewImageURL;
  final String crewImageURL1;
  final String crewImageURL2;
  final String productionCompanyImageURL;
  final String productionCompanyImageURL1;
  final String productionCompanyImageURL2;
  final int runTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
        [
          SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kBlackColor,
              expandedHeight: kAboutMoviesSliverAppBarHeight,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title: EasyText(
                      text: movieName,
                      fontSize: kFontSize18x,
                      fontWeight: FontWeight.w600,
                      color: kWhiteColor),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: movieImageURL,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(kSP20x),
                                    child: Image.asset(
                                        'images/tmdb_place_holder.png'))),
                        errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 40),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundColor: kPinkAccentColor,
                              child: Icon(
                                Icons.arrow_back,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child:
                        Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: EasyText(text:genres,color: Colors.white,fontSize: 14,)),
                              EasyText(text:' $runTime' ,color: Colors.white,fontSize: 14,)
                          ],
                        ),
                      )
                    ],
                  ))),
        ],
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              width: kDetailScreenOfMovieSizeWidth,
              height: kDetailScreenOfMovieSizeHeight,
              color: kBlackColor,
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: kSP10x, top: kSP20x),
                          child: EasyText(
                            text: kStoryLineText,
                            color: kWhiteColor,
                            fontSize: kFontSize16x,
                            fontWeight: FontWeight.w600,
                          ))),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: kSP10x, top: kSP20x),
                      child: EasyText(
                        text: storyLine,
                        color: kGreyColor,
                        fontSize: kFontSize12x,
                      ),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kSP10x, vertical: kSP20x),
                          child: EasyText(
                            text: kStarCastText,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: kFontSize18x,
                          ))),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTileItemView(
                          actors: kActorText,
                          actorsName: actorName,
                          imageURL: actorImageURL,
                          radius: 20,
                        ),
                        ListTileItemView(
                          actors: kActressText,
                          actorsName: actorName1,
                          imageURL: actorImageURL1,
                          radius: 20,
                        ),
                        ListTileItemView(
                          actors: kActorText,
                          actorsName: actorName2,
                          imageURL: actorImageURL2,
                          radius: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: kSP10x,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kSP10x, vertical: kSP10x),
                          child: EasyText(
                              text: "Talent Squad",
                              color: kWhiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: kFontSize18x))),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListTileItemView(
                          actors: kCrewText,
                          actorsName: crewName,
                          imageURL: crewImageURL,
                          radius: 20,
                        ),
                        ListTileItemView(
                          actors: kCrewText,
                          actorsName: crewName1,
                          imageURL: crewImageURL1,
                          radius: 20,
                        ),
                        ListTileItemView(
                          actors: kCrewText,
                          actorsName: crewName2,
                          imageURL: crewImageURL2,
                          radius: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: kSP10x,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kSP10x, vertical: kSP10x),
                          child: EasyText(
                            text: kProductionCompanyText,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: kFontSize18x,
                          ))),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(kSP10x),
                        child: ProductionCompanyViewItem(
                          text: productionCompanyName,
                          imageURL: productionCompanyImageURL,
                        ),
                      ),
                      ProductionCompanyViewItem(
                        text: productionCompanyName1,
                        imageURL: productionCompanyImageURL1,
                      ),
                      ProductionCompanyViewItem(
                        text: productionCompanyName2,
                        imageURL: productionCompanyImageURL2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: kSP20x,
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: kSP20x),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: EasyText(
                              text: 'Recommended',
                              fontSize: kFontSize18x,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      SizedBox(
                        width: kRecommendedMoviesSizeWidth,
                        height: kRecommendedMoviesSizeHeight,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            textRatingVotesOnImages,
                            textRatingVotesOnImages1,
                            textRatingVotesOnImages2,
                            textRatingVotesOnImages3,
                            textRatingVotesOnImages4,
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class ProductionCompanyViewItem extends StatelessWidget {
  const ProductionCompanyViewItem(
      {Key? key, required this.imageURL, required this.text})
      : super(key: key);
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
        EasyText(
          text: text,
          fontSize: kFontSize14x,
          fontWeight: FontWeight.w600,
          color: kGreyColor,
        )
      ],
    );
  }
}
