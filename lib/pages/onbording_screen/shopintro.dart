import 'package:flutter/material.dart';
import 'package:shopapp/components/navigate.dart';
import 'package:shopapp/pages/login_screen/shoplogin.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../services/local/cachehelper.dart';

class PageModel {
  String image;
  String screenbody;
  String screentitle;

  PageModel(
      {required this.image,
      required this.screenbody,
      required this.screentitle});
}

class ShopIntro extends StatefulWidget {
  const ShopIntro({super.key});

  @override
  State<ShopIntro> createState() => _ShopIntroState();
}

class _ShopIntroState extends State<ShopIntro> {
  List<PageModel> pages = [
    PageModel(
        image: 'assets/images/onbording.png',
        screenbody: 'Screen title 1',
        screentitle: 'Screen body 1'),
    PageModel(
        image: 'assets/images/onbording.png',
        screenbody: 'Screen title2',
        screentitle: 'Screen body2'),
    PageModel(
        image: 'assets/images/onbording.png',
        screenbody: 'Screen title3',
        screentitle: 'Screen body3'),
  ];

  var controller = PageController();

  bool islast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  CacheHelper.savedata(key: 'onbording', value: true);
                  navigateandfinish(context: context, widget: ShopLogIn());
                });
              },
              child: const Text('Skip')),
        ],
        title: Text('Shop App', style: Theme.of(context).textTheme.bodyText1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == pages.length - 1) {
                    islast = true;
                  } else {
                    islast = false;
                  }
                },
                controller: controller,
                physics: const BouncingScrollPhysics(),
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(pages[index].image),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(pages[index].screentitle),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(pages[index].screenbody),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: pages.length,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: Colors.deepOrange,
                        dotColor: Colors.black),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        CacheHelper.savedata(key: 'onbording', value: true);
                      });

                      if (islast == false) {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      } else {
                        navigateandfinish(
                            context: context, widget: ShopLogIn());
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios_outlined),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
