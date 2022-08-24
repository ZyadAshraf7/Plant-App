import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/app/core/constants/style_manager.dart';
import 'package:plant_app/app/data/models/product.dart';
import 'package:plant_app/app/presentation/screens/search_screen/widgets/searched_card_item.dart';

import '../../../buisness_logic/cubits/fetch_products_cubit/fetch_products_cubit.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/values_manager.dart';
import '../cart_screen/widgets/empty_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchedText = TextEditingController();
  FocusNode focusNode = FocusNode();
  late List<Product> products;
  late List<Product> searchedProducts = [];
  bool submitted = false;

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    searchedProducts = products
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    products = BlocProvider.of<FetchProductsCubit>(context).productsList;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchedText.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    searchedText.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 14).copyWith(top: 14),
            //padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 27),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(AppValues.s10),
            ),
            child: TextFormField(
              focusNode: focusNode,
              controller: searchedText,
              onFieldSubmitted: (c) {
                setState(() {
                  submitted = true;
                });
              },
              onChanged: (c) {
                addSearchedFOrItemsToSearchedList(c);
                setState(() {
                  submitted = false;
                });
              },
              autofocus: true,
              cursorColor: AppColors.darkGrey,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      searchedText.clear();
                    },
                    icon: searchedText.text.isNotEmpty
                        ? const Icon(
                            Icons.clear,
                            size: 20,
                            color: AppColors.darkGrey,
                          )
                        : const SizedBox()),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.darkGrey,
                ),
                hintText: "Search",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: (submitted &&
                    searchedProducts.isEmpty &&
                    searchedText.text.isNotEmpty)
                ? SingleChildScrollView(
                    child: EmptyBody(
                      title: "Not found",
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, i) {
                      return SearchedCardItem(
                        name: searchedProducts[i].name!,
                        description: searchedProducts[i].description!,
                        imageUrl: searchedProducts[i].imageUrl,
                        price: searchedProducts[i].price,
                      );
                    },
                    itemCount: searchedProducts.length,
                  ),
          ),
        ],
      ),
    );
  }
}
