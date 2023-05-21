// import 'package:flutter/material.dart';
// import 'package:movie_app/data/model/movie_model/movie_model.dart';
// import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
// import 'package:movie_app/network/response/movie_details_response/movie_details_response.dart';
//
// import '../widgets/movie_details_widget.dart';
// MovieModel _movieModel = MovieModelImpl();
// class MovieDetailViewItem extends StatelessWidget {
//   const MovieDetailViewItem({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  FutureBuilder <MovieDetailsResponse?> (
//         future: _movieModel.getMovieDetails(1020896),
//         builder: (context, snapShot) {
//           if (snapShot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (snapShot.hasError) {
//             return const Center(
//               child: Text("Error Fetching"),
//             );
//           }
//           final movieDetail = snapShot.data;
//           return MovieDetail(movieDetailsResponse: movieDetail,);
//         });
//   }
// }
//
// class MovieDetail extends StatelessWidget {
//   const MovieDetail({Key? key, required this.movieDetailsResponse}) : super(key: key);
//     final MovieDetailsResponse? movieDetailsResponse;
//   @override
//   Widget build(BuildContext context) {
//     return AboutMovieAndRecommendMovie(movieName:movieDetailsResponse?.title ?? '' ,genres: movieDetailsResponse?.genres?[0].name ?? '',
//       runTime: movieDetailsResponse?.runtime ?? 1,movieImageURL: movieDetailsResponse?.posterPath ?? '',
//       actorName: '',actorName1: '',actorName2: '',actorImageURL: '',actorImageURL1: '',actorImageURL2: '',crewName: '',crewName1: '',crewName2:'' ,
//       crewImageURL: '',crewImageURL2: '',crewImageURL1: '',productionCompanyImageURL:'' ,productionCompanyImageURL1:'' ,
//       productionCompanyImageURL2: '',productionCompanyName1: '',productionCompanyName: '',productionCompanyName2: '', storyLine: '',
//       textRatingVotesOnImages1: , textRatingVotesOnImages2: ,textRatingVotesOnImages3: ,textRatingVotesOnImages4: ,textRatingVotesOnImages: ,
//     );
//   }
// }
//
