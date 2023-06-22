
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/search_page_bloc.dart';
import '../constant/colors.dart';
import '../view_item/search_page_view_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchPageBloc>(
      create: (context) => SearchPageBloc(),
      child: const Scaffold(
        backgroundColor: kBlackColor,
        body: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BackTextFieldButton(),
              Expanded(child: SearchMovieTextFieldAndSearchIcon()),
            ],
          ),
        ),
      ),
    );
  }
}

