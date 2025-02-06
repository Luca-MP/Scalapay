import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:scalapay/data/api_mamanger.dart';
import 'package:scalapay/data/endpoints.dart';
import 'package:scalapay/data/models/sp_grouped_hits/sp_grouped_hits.dart';
import 'package:scalapay/shared_widgets/constants.dart';

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
      SPConstants.qParam: query,
      SPConstants.perPageParam: per_page,
      SPConstants.pageParam: page,
      SPConstants.filterByParam: filter_by,
      SPConstants.sortByParam: sort_by,
      SPConstants.minPriceParam: minPrice,
      SPConstants.maxPriceParam: maxPrice,
      SPConstants.partnerIdParam: partnerId,
      SPConstants.sourceParam: source,
      SPConstants.languageParam: language,
      SPConstants.countryParam: country,
    };

    final response = await dio.get(
      Endpoints.search,
      queryParameters: params,
    );
    List<dynamic> groupedHitsList = response.data[SPConstants.groupedHits];
    List<SPGroupedHits?> parsedList = groupedHitsList.map(
            (value) => SPGroupedHits.fromJson(value)
    ).toList();
    return parsedList.whereType<SPGroupedHits>().toList();
  }
}
