import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> menus = [
    {'title': 'Sales', 'image': 'assets/icons/sales.png'},
    {'title': 'Inventory', 'image': 'assets/icons/inventory.png'},
    {'title': 'Reports', 'image': 'assets/icons/reports.png'},
    {'title': 'Customers', 'image': 'assets/icons/customers.png'},
    {'title': 'Settings', 'image': 'assets/icons/settings.png'},
    {'title': 'Support', 'image': 'assets/icons/support.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        // title: Row(
        //   children: [
        //     ClipRRect(
        //       borderRadius: BorderRadius.circular(8),
        //       child: Image.asset('assets/app_icon.png', width: 36, height: 36),
        //     ),
        //     SizedBox(width: 12),
        //     Text(
        //       'POS Pro',
        //       style: TextStyle(
        //         fontWeight: FontWeight.bold,
        //         fontSize: 22,
        //         color: Colors.black87,
        //       ),
        //     ),
        //   ],
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),

      // body: Stack(
      //   children: [
      //     // Background gradient
      //     Container(
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //           colors: [
      //             Colors.blue.shade100.withOpacity(0.7),
      //             Colors.purple.shade100.withOpacity(0.7),
      //           ],
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight,
      //         ),
      //       ),
      //     ),
      //     // Glassmorphism content
      //     SafeArea(
      //       child: Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             // Latest News Card
      //             GlassmorphicCard(
      //               child: ListTile(
      //                 leading: Icon(
      //                   Icons.new_releases,
      //                   color: Colors.deepPurple,
      //                 ),
      //                 title: Text(
      //                   'Latest News',
      //                   style: TextStyle(fontWeight: FontWeight.bold),
      //                 ),
      //                 subtitle: Text(
      //                   'New inventory features released! Check them out now.',
      //                   maxLines: 2,
      //                   overflow: TextOverflow.ellipsis,
      //                 ),
      //               ),
      //             ),
      //             SizedBox(height: 24),
      //             Text(
      //               'Menu',
      //               style: TextStyle(
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.black87,
      //               ),
      //             ),
      //             SizedBox(height: 12),
      //             Expanded(
      //               child: GridView.builder(
      //                 itemCount: menus.length,
      //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2,
      //                   mainAxisSpacing: 18,
      //                   crossAxisSpacing: 18,
      //                   childAspectRatio: 1.1,
      //                 ),
      //                 itemBuilder: (context, index) {
      //                   final menu = menus[index];
      //                   return GlassmorphicCard(
      //                     child: InkWell(
      //                       borderRadius: BorderRadius.circular(18),
      //                       onTap: () {},
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           Image.asset(
      //                             menu['image']!,
      //                             width: 48,
      //                             height: 48,
      //                           ),
      //                           SizedBox(height: 12),
      //                           Text(
      //                             menu['title']!,
      //                             style: TextStyle(
      //                               fontWeight: FontWeight.w600,
      //                               fontSize: 16,
      //                               color: Colors.black87,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class GlassmorphicCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blur;
  final double opacity;

  const GlassmorphicCard({
    Key? key,
    required this.child,
    this.borderRadius = 18,
    this.blur = 18,
    this.opacity = 0.18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
