import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/landing/models/blog.dart';
import 'package:shahabfit/Features/landing/utils/bloglist.dart';
import 'package:shahabfit/Features/landing/utils/padding.dart';
import 'package:shahabfit/utils/texttheme.dart';

class BlogScreen extends StatefulWidget {
  
  final int blogId;
  const BlogScreen({super.key, required this.blogId});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  late BlogPost blog;

  @override
  void initState() {
    super.initState();
    blog = blogList.firstWhere((element) => element.id == widget.blogId);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final customPadding = getPadding(screenWidth);
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        leadingWidth: screenWidth < 600 ? 80 : 150,
        backgroundColor: textColor,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getPadding(screenWidth)),
              child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => context.pop(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: background,
                    size: 30,
                  )),
            ),
          ],
        ),
        title: Text(
          blog.title,
          style: context.anjomanBold.copyWith(color: background, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(customPadding),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                blog.imagePath,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              blog.description,
              style: context.anjomanLight.copyWith(height: 2, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
