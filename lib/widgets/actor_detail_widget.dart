import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/bloc/actor_detail_bloc.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/constant/dimens.dart';
import 'package:movie_app/data/vos/known_for_vo/known_for_vo.dart';
import 'package:movie_app/widgets/text_rating_votes_on_image.dart';
import 'package:provider/provider.dart';
import '../constant/api_constant.dart';
import '../constant/strings.dart';
import '../network/response/actor_detail_response/actor_detail_response.dart';
import 'actors_info_widget.dart';
import 'easy_text.dart';

class ActorsInfoAndHisMovies extends StatelessWidget {
  const ActorsInfoAndHisMovies({
    Key? key,required this.movieList,
  }) : super(key: key);
  final List<KnownForVO>? movieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: Selector<ActorDetailBloc, ActorDetailResponseVO?>(
        selector: (_, bloc) => bloc.getActorDetailList,
        builder: (context, actorDetail, child) => NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
                automaticallyImplyLeading: false,
                floating: true,
                backgroundColor: kBlackColor,
                expandedHeight: kActorSliverAppBarHeight,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    title: EasyText(
                        text: actorDetail?.name ?? '',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: kWhiteColor),
                    collapseMode: CollapseMode.parallax,
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              '$kPrefixEndPoint${actorDetail?.profilePath ?? ''}',
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
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                BiographyItemView(
                  actorDetailResponseVO: actorDetail,
                ),
                MoreInformationView(
                  actorDetailResponseVO: actorDetail,
                ),
                 KnownForMovieView(movieList: movieList ?? []),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BiographyItemView extends StatelessWidget {
  const BiographyItemView({Key? key, required this.actorDetailResponseVO})
      : super(key: key);
  final ActorDetailResponseVO? actorDetailResponseVO;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          padding:
              const EdgeInsets.symmetric(horizontal: kSP10x, vertical: kSP10x),
          child: EasyText(
            text: actorDetailResponseVO?.biography ?? '',
            fontSize: kFontSize16x,
            color: kGreyColor,
          ),
        ),
      ],
    );
  }
}

class MoreInformationView extends StatelessWidget {
  const MoreInformationView({Key? key, required this.actorDetailResponseVO})
      : super(key: key);
  final ActorDetailResponseVO? actorDetailResponseVO;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        ActorInfoWidget(
            placeOfBirth: actorDetailResponseVO?.placeOfBirth ?? '',
            birthday: actorDetailResponseVO?.birthday ?? '',
            deadDay: actorDetailResponseVO?.deathday ?? '',
            gender: actorDetailResponseVO?.gender ?? 0,
            popularity: actorDetailResponseVO?.popularity ?? 0),
      ],
    );
  }
}


class KnownForMovieView extends StatelessWidget {
  const KnownForMovieView({Key? key, required this.movieList}) : super(key: key);
  final List<KnownForVO>? movieList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            itemCount: movieList?.length,
            itemBuilder: (context, index) {
              return TextRatingVotesOnImages(
                positionFillTop1: 100,
                movieName: movieList?[index].title ?? '',
                rating: movieList?[index].voteAverage ?? 0,
                votes: movieList?[index].voteCount ?? 0,
                imageURL: movieList?[index].posterPath??'',
                movieID: movieList?[index].id ?? 0,
              );
            },
          ),
        ),
      ],
    );
  }
}
