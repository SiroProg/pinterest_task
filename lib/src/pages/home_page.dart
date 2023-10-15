import 'package:flutter/material.dart';
import 'package:learn_flutter/src/pages/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  late final HomeController controller;
  bool featuresSelected = true;
  bool animalsSelected = false;
  bool jellyfishSelected = false;
  double widthOfSearch = 70;
  List<String> resultList = HomeController().imageFeatures;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                TabBar(
                  indicatorColor: Colors.orange,
                  labelColor: Colors.orange,
                  controller: tabController,
                  tabs: const [
                    Tab(text: 'Animals'),
                    Tab(text: 'Feature'),
                    Tab(text: 'Jellyfish'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      PageViewItem(images: controller.imageAnimals),
                      PageViewItem(images: controller.imageFeatures),
                      PageViewItem(images: controller.imageJellyfish),
                    ],
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 55, left: 10),
            //   child: SizedBox(
            //     width: widthOfSearch,
            //     height: 50,
            //     child: DecoratedBox(
            //       decoration: const BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(10),
            //         ),
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           TextButton(
            //             onPressed: () {
            //               setState(() {
            //                 widthOfSearch = 250;
            //                 featuresSelected = false;
            //                 animalsSelected = false;
            //                 jellyfishSelected = false;
            //               });
            //             },
            //             child: const Text(
            //               "🔍",
            //               style: TextStyle(fontSize: 20),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class PageViewItem extends StatelessWidget {
  final List<String> images;

  const PageViewItem({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: List.generate(
        images.length,
        (index) => SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image(
            fit: BoxFit.fill,
            image: NetworkImage(
              images[index],
            ),
          ),
        ),
      ),
    );
  }
}
