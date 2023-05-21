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
import '../data/vos/popular_movies_result_vo/popular_movie_result_vo.dart';
import '../widgets/movie_details_widget.dart';
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

class MovieGenreViewItem extends StatelessWidget {
  const MovieGenreViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieGenresVO>?>(
        future: _movieModel.getMovieGenreList(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapShot.hasError) {
            return const Center(
              child: Text("Error Fetching"),
            );
          }
          final listGenre = snapShot.data;
          return MovieGenreScrollViewItem(
            movieGenres: listGenre,
          );
        });
  }
}

class MovieGenreScrollViewItem extends StatelessWidget {
  const MovieGenreScrollViewItem({Key? key, required this.movieGenres})
      : super(key: key);
  final List<MovieGenresVO>? movieGenres;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kMovieGenreSearchWidth,
      height: kMovieGenreSearchHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieGenres?.length,
        itemBuilder: (context, index) {
          return MovieGenre(
            text: movieGenres?[index].name ?? '',
            color: kPinkAccentColor,
          );
        },
      ),
    );
  }
}

class CarouselSliderViewItem extends StatelessWidget {
  const CarouselSliderViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieVO>?>(
        future: _movieModel.getMoviesList(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapShot.hasError) {
            return const Center(
              child: Text("Error Fetching"),
            );
          }
          final listMovie = snapShot.data;
          return FirstScrollImageWithPlayButtonViewItem(
            movieVO: listMovie,
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
        items: movieVO?.map((movie) {
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

class SmallestMovieViewItem extends StatelessWidget {
  const SmallestMovieViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieVO>?>(
        future: _movieModel.getMoviesList(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapShot.hasError) {
            return const Center(
              child: Text("Error Fetching"),
            );
          }
          final listMovie = snapShot.data;
          return SmallestMoviesScrollViewItem(
            movieVo: listMovie,
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
    return Padding(
      padding: const EdgeInsets.only(top: kSP20x),
      child: SizedBox(
        width: kSmallestMoviesScrollSizeWidth,
        height: kSmallestMoviesScrollSizeHeight,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AboutMovieAndRecommendMovie(
                            storyLine:
                                "On the lush alien world of Pandora live the Na'vi, beings who appear primitive but are highly evolved. Because the planet's environment is poisonous, human/Na'vi hybrids, called Avatars, must link to human minds to allow for free movement on Pandora. Jake Sully (Sam Worthington), a paralyzed former Marine, becomes mobile again through one such Avatar and falls in love with a Na'vi woman (Zoe Saldana). As a bond with her grows, he is drawn into a battle for the survival of her world.",
                            movieName: 'Avator :The Way Of Water',
                            productionCompanyName: '20th Century Studios',
                            productionCompanyName1: 'TSG Entertainment',
                            productionCompanyImageURL:
                                'https://media.sketchfab.com/models/1d21693ae946418a807c8b9fcd6aa4e1/thumbnails/352dd88f2daa4fb8810a01d0858fb8b0/be2b9214fcea42a0a4729bdd44f1eaa8.jpeg',
                            productionCompanyImageURL1:
                                'https://i.ytimg.com/vi/9kNJYLgYKKU/maxresdefault.jpg',
                            movieImageURL:
                                'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_.jpg',
                            actorName: "Sam Worthington",
                            actorName1: 'Zoe Saldana',
                            actorName2: 'Stephen Lang',
                            crewName: 'Jon Landau',
                            crewName1: 'James Cameron',
                            crewName2: 'Russell Carpenter',
                            actorImageURL:
                                'https://m.media-amazon.com/images/M/MV5BZWUwNmEwZTUtYzMxMS00ODg5LTlmYjItMGU4ZjNmN2Q1NjkwXkEyXkFqcGdeQXVyMTM1MjAxMDc3._V1_.jpg',
                            actorImageURL1:
                                'https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/12/03/17/Zoe-Saldana-Getty.jpg',
                            actorImageURL2:
                                'https://m.media-amazon.com/images/M/MV5BMjE4NzYwNTc5Nl5BMl5BanBnXkFtZTcwMzQzOTUyNw@@._V1_.jpg',
                            crewImageURL:
                                'https://pbs.twimg.com/profile_images/1029105661030805504/nVJZpIHI_400x400.jpg',
                            crewImageURL1:
                                'https://media.gq.com/photos/637692e3c8b11c4c41b61ab5/master/w_1884,h_2785,c_limit/GQ1222_Cameron_02.jpg',
                            crewImageURL2:
                                'https://image.tmdb.org/t/p/w500/lUvCkzSLCJe7HcQGSIO4wLHuRF.jpg',
                            textRatingVotesOnImages: TextRatingVotesOnImages(
                              imageURL:
                                  'https://www.abystyle.com/3679429-large_default/demon-slayer-poster-entertainment-district-915x61cm.jpg',
                              movieName: 'Demon Slayer',
                              rating: 9.8,
                              votes: 34324,
                              positionFillTop1: 140,
                            ),
                            textRatingVotesOnImages1: TextRatingVotesOnImages(
                              imageURL:
                                  'https://thecomicbookstore.in/wp-content/uploads/2022/09/TCBS2491.jpg',
                              movieName: 'Attack On Titan',
                              rating: 9.8,
                              votes: 34324,
                              positionFillTop1: 140,
                            ),
                            textRatingVotesOnImages2: TextRatingVotesOnImages(
                              imageURL:
                                  'https://ih1.redbubble.net/image.3304365345.6778/poster,504x498,f8f8f8-pad,600x600,f8f8f8.jpg',
                              movieName: 'One Piece',
                              rating: 9.8,
                              votes: 34324,
                              positionFillTop1: 140,
                            ),
                            textRatingVotesOnImages3: TextRatingVotesOnImages(
                                imageURL:
                                    'https://m.media-amazon.com/images/I/71xz7wU39xL._AC_UF894,1000_QL80_.jpg',
                                movieName: 'Bleach',
                                rating: 9.8,
                                votes: 34324,
                                positionFillTop1: 140),
                            textRatingVotesOnImages4: TextRatingVotesOnImages(
                              imageURL:
                                  'https://pbs.twimg.com/media/FNLNGSSXEAE7-5_.jpg',
                              movieName: 'Spy Family',
                              rating: 9.8,
                              votes: 34324,
                              positionFillTop1: 140,
                            ), productionCompanyName2: '',
                        productionCompanyImageURL2: '', genres: '',runTime: 2,
                          )));
                },
                child: TextRatingVotesOnImages(
                  imageURL: movieVo?[0].posterPath ?? '',
                  movieName: movieVo?[0].title ?? '',
                  rating: movieVo?[0].voteAverage ?? 0.0,
                  votes: movieVo?[0].voteCount ?? 0,
                  positionFillTop1: 110,
                )),
            TextRatingVotesOnImages(
              imageURL: movieVo?[1].posterPath ?? '',
              movieName: movieVo?[1].title ?? '',
              rating: movieVo?[1].voteAverage ?? 0.0,
              votes: movieVo?[1].voteCount ?? 0,
              positionFillTop1: 110,
            ),
            TextRatingVotesOnImages(
              imageURL: movieVo?[2].posterPath ?? '',
              movieName: movieVo?[2].title ?? '',
              rating: movieVo?[2].voteAverage ?? 0.0,
              votes: movieVo?[2].voteCount ?? 0,
              positionFillTop1: 110,
            ),
            TextRatingVotesOnImages(
              imageURL: movieVo?[3].posterPath ?? '',
              movieName: movieVo?[3].title ?? '',
              rating: movieVo?[3].voteAverage ?? 0.0,
              votes: movieVo?[3].voteCount ?? 0,
              positionFillTop1: 110,
            ),
            TextRatingVotesOnImages(
              imageURL: movieVo?[4].posterPath ?? '',
              movieName: movieVo?[4].title ?? '',
              rating: movieVo?[4].voteAverage ?? 0.0,
              votes: movieVo?[4].voteCount ?? 0,
              positionFillTop1: 110,
            ),
            TextRatingVotesOnImages(
              imageURL: movieVo?[5].posterPath ?? '',
              movieName: movieVo?[5].title ?? '',
              rating: movieVo?[5].voteAverage ?? 0.0,
              votes: movieVo?[5].voteCount ?? 0,
              positionFillTop1: 110,
            ),
            TextRatingVotesOnImages(
              imageURL: movieVo?[6].posterPath ?? '',
              movieName: movieVo?[6].title ?? '',
              rating: movieVo?[6].voteAverage ?? 0.0,
              votes: movieVo?[6].voteCount ?? 0,
              positionFillTop1: 110,
            ),
            TextRatingVotesOnImages(
              imageURL: movieVo?[7].posterPath ?? '',
              movieName: movieVo?[7].title ?? '',
              rating: movieVo?[7].voteAverage ?? 0.0,
              votes: movieVo?[7].voteCount ?? 0,
              positionFillTop1: 110,
            ),
            TextRatingVotesOnImages(
              imageURL: movieVo?[8].posterPath ?? '',
              movieName: movieVo?[8].title ?? '',
              rating: movieVo?[8].voteAverage ?? 0.0,
              votes: movieVo?[8].voteCount ?? 0,
              positionFillTop1: 110,
            ),
            TextRatingVotesOnImages(
              imageURL: movieVo?[9].posterPath ?? '',
              movieName: movieVo?[9].title ?? '',
              rating: movieVo?[9].voteAverage ?? 0.0,
              votes: movieVo?[9].voteCount ?? 0,
              positionFillTop1: 110,
            ),
          ],
        ),
      ),
    );
  }
}

