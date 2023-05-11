import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/dimens.dart';
import 'package:movie_app/widgets/actors_widget.dart';
import 'package:movie_app/widgets/easy_text.dart';

import '../constant/colors.dart';
import '../constant/strings.dart';
import '../widgets/about_movie_and_recommed_movies.dart';
import '../widgets/movie_genre.dart';
import '../widgets/text_rating_votes_on_image.dart';

class SearchMovieBarAndSearchIconViewItem extends StatelessWidget {
  const SearchMovieBarAndSearchIconViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP20x),
      child: Row(
        children: [
          Container(
            width: kSearchMovieSizeWidth,
            height: kSearchMovieSizeHeight,
            decoration: BoxDecoration(
              color: kGreyColor,
              borderRadius: BorderRadius.circular(kSP20x),
            ),
            child: const Padding(padding: EdgeInsets.all(kSP10x),
                child: EasyText(text: kSearchMoviesText,color: kWhiteColor,fontSize: kFontSize16x,),
          ),
          ),
             const SizedBox(
              width: kSP25x,
            ),
          Container(
            width: kSearchIconSizeWidthHeight,
            height: kSearchIconSizeWidthHeight,
            decoration: BoxDecoration(
              color: KPinkAccentColor,
              borderRadius: BorderRadius.circular(kSP10x),
            ),
            child: const Icon(
              Icons.search,color:kWhiteColor,size: 25,
            ),
          )
        ],
      ),
    );
  }
}

class MovieGenreScrollViewItem extends StatelessWidget {
  const MovieGenreScrollViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kMovieGenreSearchWidth,
      height: kMovieGenreSearchHeight,
      child: ListView(
        scrollDirection: Axis.horizontal,
           children: const  [
             MovieGenre(text: kAdventureText,),
             MovieGenre(text: kAnimationText,),
             MovieGenre(text: kHorrorText,),
             MovieGenre(text: kComdemyText,),
             MovieGenre(text: kActionText,),
             MovieGenre(text: kDramaText,),
             MovieGenre(text: kScientificText,),
             MovieGenre(text: kSchoolText,),
           ],
      ),

      );

  }
}

class FirstScrollImgaeWithPlayButtomViewItem extends StatelessWidget {
  const FirstScrollImgaeWithPlayButtomViewItem({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
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
    // onPageChanged: ,
    scrollDirection: Axis.horizontal,
    ),
    items: [1, 2, 3, 4, 5].map((i) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: kSP5x),
          //decoration: const BoxDecoration(color: Colors.amber),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl:
              "https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
              fit: BoxFit.cover,

              placeholder: (context, url) => Center(child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('images/tmdb_place_holder.png'))),
              errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: kSP20x,
            backgroundColor: KPinkAccentColor,
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
                end:  Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ],
    );
    }).toList(),
    );
  }
}

