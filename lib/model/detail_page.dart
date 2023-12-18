import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/constants.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
              image: AssetImage('assets/images/ux_big.png'),
              alignment: Alignment.topRight),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/icons/arrow-left.svg'),
                      SvgPicture.asset('assets/icons/more-vertical.svg')
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      padding: const EdgeInsets.only(
                          bottom: 5, left: 5, right: 20, top: 5),
                      color: kBestSellerColor,
                      child: Text(
                        'BestSeller'.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Design Thinking',
                    style: kHeadingextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/person.svg'),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('18K'),
                      const SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset('assets/icons/star.svg'),
                      const Text('4.8')
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '\$50',
                        style: kHeadingextStyle.copyWith(fontSize: 32)),
                    TextSpan(
                        text: '\$70',
                        style: TextStyle(
                            color: kTextColor.withOpacity(.5),
                            decoration: TextDecoration.lineThrough))
                  ])),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                child: Stack(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(20),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Course Content',
                            style: kTitleTextStyle,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CourseContent(
                            number: '01',
                            time: 7.32,
                            title: 'Welcome to the course',
                            isDone: true,
                          ),
                          CourseContent(
                            number: '02',
                            time: 17.26,
                            title: 'Photoshop downland',
                            isDone: true,
                          ),
                          CourseContent(
                            number: '03',
                            time: 23.32,
                            title: 'Communacation with cilent',
                            isDone: false,
                          ),
                          CourseContent(
                            number: '04',
                            time: 19.02,
                            title: 'Illusturator',
                            isDone: false,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 35,
                                  color: kTextColor.withOpacity(.1))
                            ]),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 56,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFFFFEDEE),
                              ),
                              child: SvgPicture.asset(
                                  'assets/icons/shopping-bag.svg'),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Container(
                                height: 56,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: kBlueColor),
                                child: Text(
                                  'Buy Now',
                                  style: kTitleTextStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String title;
  final double time;
  final bool isDone;
  final String number;

  const CourseContent({
    super.key,
    required this.title,
    required this.time,
    this.isDone = false,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text(
            number,
            style: kHeadingextStyle.copyWith(
                fontSize: 32, color: kTextColor.withOpacity(.3)),
          ),
          const SizedBox(
            width: 10,
          ),
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                  text: '$time min\n',
                  style: TextStyle(
                      fontSize: 18, color: kTextColor.withOpacity(.5))),
              TextSpan(
                  text: title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: kTextColor)),
            ],
          )),
          const Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(isDone ? 1 : 0.5)),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