class TopRatedMovieViewItem extends StatelessWidget {
  const TopRatedMovieViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieVO>?>(
        future: _movieModel.getTopRatedMovieList(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapShot.hasError) {
            return const Center(
              child: Text("Error Fetching"),
            );
          }
          final listTopRatedMovie = snapShot.data;
          return YouMayLikeMovieViewItem(
            topRated: listTopRatedMovie,
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
              );
            },
          ),
        ),
      ],
    );
  }
}

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PopularMovieResultsVO>?>(
        future: _movieModel.getPopularMovieList(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapShot.hasError) {
            return const Center(
              child: Text("Error Fetching"),
            );
          }
          final listPopularMovie = snapShot.data;
          return PopularMovieViewItem(
            popularMovieVO: listPopularMovie,
          );
        });
  }
}

class PopularMovieViewItem extends StatelessWidget {
  const PopularMovieViewItem({Key? key, required this.popularMovieVO})
      : super(key: key);
  final List<PopularMovieResultsVO>? popularMovieVO;

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
              );
            },
          ),
        ),
      ],
    );
  }
}

/*
class ActorsViewItem extends StatelessWidget {
  const ActorsViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kSP20x),
      child: Container(
        width: kActorsSizeWidth,
        height: kActorsSizeHeight,
        color: kBlackColor,
        child: const Actor(),
      ),
    );
  }
}
*/
