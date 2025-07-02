import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/style/app_color.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:point_of_sale/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:point_of_sale/src/features/home/presentation/bloc/home_event.dart';
import 'package:point_of_sale/src/features/home/presentation/bloc/home_state.dart';
import 'package:point_of_sale/src/shared/widgets/loader_widget.dart';

class HomePage extends StatefulWidget {
  final LoginResponseEntity login;

  const HomePage({super.key, required this.login});

  @override
  State<HomePage> createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePage> {
  late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();
    _bloc.add(LoadHomeMenus(widget.login));
  }

  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeMenusLoading) {
          return Center(child: getIt<LoaderWidget>());
        } else if (state is HomeMenusLoaded) {
          final menus = state.homeMenus;

          return Stack(
            children: [
              // Background gradient
              Container(
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [
                //       Colors.blue.shade100.withOpacity(0.7),
                //       Colors.purple.shade100.withOpacity(0.7),
                //     ],
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //   ),
                // ),
              ),
              // Glassmorphism content
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Latest News Card
                      // GlassContainer.frostedGlass(
                      //   child: ListTile(
                      //     leading: Icon(
                      //       Icons.new_releases,
                      //       color: Colors.deepPurple,
                      //     ),
                      //     title: Text(
                      //       'Latest News',
                      //       style: TextStyle(fontWeight: FontWeight.bold),
                      //     ),
                      //     subtitle: Text(
                      //       'New inventory features released! Check them out now.',
                      //       maxLines: 2,
                      //       overflow: TextOverflow.ellipsis,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 24),
                      Text(
                        'Menu',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 12),
                      Expanded(
                        child: GridView.builder(
                          itemCount: menus.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 18,
                                crossAxisSpacing: 18,
                                childAspectRatio: 1.1,
                              ),
                          itemBuilder: (context, index) {
                            final menu = menus[index];
                            return Card(
                              color: isDark
                                  ? AppColor.solidDarkColors[index %
                                        AppColor.solidDarkColors.length]
                                  : AppColor.solidLightColors[index %
                                        AppColor.solidLightColors.length],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(18),
                                onTap: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.memory(
                                      base64Decode(menu.iconsImage!),
                                      width: 48,
                                      height: 48,
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      menu.aumMenuDesc!,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

/* 
Scaffold(
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

      // body:
    
    )
*/
