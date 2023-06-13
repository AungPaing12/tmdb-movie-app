import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/dimens.dart';
import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
import 'package:movie_app/widgets/easy_text.dart';
import '../constant/api_constant.dart';
import '../constant/colors.dart';
import '../constant/strings.dart';
import '../data/model/movie_model/movie_model.dart';
import '../data/vos/movie_genres_vo/movie_genres_vo.dart';
import '../data/vos/movie_vo/result_vo.dart';
import '../widgets/movie_genre.dart';
import '../widgets/text_rating_votes_on_image.dart';

final MovieModel _movieModel = MovieModelImpl();

class SearchMovieBarAndSearchIconViewItem extends StatelessWidget {
  const SearchMovieBarAndSearchIconViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Row(
        children: [
          Container(
            width: kSearchMovieSizeWidth,
            height: kSearchMovieSizeHeight,
            decoration: BoxDecoration(
              color: kGreyColor,
              borderRadius: BorderRadius.circular(kSP20x),
            ),
            child: const Padding(
              padding: EdgeInsets.all(kSP10x),
              child: EasyText(
                text: kSearchMoviesText,
                color: kWhiteColor,
                fontSize: kFontSize16x,
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
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}

class MovieTypeScrollItemView extends StatefulWidget {
  const MovieTypeScrollItemView({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieTypeScrollItemView> createState() =>
      _MovieTypeScrollItemViewState();
}

class _MovieTypeScrollItemViewState extends State<MovieTypeScrollItemView> {
  MovieModel movieModel = MovieModelImpl();
  List<MovieGenresVO> genreList = [];

  @override
  void initState() {
    movieModel.getMovieGenreList();
    movieModel.getMovieGenreListFromDataBase().listen((event) {
      if (mounted) {
        setState(() {
          genreList = event ?? [];
          final firstData = genreList.first;
          firstData.isSelect = true;
          genreList.removeAt(0);
          genreList.insert(0, firstData);
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MovieGenreView(
      genresList: genreList,
      onTap: (genres) {
        setState(() {
          genreList = genreList.map((e) {
            if (e == genres) {
              e.isSelect = true;
            } else {
              e.isSelect = false;
            }

            return e;
          }).toList();
        });
      },
    );
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
      height: 50,
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

class CarouselSliderViewItem extends StatefulWidget {
  const CarouselSliderViewItem({Key? key}) : super(key: key);

  @override
  State<CarouselSliderViewItem> createState() => _CarouselSliderViewItemState();
}

class _CarouselSliderViewItemState extends State<CarouselSliderViewItem> {
  MovieModel movieModel = MovieModelImpl();
  List<MovieVO> movieList = [];

  @override
  void initState() {
    _movieModel.getNowPlayingList();
    _movieModel.getNowPlayingListFromDataBase().listen((event) {
      setState(() {
        movieList = event ?? [];
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FirstScrollImageWithPlayButtonViewItem(movieVO: movieList,);
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
        items: movieVO?.map((movie) {
          return Stack(
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: const EdgeInsets.symmetric(horizontal: kSP5x),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: '$kPrefixEndPoint${movie.posterPath ?? ''}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child:
                                Image.asset('images/tmdb_place_holder.png'))),
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
        }).toList(),
      ),
    );
  }
}

class SmallestMovieViewItem extends StatefulWidget {
  const SmallestMovieViewItem({Key? key}) : super(key: key);

  @override
  State<SmallestMovieViewItem> createState() => _SmallestMovieViewItemState();
}

class _SmallestMovieViewItemState extends State<SmallestMovieViewItem> {
  MovieModel movieModel = MovieModelImpl();
  List<MovieVO> movieList = [];

  @override
  void initState() {
    _movieModel.getNowPlayingList();
    _movieModel.getNowPlayingListFromDataBase().listen((event) {
      setState(() {
        movieList = event ?? [];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmallestMoviesScrollViewItem(movieVo: movieList,);
  }
}

class SmallestMoviesScrollViewItem extends StatelessWidget {
  const SmallestMoviesScrollViewItem({Key? key, required this.movieVo})
      : super(key: key);
  final List<MovieVO>? movieVo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kSP20x),
      child: SizedBox(
        width: kSmallestMoviesScrollSizeWidth,
        height: kSmallestMoviesScrollSizeHeight,
        child: ListView.builder(
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
    );
  }
}

class TopRatedMovieViewItem extends StatefulWidget {
  const TopRatedMovieViewItem({Key? key}) : super(key: key);

  @override
  State<TopRatedMovieViewItem> createState() => _TopRatedMovieViewItemState();
}

class _TopRatedMovieViewItemState extends State<TopRatedMovieViewItem> {
  MovieModel movieModel = MovieModelImpl();
  List<MovieVO> movieList = [];

  @override
  void initState() {
    _movieModel.getTopRatedMovieList();
    _movieModel.getTopRatedMovieListFromDataBase().listen((event) {
      setState(() {
        movieList = event ?? [];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YouMayLikeMovieViewItem(topRated: movieList,);
  }
}

class YouMayLikeMovieViewItem extends StatelessWidget {
  const YouMayLikeMovieViewItem({Key? key, required this.topRated})
      : super(key: key);
  final List<MovieVO>? topRated;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class PopularMoviesView extends StatefulWidget {
  const PopularMoviesView({Key? key}) : super(key: key);

  @override
  State<PopularMoviesView> createState() => _PopularMoviesViewState();
}

class _PopularMoviesViewState extends State<PopularMoviesView> {
  MovieModel movieModel = MovieModelImpl();
  List<MovieVO> movieList = [];

  @override
  void initState() {
    _movieModel.getPopularMovieList();
    _movieModel.getPopularMovieListFromDataBase().listen((event) {
      setState(() {
        movieList = event ?? [];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopularMovieViewItem(popularMovieVO: movieList,);
  }
}

class PopularMovieViewItem extends StatelessWidget {
  const PopularMovieViewItem({Key? key, required this.popularMovieVO})
      : super(key: key);
  final List<MovieVO>? popularMovieVO;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

