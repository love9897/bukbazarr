// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../provider/firebaseprovider.dart';

// class categorycard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final book = Provider.of<GetData>(context);
//     return GridView(
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 160,
//           crossAxisSpacing: 15.0,
//           mainAxisSpacing: 15.0,
//           mainAxisExtent: 150),

//       // crossAxisCount: 2, // Number of columns in the grid
//       // crossAxisSpacing: 16, // Spacing between columns
//       // mainAxisSpacing: 16, // Spacing between rows
//       padding: EdgeInsets.all(16),

//       children: [
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Text('data'),
//               ),
//             );
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white60,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'image/code.png',
//                   height: 98,
//                   width: double.infinity,
//                   fit: BoxFit.contain,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'code',
//                   style: Theme.of(context).textTheme.titleMedium!.merge(
//                         const TextStyle(
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white60,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'image/entertainment.png',
//                 height: 98,
//                 width: double.infinity,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Entertainment',
//                 style: Theme.of(context).textTheme.titleMedium!.merge(
//                       const TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white60,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'image/biography.png',
//                 height: 98,
//                 width: double.infinity,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Biography',
//                 style: Theme.of(context).textTheme.titleMedium!.merge(
//                       const TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white60,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'image/kids.png',
//                 height: 98,
//                 width: double.infinity,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Kids',
//                 style: Theme.of(context).textTheme.titleMedium!.merge(
//                       const TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white60,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'image/business.png',
//                 height: 98,
//                 width: double.infinity,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Business',
//                 style: Theme.of(context).textTheme.titleMedium!.merge(
//                       const TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white60,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'image/cook.png',
//                 height: 98,
//                 width: double.infinity,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'cook',
//                 style: Theme.of(context).textTheme.titleMedium!.merge(
//                       const TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white60,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'image/history.png',
//                 height: 98,
//                 width: double.infinity,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'History',
//                 style: Theme.of(context).textTheme.titleMedium!.merge(
//                       const TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:bukbazarr/widgets/categoryBooks.dart';
import 'package:flutter/material.dart';

class categorycard extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'code',
      'image': 'image/code.png',
    },
    {
      'name': 'Entertainment',
      'image': 'image/entertainment.png',
    },
    {
      'name': 'biography',
      'image': 'image/biography.png',
    },
    {
      'name': 'Kids',
      'image': 'image/kids.png',
    },
    {
      'name': 'Business',
      'image': 'image/business.png',
    },
    {
      'name': 'Cook',
      'image': 'image/cook.png',
    },
    {
      'name': 'History',
      'image': 'image/history.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          mainAxisExtent: 150,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle category selection here
              String selectedCategory = categories[index]['name'];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookGridPage(category: selectedCategory),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white60,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    categories[index]['image'],
                    height: 98,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    categories[index]['name'],
                    style: Theme.of(context).textTheme.titleMedium!.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
