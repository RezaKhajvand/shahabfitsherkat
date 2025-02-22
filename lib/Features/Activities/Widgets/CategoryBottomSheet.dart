import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Activities/Models/CategoryModel.dart';

class CategoryBottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  const CategoryBottomSheet({
    super.key,
    required this.categoryLit,
    required this.scrollController,
  });

  final List<CatItem> categoryLit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('انتخاب عضله'),
        backgroundColor: background,
      ),
      body: GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: categoryLit.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        itemBuilder: (context, index) => InkWell(
          borderRadius: cardBorderRadius,
          onTap: () => context.pop(categoryLit[index].id),
          child: ClipRRect(
            borderRadius: cardBorderRadius,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: cardBorderRadius,
                border: Border.all(color: Colors.white12),
                color: Colors.white10,
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      categoryLit[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ClipOval(
                      child: Image.asset(
                    categoryLit[index].image,
                    fit: BoxFit.fill,
                    width: 50,
                    height: 50,
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
