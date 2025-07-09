import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/landing/models/menuitem.dart';
import 'package:shahabfit/Features/landing/utils/bloglist.dart';
import 'package:shahabfit/Features/landing/utils/crossaxiscount.dart';
import 'package:shahabfit/Features/landing/utils/firstsectionheight.dart';
import 'package:shahabfit/Features/landing/utils/fontsize.dart';
import 'package:shahabfit/Features/landing/utils/imagesize.dart';
import 'package:shahabfit/Features/landing/utils/padding.dart';
import 'package:shahabfit/Features/landing/utils/strings.dart';
import 'package:shahabfit/Widgets/socialcard.dart';
import 'package:shahabfit/Widgets/titrbar.dart';
import 'package:shahabfit/utils/texttheme.dart';
import 'package:shahabfit/widgets/appbarcontent.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final List<String> titles = [
    'صفحه اصلی',
    'مطالب آموزشی',
    'ارتباط با ما',
  ];

  final mainKey = GlobalKey();
  final amuzeshKey = GlobalKey();
  final contactKey = GlobalKey();
  late List<MenuItem> menuItems;
  void scrollToItem(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(key.currentContext!,
          alignment: 0.15, duration: const Duration(milliseconds: 200));
    }
  }

  @override
  void initState() {
    super.initState();
    menuItems = [
      MenuItem(title: 'صفحه اصلی', key: mainKey),
      MenuItem(title: 'مطالب آموزشی', key: amuzeshKey),
      MenuItem(title: 'ارتباط با ما', key: contactKey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final crossAxisCount = getCrossCount(screenWidth);
    final customPadding = getPadding(screenWidth);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: background,
      appBar: CustomAppbar(scrollToItem: scrollToItem, menuItems: menuItems),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              key: mainKey,
              height: getFirstSectionHeight(screenHeight, screenWidth),
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/background.png'),
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Image.asset('images/place.png',
                  fit: BoxFit.cover, width: getImageSize(screenWidth)),
            ),
            const SizedBox(height: 50),
            Padding(
              key: amuzeshKey,
              padding: EdgeInsets.symmetric(horizontal: customPadding),
              child: TitrBar(screenWidth: screenWidth, title: 'مطالب آموزشی'),
            ),
            const SizedBox(height: 40),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: customPadding),
              shrinkWrap: true,
              itemCount: blogList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisExtent: 340,
                  mainAxisSpacing: customPadding,
                  crossAxisSpacing: customPadding),
              itemBuilder: (context, index) => InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => context.push('$blogPage/${blogList[index].id}',
                    extra: blogList[index]),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          blogList[index].imagePath,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(height: 1.8),
                        children: <TextSpan>[
                          TextSpan(
                              text: '${blogList[index].title}\n',
                              style: context.anjomanBold
                                  .copyWith(fontSize: 16, color: textColor)),
                          TextSpan(
                              text: blogList[index].description,
                              style: context.anjomanExtraLight
                                  .copyWith(fontSize: 14, color: textColor)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              key: contactKey,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background2.png'),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.fromLTRB(
                  customPadding, 0, customPadding, customPadding),
              child: Column(
                children: [
                  TitrBar(screenWidth: screenWidth, title: 'ارتباط با ما'),
                  const SizedBox(height: 40),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 40),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white30),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.05),
                        ),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              'با دایناپ در تماس باشید',
                              textAlign: TextAlign.center,
                              style: context.anjomanBlack.copyWith(
                                  color: primary,
                                  fontSize: getFontSize(screenWidth)),
                            ),
                            const SizedBox(height: 25),
                            Text(
                                'شما هر سوالی داشته باشید میتونید تو پیام رسان های زیر ازم بپرسید و اون چیزی که برای بدنتون مفید تره رو انجام بدید',
                                textAlign: TextAlign.center,
                                style: context.anjomanLight.copyWith(
                                    color: textColor,
                                    fontSize: getFontSize(screenWidth) - 2)),
                            const SizedBox(height: 25),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: customPadding,
                              runSpacing: customPadding,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                SocialCard(
                                    url: sURLInstagram,
                                    imagePath: 'images/instagram.png',
                                    title: 'Instagram'),
                                SocialCard(
                                    url: sURLTelegram,
                                    imagePath: 'images/telegram.png',
                                    title: 'Telegram'),
                                HtmlWidget(
                                    '''<a referrerpolicy='origin' target='_blank' href='https://trustseal.enamad.ir/?id=3847591&Code=EcOLBczeyqy7Gei4P1TNCjHGRDwrVMJh'  style="display: inline-block; padding: 8px; background: white; border: 2px solid #ddd; border-radius: 6px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);"'>
<img referrerpolicy='origin' src='https://trustseal.enamad.ir/logo.aspx?id=3847591&Code=EcOLBczeyqy7Gei4P1TNCjHGRDwrVMJh'  alt='نماد اعتماد'  code='EcOLBczeyqy7Gei4P1TNCjHGRDwrVMJh   style='cursor:pointer; display: block; width: 120px; height: auto;'>
</a>'''),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