class SmallestMoviesScrollViewItem extends StatelessWidget {
  const SmallestMoviesScrollViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kSP20x),
      child: SizedBox(
        width: kSmallestMoviesScrollSizeWidth,
        height: kSmallestMoviesScrollSizeHeight,

        child: ListView(
          scrollDirection: Axis.horizontal,
          children:   [
          GestureDetector(
            onTap: (){
             Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) =>   const AboutMovieAndRecommedMovie(
               storyLine: "On the lush alien world of Pandora live the Na'vi, beings who appear primitive but are highly evolved. Because the planet's environment is poisonous, human/Na'vi hybrids, called Avatars, must link to human minds to allow for free movement on Pandora. Jake Sully (Sam Worthington), a paralyzed former Marine, becomes mobile again through one such Avatar and falls in love with a Na'vi woman (Zoe Saldana). As a bond with her grows, he is drawn into a battle for the survival of her world.",
               movieName: 'Avator :The Way Of Water',
               productionCompanyName: '20th Century Studios',
               productionCompanyName1: 'TSG Entertainment',
               productionComapnyImgeURL: 'https://media.sketchfab.com/models/1d21693ae946418a807c8b9fcd6aa4e1/thumbnails/352dd88f2daa4fb8810a01d0858fb8b0/be2b9214fcea42a0a4729bdd44f1eaa8.jpeg',
               productionComapnyImgeURL1: 'https://i.ytimg.com/vi/9kNJYLgYKKU/maxresdefault.jpg',
               movieImageURL: 'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_.jpg',
               actorName: "Sam Worthington",
               actorName1: 'Zoe Saldana',
               actorName2: 'Stephen Lang',
               crewName: 'Jon Landau',
               crewName1: 'James Cameron',
               crewName2: 'Russell Carpenter',
               actorImgeURL: 'https://m.media-amazon.com/images/M/MV5BZWUwNmEwZTUtYzMxMS00ODg5LTlmYjItMGU4ZjNmN2Q1NjkwXkEyXkFqcGdeQXVyMTM1MjAxMDc3._V1_.jpg',
               actorImgeURL1: 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/12/03/17/Zoe-Saldana-Getty.jpg',
               actorImgeURL2: 'https://m.media-amazon.com/images/M/MV5BMjE4NzYwNTc5Nl5BMl5BanBnXkFtZTcwMzQzOTUyNw@@._V1_.jpg',
               crewImgeURL: 'https://pbs.twimg.com/profile_images/1029105661030805504/nVJZpIHI_400x400.jpg',
               crewImgeURL1: 'https://media.gq.com/photos/637692e3c8b11c4c41b61ab5/master/w_1884,h_2785,c_limit/GQ1222_Cameron_02.jpg',
               crewImgeURL2: 'https://image.tmdb.org/t/p/w500/lUvCkzSLCJe7HcQGSIO4wLHuRF.jpg',

               textratingvoteonimgaes: TextRatingVotesOnImages(imageURL: 'https://www.abystyle.com/3679429-large_default/demon-slayer-poster-entertainment-district-915x61cm.jpg', movieName: 'Demon Slayer', rating: '9.8', votes: '4390 votes', positionFillTop1: 140,),
               textratingvoteonimgaes1: TextRatingVotesOnImages(imageURL: 'https://thecomicbookstore.in/wp-content/uploads/2022/09/TCBS2491.jpg', movieName: 'Attack On Titan', rating: '6.8', votes: '3290 votes',  positionFillTop1: 140,),
               textratingvoteonimgaes2: TextRatingVotesOnImages(imageURL: 'https://ih1.redbubble.net/image.3304365345.6778/poster,504x498,f8f8f8-pad,600x600,f8f8f8.jpg', movieName: 'One Piece', rating: '8.5', votes: '41280 votes',  positionFillTop1: 140,),
               textratingvoteonimgaes3: TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/I/71xz7wU39xL._AC_UF894,1000_QL80_.jpg',movieName: 'Bleach', rating: '7.8', votes: '7390 votes',  positionFillTop1: 140),
               textratingvoteonimgaes4: TextRatingVotesOnImages(imageURL: 'https://pbs.twimg.com/media/FNLNGSSXEAE7-5_.jpg', movieName: 'Spy Family', rating: '9.5', votes: '68390 votes',  positionFillTop1: 140,),)));
        },
              child: const TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_.jpg', movieName: 'Aavatar', rating: '7.8', votes: '4390 votes', positionFillTop1: 110,)),
            const TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/M/MV5BNTFkZjdjN2QtOGE5MS00ZTgzLTgxZjAtYzkyZWQ5MjEzYmZjXkEyXkFqcGdeQXVyMTM0NTUzNDIy._V1_FMjpg_UX1000_.jpg', movieName: 'Venom', rating: '6.8', votes: '3290 votes',positionFillTop1: 110, ),
            const TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/I/A1HBBNzBdxL.jpg', movieName: 'Thor Ragnarok', rating: '8.5', votes: '4790 vots',positionFillTop1: 110,),
            const TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/M/MV5BNGMzYWZlYmYtNTcyMC00ZGVjLThjN2ItMjY4MjkwN2NlMjYwXkEyXkFqcGdeQXVyOTU0NjY1MDM@._V1_FMjpg_UX1000_.jpg',movieName: 'Ghosted', rating: '9.8', votes: '7390 vots',positionFillTop1: 110, ),
            const TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/I/A1plvS91qAL.jpg', movieName: 'Game Of Thrones', rating: '9.5', votes: '8390 votes', positionFillTop1: 110, ),
            const TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/I/91miBpFYN5L.jpg', movieName: 'Stranger Things', rating: '7.8', votes: '6390 votes',positionFillTop1: 110,),

          ],
        ),
      ),
    );
  }
}

class YouMayLikeMovieViewItem extends StatelessWidget {
  const YouMayLikeMovieViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(left: kSP20x),
          child: Align(alignment: Alignment.topLeft,
              child: EasyText(text: kYouMaylikeText,color: Colors.white,fontWeight: FontWeight.w600,)
          ),
        ),
         SizedBox(
          width: kYouMayLikeMovieSizeWidth,
          height: kYouMayLikeMovieSizeHeight,

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
    );
  }
}

class PopularMovieViewItem extends StatelessWidget {
  const PopularMovieViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(left: kSP20x),
            child: Align(alignment: Alignment.topLeft,
                child: EasyText(text: kPopularText,color: kWhiteColor,fontWeight: FontWeight.w600,)
            ),
        ),

         SizedBox(
          width: kPopularMovieSizeWidth,
          height: kPopularMovieSizeHeight,

          child: ListView(
            scrollDirection: Axis.horizontal,
            children:  const [
              TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_.jpg', movieName: 'Aavatar', rating: '7.8', votes: '4390 votes', positionFillTop1: 100, ),
              TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/M/MV5BNTFkZjdjN2QtOGE5MS00ZTgzLTgxZjAtYzkyZWQ5MjEzYmZjXkEyXkFqcGdeQXVyMTM0NTUzNDIy._V1_FMjpg_UX1000_.jpg', movieName: 'Venom', rating: '6.8', votes: '3290 votes', positionFillTop1: 100,),
              TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/I/A1HBBNzBdxL.jpg', movieName: 'Thor Ragnarok', rating: '8.5', votes: '4790', positionFillTop1: 100,),
              TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/M/MV5BNGMzYWZlYmYtNTcyMC00ZGVjLThjN2ItMjY4MjkwN2NlMjYwXkEyXkFqcGdeQXVyOTU0NjY1MDM@._V1_FMjpg_UX1000_.jpg',movieName: 'Ghosted', rating: '9.8', votes: '7390 votes', positionFillTop1: 100,),
              TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/I/A1plvS91qAL.jpg', movieName: 'Game Of Thrones', rating: '9.5', votes: '8390 votes', positionFillTop1: 100),
              TextRatingVotesOnImages(imageURL: 'https://m.media-amazon.com/images/I/91miBpFYN5L.jpg', movieName: 'Stranger Things', rating: '7.8', votes: '6390 votes', positionFillTop1: 100),

            ],
          ),
        ),
      ],
    );
  }
}

class ActorsViewItem extends StatelessWidget {
  const ActorsViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: kSP20x),
      child: Container(
        width: kActorsSizeWidth,
        height: kActorsSizeHeight,
        color: kBlackColor,
        child: const Actors(),
      ),
    );
  }
}

