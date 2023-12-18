import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course/constants.dart';
import 'package:online_course/model/category.dart';
import 'package:online_course/model/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Course',
        home: DetailPage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/icons/menu.svg'),
                Image.asset('assets/images/user.png')
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Hey Alex',
              style: kHeadingextStyle,
            ),
            const Text(
              'Find a course you want to learn',
              style: kSubHeadingextStyle,
            ),
            // SizedBox(height: ,)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey.shade200),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/search.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Search for anything',
                    style: TextStyle(
                        color: kTextColor.withOpacity(.4), fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Category',
                  style: kTitleTextStyle,
                ),
                Text(
                  'See All',
                  style: kTitleTextStyle.copyWith(color: kBlueColor),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Expanded(
                child: StaggeredGridView.countBuilder(
                    padding: const EdgeInsets.all(0),
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    itemCount: category.length,
                    crossAxisCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        height: index.isEven? 200:240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(category[index].image),
                            fit: BoxFit.fill,
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(category[index].name,style: kTitleTextStyle,),
                            Text('${category[index].number} Courses',)
                          ],
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1))),
          ],
        ),
      ),
    );
  }
}
