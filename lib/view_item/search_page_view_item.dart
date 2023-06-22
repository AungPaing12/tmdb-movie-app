import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/search_page_bloc.dart';
import '../constant/api_constant.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/vos/movie_vo/result_vo.dart';
import '../page/movie_detail_view_item.dart';
import '../widgets/easy_text.dart';

class BackTextFieldButton extends StatelessWidget {
  const BackTextFieldButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSP20x),
      child: Align(
        alignment: Alignment.topLeft,
        child: TextButton.icon(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kPinkAccentColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            label: const EasyText(
                text: 'Back', color: kPinkAccentColor, fontSize: kFontSize16x)),
      ),
    );
  }
}

class SearchMovieTextFieldAndSearchIcon extends StatelessWidget {
  const SearchMovieTextFieldAndSearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc, List<MovieVO>?>(
      selector: (_, bloc) => bloc.getSearchMovieList,
      builder: (_, searchMovieList, __) {
        return Padding(
          padding: const EdgeInsets.only(top: kSP20x),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: kSP20x, right: kSP20x),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (text) {
                          final instance = context.read<SearchPageBloc>();
                          instance.searchMovieName(text);
                        },
                        decoration: const InputDecoration(
                            hintText: kSearchMoviesText,
                            hintStyle: TextStyle(color: kGreyColor),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(kSP20x))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(kSP20x)),
                            ),
                            fillColor: kBlack45Color,
                            filled: true),
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
              const SizedBox(
                height: kSP10x,
              ),
              SearchMovieListTileViewItem(
                searchMovieList: searchMovieList,
              )
            ],
          ),
        );
      },
    );
  }
}

class SearchMovieListTileViewItem extends StatelessWidget {
  const SearchMovieListTileViewItem({Key? key, required this.searchMovieList})
      : super(key: key);
  final List<MovieVO>? searchMovieList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchMovieList?.length,
        itemBuilder: (context, index) {
          return SearchMovieListTileWidget(
            imageURL: searchMovieList?[index].posterPath ?? '',
            movieTitle: searchMovieList?[index].title ?? '',
            overview: searchMovieList?[index].overview ?? '',
            releaseDate:searchMovieList?[index].getReleaseData() ?? '0000',
            movieID: searchMovieList?[index].id ?? 0,
          );
        },
      ),
    );
  }
}

class SearchMovieListTileWidget extends StatelessWidget {
  const SearchMovieListTileWidget(
      {Key? key,
        required this.imageURL,
        required this.movieTitle,
        required this.overview,
        required this.releaseDate,
        required this.movieID})
      : super(key: key);
  final String imageURL;
  final String movieTitle;
  final String overview;
  final String releaseDate;
  final int movieID;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBlack45Color,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 0, right: kSP10x),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieDetailViewItem(
                movieID: movieID,
              )));
        },
        leading: CachedNetworkImage(
          imageUrl: kPrefixEndPoint + imageURL,
          fit: BoxFit.fill,
          width: kSP55x,
          height: kSP55x,
          placeholder: (context, url) =>
              Image.asset('images/tmdb_place_holder.png'),
          errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
        ),
        title: Column(
          children: [
            Text(
              movieTitle,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: kWhiteColor, fontSize: kFontSize14x),
            ),
            Text(
              overview,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: kWhiteColor, fontSize: kFontSize14x),
            ),
          ],
        ),
        trailing: Container(
          width: kSP60x,
          height: kSP40x,
          color: kPinkAccentColor,
          child: Center(child: EasyText(text: releaseDate)),
        ),
      ),
    );
  }
}
