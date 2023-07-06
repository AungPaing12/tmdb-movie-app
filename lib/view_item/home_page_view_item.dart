import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/dimens.dart';
import 'package:movie_app/data/vos/recommend_movie_hive_vo/movie_hive_vo.dart';
import 'package:movie_app/page/search_page.dart';
import 'package:movie_app/widgets/easy_text.dart';
import 'package:provider/provider.dart';
import '../bloc/home_page_bloc.dart';
import '../constant/api_constant.dart';
import '../constant/colors.dart';
import '../constant/strings.dart';
import '../data/vos/actor_vo/actor_result_vo.dart';
import '../data/vos/movie_genres_vo/movie_genres_vo.dart';
import '../data/vos/movie_vo/result_vo.dart';
import '../widgets/actors_widget.dart';
import '../widgets/movie_genre.dart';
import '../widgets/text_rating_votes_on_image.dart';

class SearchMovieBarAndSearchIconViewItem extends StatelessWidget {
  const SearchMovieBarAndSearchIconViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SearchPage()));
        },
        child: Row(
          children: [
            Container(
              width: kSearchMovieSizeWidth,
              height: kSearchMovieSizeHeight,
              decoration: BoxDecoration(
                color: kBlack45Color,
                borderRadius: BorderRadius.circular(kSP20x),
              ),
              child: const Padding(
                padding: EdgeInsets.all(kSP15x),
                child: EasyText(
                  text: kSearchMoviesText,
                  color: kWhiteColor,
                  fontSize: kFontSize14x,
                ),
              ),
            ),
            const SizedBox(
              width: kSP25x,
            ),
            Container(
              width: kSearchIconSizeWidthHeight,
              height: kSearchIconSizeWidthHeight,
              decoration: BoxDecoration(
                color: kPinkAccentColor,
                borderRadius: BorderRadius.circular(kSP10x),
              ),
              child: const Icon(
                Icons.search,
                color: kWhiteColor,
                size: kSP25x,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieTypeScrollItemView extends StatelessWidget {
  const MovieTypeScrollItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieGenresVO>?>(
        shouldRebuild: (pre, next) => pre != next,
        selector: (_, bloc) => bloc.getGenreList,
        builder: (_, genreList, __) {
          if (genreList == null) {
            return const Center(
              child: EasyText(text: 'NoData'),
            );
          }
          if (genreList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return MovieGenreView(
            genresList: genreList,
            onTap: (genreList) {
              final instance = context.read<HomePageBloc>();
              instance.genreMovieIsSelected(genreList);
              instance.getGenreID(genreList.id ?? 0);
            },
          );
        });
  }
}

class MovieGenreView extends StatelessWidget {
  const MovieGenreView(
      {Key? key, required this.genresList, required this.onTap})
      : super(key: key);
  final List<MovieGenresVO> genresList;
  final Function(MovieGenresVO) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSP50x,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genresList.length,
        padding: const EdgeInsets.symmetric(horizontal: kSP10x),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onTap(genresList[index]);
            },
            child: MovieGenre(
              text: genresList[index].name ?? '',
              color:
                  (genresList[index].isSelect) ? kPinkAccentColor : kBlackColor,
            ),
          );
        },
      ),
    );
  }
}

class CarouselSliderViewItem extends StatelessWidget {
  const CarouselSliderViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, MovieHiveVO?>(
        selector: (_, bloc) => bloc.getNowPlayingMovieList,
        builder: (_, nowPlayingMovieList, __) {
          if (nowPlayingMovieList == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return FirstScrollImageWithPlayButtonViewItem(
            movieVO: nowPlayingMovieList.movieList,
          );
        });
  }
}

class FirstScrollImageWithPlayButtonViewItem extends StatelessWidget {
  const FirstScrollImageWithPlayButtonViewItem(
      {Key? key, required this.movieVO})
      : super(key: key);
  final List<MovieVO>? movieVO;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kSP20x),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 300,
          aspectRatio: 5 / 3,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 1),
          autoPlayAnimationDuration: const Duration(seconds: 5),
          autoPlayCurve: Curves.ease,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
        items: movieVO
            ?.map((movie) {
              return Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: kSP5x),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: '$kPrefixEndPoint${movie.posterPath ?? ''}',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                    'images/tmdb_place_holder.png'))),
                        errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: kSP20x,
                      backgroundColor: kPinkAccentColor,
                      child: Icon(Icons.play_arrow_outlined),
                    ),
                  ),
                  Positioned.fill(
                    top: kSP170x,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            })
            .take(5)
            .toList(),
      ),
    );
  }
}

