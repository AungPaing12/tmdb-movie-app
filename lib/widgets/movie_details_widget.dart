import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/widgets/easy_text.dart';
import 'package:movie_app/widgets/text_rating_votes_on_image.dart';
import '../constant/api_constant.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/vos/cast_vo/cast_vo.dart';
import '../data/vos/crew_vo/crew_vo.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import '../data/vos/movie_vo/result_vo.dart';
import '../network/response/movie_details_response/movie_details_response.dart';
import 'list_tile.dart';


class AboutMovieAndRecommendMovie extends StatelessWidget {
  const AboutMovieAndRecommendMovie({
    Key? key,
    required this.castVO,
    required this.crewVO,
    required this.similarMovieVO,
    required this.movieDetailsResponse,
  }) : super(key: key);

  final List<CastVO>? castVO;
  final List<CrewVO>? crewVO;
  final List<MovieVO>? similarMovieVO;
  final MovieDetailsResponse? movieDetailsResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kBlackColor,
              expandedHeight: kActorSliverAppBarHeight,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title: EasyText(
                      text: movieDetailsResponse?.originalTitle ?? '',
                      fontSize: kFontSize18x,
                      fontWeight: FontWeight.w600,
                      color: kWhiteColor),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            '$kPrefixEndPoint${movieDetailsResponse?.posterPath ?? ''}',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: (movieDetailsResponse?.genres ?? [])
                                  .map((e) => EasyText(
                                        text: "${e.name} |",
                                        fontSize: 12,
                                        color: kWhiteColor,
                                      ))
                                  .toList(),
                            ),
                            RunTime(
                              runTime: movieDetailsResponse?.runtime ?? 0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ))),
        ],
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                    text: movieDetailsResponse?.overview ?? '',
                    color: kGreyColor,
                    fontSize: kFontSize15x,
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
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: castVO?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListTileItemView(
                        actors: '',
                        actorsName: castVO?[index].name ?? '',
                        imageURL: castVO?[index].profilePath ?? '',
                        radius: 20,
                        genderID: castVO?[index].gender ?? 0,
                      ),
                    );
                  },
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
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: crewVO?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListTileItemView(
                        actors: kCrewText,
                        actorsName: crewVO?[index].name ?? '',
                        imageURL: crewVO?[index].profilePath ?? '',
                        radius: 20,
                        genderID: 3,
                      ),
                    );
                  },
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
              SizedBox(
                height: 100,
                child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movieDetailsResponse?.productionCompanies?.length,
                        itemBuilder: (context, index) {
                          ///return ကျန်ခဲ့မှတော့ data တွေက ဘယ်ပေါ်မတုံး
                          // ဒါမျိုးက မဖြစ်သင့်တဲ့ အမှားနော်
                          // နောက်ဆို သတိထားပေးပါ
                          // ဒီလိုအမှားမျိုးမဖြစ်သင့်ပါဘူး
                          return Padding(
                            padding: const EdgeInsets.all(kSP15x),
                            child: ProductionCompanyViewItem(
                              text: movieDetailsResponse?.productionCompanies?[index].name ?? '',
                              imageURL:
                                  movieDetailsResponse?.productionCompanies?[index].logoPath ?? '',
                            ),
                          );
                        },
                      ),
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: similarMovieVO?.length,
                      itemBuilder: (context, index) {
                        return TextRatingVotesOnImages(
                          movieName: similarMovieVO?[index].title ?? '',
                          rating: similarMovieVO?[index].voteAverage ?? 0,
                          votes: similarMovieVO?[index].voteCount ?? 0,
                          imageURL: similarMovieVO?[index].posterPath ?? '',
                          positionFillTop1: 140,
                          movieID: similarMovieVO?[index].id ?? 0,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: kPrefixEndPoint + imageURL,
              placeholder: (context, url) =>
                  Image.asset('images/tmdb_place_holder.png'),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
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


class RunTime extends StatelessWidget {
  const RunTime({Key? key, required this.runTime}) : super(key: key);
  final int runTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EasyText(
          text: " ${runTime ~/ 60}hr ",
          color: kWhiteColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        EasyText(
          text: "${runTime % 60}min",
          color: kWhiteColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ],
    );
  }
}
