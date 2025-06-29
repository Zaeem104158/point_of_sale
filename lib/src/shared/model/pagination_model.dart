import 'package:point_of_sale/src/shared/model/link_model.dart';

class PaginationModel<T> {
  final List<T> items;
  final bool hasMore;
  final int limit;
  final int offset;
  final int count;
  final List<LinkModel> links;

  PaginationModel({
    required this.items,
    required this.hasMore,
    required this.limit,
    required this.offset,
    required this.count,
    required this.links,
  });

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginationModel<T>(
      items: (json['items'] as List)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'],
      limit: json['limit'],
      offset: json['offset'],
      count: json['count'],
      links: (json['links'] as List)
          .map((link) => LinkModel.fromJson(link))
          .toList(),
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'items': items.map(toJsonT).toList(),
      'hasMore': hasMore,
      'limit': limit,
      'offset': offset,
      'count': count,
      'links': links.map((link) => link.toJson()).toList(),
    };
  }
}
