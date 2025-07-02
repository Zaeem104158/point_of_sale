import 'package:equatable/equatable.dart';
import 'package:point_of_sale/src/features/home/domain/entity/company_news_report_entity.dart';
import 'package:point_of_sale/src/features/home/domain/entity/home_response_entity.dart';

class HomeState extends Equatable {
  final List<HomeMenusResponseEntity> menus;
  final List<CompanyNewsReportEntity> news;
  final bool isLoading;
  final String? error;

  const HomeState({
    this.menus = const [],
    this.news = const [],
    this.isLoading = false,
    this.error,
  });

  HomeState copyWith({
    List<HomeMenusResponseEntity>? menus,
    List<CompanyNewsReportEntity>? news,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      menus: menus ?? this.menus,
      news: news ?? this.news,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [menus, news, isLoading, error];
}
