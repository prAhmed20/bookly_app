import 'package:bookly/presentation_layer/business_logic/state/MovieState.dart';
import 'package:bookly/presentation_layer/screens/home_view/top_rated/top_rated_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/router.dart';
import '../../../core/utilities/color_constants.dart';
import '../../../core/utilities/text_styles.dart';
import '../../business_logic/cubit/book_cubit.dart';
import '../../widgets/books_list_view.dart';
import '../../widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kPrimaryColor,
      body: const HomeViewBody(),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeAppBar(),
        BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            if (state is GetBooksSuccessState) {
              return BooksListView(
                height: MediaQuery.of(context).size.height * .3,
                state: state,
              );
            }
            return const SizedBox();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TopRated',
                style: AppTextStyles.textStyle18,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.kSeeAllViewRoute);
                },
                child: Text(
                  'See All',
                  style:
                      AppTextStyles.textStyle18.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            var cubit = BookCubit.get(context);
            return Expanded(
              child: TopRatedListView(
                topRatedModel: cubit.topRatedModel,
              ),
            );
          },
        ),
      ],
    );
  }
}
