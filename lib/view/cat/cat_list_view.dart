import 'package:flutter/material.dart';
import 'package:flutter_sample/data/model/cat.dart';
import 'package:flutter_sample/view/cat/cat_list_item.dart';

class CatListView extends StatelessWidget {
  final ScrollController? scrollController;
  final List<Cat> cats;
  final ValueChanged<Cat> onTap;

  const CatListView({
    super.key,
    required this.cats,
    required this.onTap,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
        controller: scrollController,
        itemCount: cats.length,
        itemBuilder: (_, index) => CatListItem(
          cat: cats[index],
          onTap: onTap,
        ),
      );
}
