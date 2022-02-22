import 'dart:convert';

import 'package:collection/collection.dart';

class PaginatedResponse {
  int? page;
  int? totalPages;
  int? perPage;
  int? totalData;
  List? data;

  PaginatedResponse({
    this.page,
    this.totalPages,
    this.perPage,
    this.totalData,
    this.data,
  });

  PaginatedResponse copyWith({
    int? page,
    int? totalPages,
    int? perPage,
    int? totalData,
    List? data,
  }) {
    return PaginatedResponse(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      perPage: perPage ?? this.perPage,
      totalData: totalData ?? this.totalData,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'totalPages': totalPages,
      'perPage': perPage,
      'totalData': totalData,
      'data': data,
    };
  }

  factory PaginatedResponse.fromMap(Map<String, dynamic> map) {
    return PaginatedResponse(
      page: map['page']?.toInt() ?? 0,
      totalPages: map['totalPages']?.toInt() ?? 0,
      perPage: map['perPage']?.toInt() ?? 0,
      totalData: map['totalData']?.toInt() ?? 0,
      data: List.from(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedResponse.fromJson(String source) =>
      PaginatedResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return '''PaginatedResponse(page: $page, totalPages: $totalPages, perPage: $perPage, totalData: $totalData, data: $data)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is PaginatedResponse &&
        other.page == page &&
        other.totalPages == totalPages &&
        other.perPage == perPage &&
        other.totalData == totalData &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return page.hashCode ^
        totalPages.hashCode ^
        perPage.hashCode ^
        totalData.hashCode ^
        data.hashCode;
  }
}
