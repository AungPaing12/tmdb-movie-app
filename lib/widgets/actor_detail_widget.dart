import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/constant/dimens.dart';
import 'package:movie_app/widgets/text_rating_votes_on_image.dart';
import '../constant/api_constant.dart';
import '../constant/strings.dart';
import '../data/vos/popular_movies_result_vo/popular_movie_result_vo.dart';
import '../network/response/actor_detail_response/actor_detail_response.dart';
import 'easy_text.dart';

class ActorsInfoAndHisMovies extends StatelessWidget {
  const ActorsInfoAndHisMovies({Key? key,
    this.actorDetailResponseVO,
    this.popularMovieVO
  })
      : super(key: key);

  final ActorDetailResponseVO? actorDetailResponseVO;
  final List<PopularMovieResultsVO>? popularMovieVO;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              backgroundColor: kBlackColor,
              expandedHeight: kActorSliverAppBarHeight,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  title: EasyText(
                      text: actorDetailResponseVO?.name ?? '',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kWhiteColor),
                  collapseMode: CollapseMode.parallax,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: '$kPrefixEndPoint${actorDetailResponseVO?.profilePath ?? ''}',
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
                    ],
                  ))),
        ],
        body: Container(
          width: kDetailScreenOfActorSizeWidth,
          color: kBlackColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: kSP40x, left: kSP10x),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: EasyText(
                        text: kBiographyText,
                        color: kWhiteColor,
                        fontSize: kFontSize18x,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: kSP10x),
                  child: Divider(
                    color: kGreyColor,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kSP10x, vertical: kSP10x),
                  child: EasyText(
                    text: actorDetailResponseVO?.biography ?? '',
                    fontSize: kFontSize16x,
                    color: kGreyColor,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: kSP10x, top: kSP30x),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: EasyText(
                        text: kMoreInformationText,
                        fontSize: kFontSize20x,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: kSP10x),
                  child: Divider(
                    color: kGreyColor,
                    thickness: 1,
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(left: kSP10x),
                        child: EasyText(
                          text: kPlaceOfBirthText,
                          color: kGreyColor,
                          fontSize: kFontSize16x,
                        )),
                    const SizedBox(
                      width: kSP75x,
                    ),
                    Expanded(
                      child: EasyText(
                        text: actorDetailResponseVO?.placeOfBirth ?? '',
                        color: kGreyColor,
                        fontSize: kFontSize16x,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kSP10x,
                ),
                Row(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(left: kSP10x),
                        child: EasyText(
                          text: kBirthdayText,
                          color: kGreyColor,
                          fontSize: kFontSize16x,
                        )),
                    const SizedBox(
                      width: 115,
                    ),
                    EasyText(
                      text: actorDetailResponseVO?.birthday ?? '',
                      color: kGreyColor,
                      fontSize: kFontSize16x,
                    ),
                  ],
                ),
                const SizedBox(
                  height: kSP10x,
                ),
                ///dead day
                DeathDay(deathDay: actorDetailResponseVO?.deathday ?? '',),
                const SizedBox(
                  height: kSP10x,
                ),
                 ///gender
                Gender(gender: actorDetailResponseVO?.gender ?? 0,),
                const SizedBox(
                  height: kSP10x,
                ),
                Row(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(left: kSP10x),
                        child: EasyText(
                          text: kPopularityText,
                          color: kGreyColor,
                          fontSize: kFontSize16x,
                        )),
                    const SizedBox(
                      width: kSp104x,
                    ),
                    EasyText(
                      text: '${actorDetailResponseVO?.popularity ?? 0}',
                      color: kGreyColor,
                      fontSize: kFontSize16x,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: kSP10x, top: kSP30x),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: EasyText(
                        text: kKnowForText,
                        fontSize: kFontSize20x,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: kSP10x),
                  child: Divider(
                    color: kGreyColor,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  width: kPopularMovieSizeWidth,
                  height: kPopularMovieSizeHeight,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularMovieVO?.length,
                    itemBuilder: (context, index) {
                      return TextRatingVotesOnImages(
                        imageURL: popularMovieVO?[index].posterPath ?? '',
                        positionFillTop1: 100,
                        movieName: popularMovieVO?[index].title ?? '',
                        rating: popularMovieVO?[index].voteAverage ?? 0,
                        votes: popularMovieVO?[index].voteCount ?? 0,
                        movieID: popularMovieVO?[index].id ?? 0,
                      );
                    },
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


class DeathDay extends StatelessWidget {
  const DeathDay({Key? key, required this.deathDay}) : super(key: key);
  final String deathDay;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 10),
            child: EasyText(
              text: kDeadDayText,
              color: kGreyColor,
              fontSize: 16,
            )),
        const SizedBox(
          width: kSP115x,
        ),
        EasyText(
          text: deathDay,
          color: kGreyColor,
          fontSize: 16,
        ),
      ],
    );
  }
}

class Gender extends StatelessWidget {
  const Gender({Key? key, required this.gender}) : super(key: key);
  final int gender;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 10),
            child: EasyText(
              text: kGenderText,
              color: kGreyColor,
              fontSize: 16,
            )),
        const SizedBox(width: kSP125x),
        EasyText(
          text: (gender == 1) ? 'Female' : (gender == 2) ? 'Male' : 'SomethingWrong',
          color: kGreyColor,
          fontSize: 16,
        ),
      ],
    );
  }
}
