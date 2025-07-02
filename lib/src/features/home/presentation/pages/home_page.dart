import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/style/app_color.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:point_of_sale/src/features/home/domain/entity/company_news_report_entity.dart';
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
  bool isGridView = true;
  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();
    _bloc.add(LoadHomeMenus(widget.login));
    _bloc.add(LoadCompanyNews(widget.login));
  }

  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading && state.menus.isEmpty && state.news.isEmpty) {
          return Center(child: getIt<LoaderWidget>());
        }

        if (state.error != null) {
          return Center(child: Text("Error: ${state.error}"));
        }

        return Column(
          children: [
            // Show news if available
            if (state.news.isNotEmpty) _buildNewsWidget(state.news),

            // Grid/List toggle button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Menu', style: Theme.of(context).textTheme.displaySmall),
                IconButton(
                  icon: Icon(
                    isGridView
                        ? Icons.view_list_rounded
                        : Icons.grid_view_rounded,
                  ),
                  onPressed: () {
                    setState(() {
                      isGridView = !isGridView;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Show menus
            Expanded(
              child: isGridView
                  ? GridView.builder(
                      itemCount: state.menus.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 18,
                            crossAxisSpacing: 18,
                            childAspectRatio: 1.1,
                          ),
                      itemBuilder: (context, index) =>
                          _buildMenuCard(index, state.menus),
                    )
                  : ListView.separated(
                      itemCount: state.menus.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) =>
                          _buildMenuCard(index, state.menus),
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNewsWidget(List<CompanyNewsReportEntity> news) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GlassContainer.clearGlass(
        color: isDark
            ? AppColor.lightBackground.withOpacity(0.1)
            : AppColor.accent.withOpacity(0.1),
        height: 80,
        borderRadius: BorderRadius.circular(30),
        width: double.infinity,
        child: ListTile(
          leading: const Icon(Icons.new_releases, color: Colors.deepPurple),
          title: const Text(
            'Latest News',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            news.first.message ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(int index, menus) {
    final menu = menus[index];
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark
        ? AppColor.solidDarkColors[index % AppColor.solidDarkColors.length]
        : AppColor.solidLightColors[index % AppColor.solidLightColors.length];

    return Card(
      color: color,
      shadowColor: isDark ? AppColor.lightBackground : AppColor.darkBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: isGridView
              ? Column(
                  spacing: 2,
                  children: [
                    Image.memory(
                      base64Decode(menu.iconsImage!),
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        menu.aumMenuDesc!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Image.memory(
                      base64Decode(menu.iconsImage!),
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        menu.aumMenuDesc!,

                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
