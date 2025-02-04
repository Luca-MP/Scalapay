import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:scalapay/data/api_mamanger.dart';
import 'package:scalapay/data/endpoints.dart';
import 'package:scalapay/data/models/sp_grouped_hits/sp_grouped_hits.dart';

@injectable
class ProductService {
  Dio dio = ApiManager().provideDio();

  Future<List<SPGroupedHits>> getProducts({
    required String query,
    required int per_page,
    required int page,
    required String filter_by,
    required String sort_by,
    required double minPrice,
    required double maxPrice,
    required String partnerId,
    required String source,
    required String language,
    required String country,
  }) async {
    Map<String, dynamic> params = {
      "q": query,
      "per_page": per_page,
      "page": page,
      "filter_by": filter_by,
      "sort_by": sort_by,
      "minPrice": minPrice,
      "maxPrice": maxPrice,
      "partnerId": partnerId,
      "source": source,
      "language": language,
      "country": country,
    };

    final response = await dio.get(
      Endpoints.search,
      queryParameters: params,
    );
    List<dynamic> groupedHitsList = response.data["grouped_hits"];
    List<SPGroupedHits?> parsedList = groupedHitsList.map(
            (value) => SPGroupedHits.fromJson(value)
    ).toList();
    return parsedList.whereType<SPGroupedHits>().toList();
  }
}
