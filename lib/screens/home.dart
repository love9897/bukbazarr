// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// import '../widgets/cardwd.dart';

// class home extends StatefulWidget {
//   const home({super.key});

//   @override
//   State<home> createState() => _homeState();
// }

// class _homeState extends State<home> {
//   double _value = 0.0;
//   final CarouselController _controller = CarouselController();

//   int _current = 0;
//   @override
//   Widget build(BuildContext context) {
//     final List<String> imgList = [
//       'image/img1.jpg',
//       'image/img2.jpg',
//       'image/img3.jpg',
//       'image/img4.jpg',
//       'image/img5.jpg'
//     ];
//     final List<Widget> imageSliders = imgList
//         .map((item) => Container(
//               child: Container(
//                 margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                     child: Stack(
//                       children: <Widget>[
//                         Image.asset(item, fit: BoxFit.cover, width: 2000.0),
//                         Positioned(
//                           bottom: 0.0,
//                           left: 0.0,
//                           right: 0.0,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Color.fromARGB(200, 0, 0, 0),
//                                   Color.fromARGB(0, 0, 0, 0)
//                                 ],
//                                 begin: Alignment.bottomCenter,
//                                 end: Alignment.topCenter,
//                               ),
//                             ),
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 10.0, horizontal: 20.0),
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//             ))
//         .toList();

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               child: CarouselSlider(
//                 items: imageSliders,
//                 carouselController: _controller,
//                 options: CarouselOptions(
//                   autoPlay: true,
//                   aspectRatio: 2.0,
//                   viewportFraction: 1.0,
//                   enlargeCenterPage: true,
//                   enlargeStrategy: CenterPageEnlargeStrategy.height,
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       _current = index;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: imgList.asMap().entries.map((entry) {
//                 return GestureDetector(
//                   onTap: () => _controller.animateToPage(entry.key),
//                   child: Container(
//                     width: 6.0,
//                     height: 12.0,
//                     margin:
//                         EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: (Theme.of(context).brightness == Brightness.dark
//                                 ? Colors.white
//                                 : Colors.black)
//                             .withOpacity(_current == entry.key ? 0.9 : 0.4)),
//                   ),
//                 );
//               }).toList(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: BookCard(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../widgets/cardwd.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  final List<String> imgList = [
    'image/img1.jpg',
    'image/img2.jpg',
    'image/img3.jpg',
    'image/img4.jpg',
    'image/img5.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList.map((item) {
      return Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(
                item,
                fit: BoxFit.cover,
                width: 2000.0,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 6.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BookCard(),
            ),
          ],
        ),
      ),
    );
  }
}
