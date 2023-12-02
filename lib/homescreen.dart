// import 'package:flutter/material.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'editing_screen.dart';
// import './editing_screen.dart'; // Make sure to import your EditingScreen

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String sampleText = 'Sample Text';
//   TextStyle sampleTextStyle = TextStyle(color: Colors.white, fontSize: 28);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Celebrare'),
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.network(
//             'https://img.freepik.com/premium-psd/floral-rosy-golden-frame-design_53876-156711.jpg',
//             fit: BoxFit.cover,
//           ),
//           Center(
//             child: GestureDetector(
//               onTap: () async {
//                 final result = await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => EditingScreen(
//                       initialText: sampleText,
//                       initialTextStyle: sampleTextStyle,
//                     ),
//                   ),
//                 );
//                 if (result != null && result is EditingResult) {
//                   setState(() {
//                     sampleText = result.editedText;
//                     sampleTextStyle = result.editedTextStyle;
//                   });
//                 }
//               },
//               child: DottedBorder(
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     sampleText,
//                     style: sampleTextStyle,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