class SmallestMovieViewItem extends StatelessWidget {
  const SmallestMovieViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, MovieHiveVO?>(
        selector: (_, bloc) => bloc.getMovieList,
        builder: (_, movieList, __) {
          if (movieList == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SmallestMoviesScrollViewItem(
            movieVo: movieList.movieList,
          );
        });
  }
}

class SmallestMoviesScrollViewItem extends StatelessWidget {
  const SmallestMoviesScrollViewItem({Key? key, required this.movieVo})
      : super(key: key);
  final List<MovieVO>? movieVo;

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, ScrollController>(
      selector: (_, bloc) => bloc.getScrollControllerForMovieByGenres,
      builder: (_, controller, __) => Padding(
        padding: const EdgeInsets.only(top: kSP20x),
        child: SizedBox(
          width: kSmallestMoviesScrollSizeWidth,
          height: kSmallestMoviesScrollSizeHeight,
          child: ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: movieVo?.length,
            itemBuilder: (context, index) {
              return TextRatingVotesOnImages(
                imageURL: movieVo?[index].posterPath ?? '',
                movieName: movieVo?[index].title ?? '',
                votes: movieVo?[index].voteCount ?? 0,
                rating: movieVo?[index].voteAverage ?? 0,
                positionFillTop1: 110,
                movieID: movieVo?[index].id ?? 0,
              );
            },
          ),
        ),
      ),
    );
  }
}

class TopRatedMovieViewItem extends StatelessWidget {
  const TopRatedMovieViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieVO>?>(
        selector: (_, bloc) => bloc.youMayLikeMovieList,
        builder: (_, movieList, __) {
          if (movieList == null) {
            return const Center(
              child: EasyText(text: 'NoData'),
            );
          }
          if (movieList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return YouMayLikeMovieViewItem(
            topRated: movieList,
          );
        });
  }
}

class YouMayLikeMovieViewItem extends StatelessWidget {
  const YouMayLikeMovieViewItem({Key? key, required this.topRated})
      : super(key: key);
  final List<MovieVO>? topRated;

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, ScrollController>(
      selector: (_, bloc) => bloc.getScrollControllerForTopRatedMovie,
      builder: (_, controller, __) => Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: kSP20x),
            child: Align(
                alignment: Alignment.topLeft,
                child: EasyText(
                  text: kYouMaylikeText,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
          ),
          SizedBox(
            width: kYouMayLikeMovieSizeWidth,
            height: kYouMayLikeMovieSizeHeight,
            child: ListView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: topRated?.length,
              itemBuilder: (context, index) {
                return TextRatingVotesOnImages(
                  imageURL: topRated?[index].posterPath ?? '',
                  votes: topRated?[index].voteCount ?? 0,
                  rating: topRated?[index].voteAverage ?? 0,
                  movieName: topRated?[index].title ?? '',
                  positionFillTop1: 140,
                  movieID: topRated?[index].id ?? 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<MovieVO>?>(
        selector: (_, bloc) => bloc.getPopularMovieList,
        builder: (_, movieList, __) {
          if (movieList == null) {
            return const Center(
              child: EasyText(text: 'NoData'),
            );
          }
          if (movieList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return PopularMovieViewItem(
            popularMovieVO: movieList,
          );
        });
  }
}

class PopularMovieViewItem extends StatelessWidget {
  const PopularMovieViewItem({Key? key, required this.popularMovieVO})
      : super(key: key);
  final List<MovieVO>? popularMovieVO;

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, ScrollController>(
      selector: (_, bloc) => bloc.getScrollControllerForPopularMovie,
      builder: (_, controller, __) => Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: kSP20x),
            child: Align(
                alignment: Alignment.topLeft,
                child: EasyText(
                  text: kPopularText,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w600,
                )),
          ),
          SizedBox(
            width: kPopularMovieSizeWidth,
            height: kPopularMovieSizeHeight,
            child: ListView.builder(
              controller: controller,
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
    );
  }
}

class ActorViewItem extends StatelessWidget {
  const ActorViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<ActorResultsVO>?>(
        selector: (_, bloc) => bloc.getActorList,
        builder: (_, actorList, __) {
          if (actorList == null) {
            return const Center(
              child: EasyText(text: 'NoData'),
            );
          }
          if (actorList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Actor(
            actorResultsVO: actorList,
          );
        });
  }
}
