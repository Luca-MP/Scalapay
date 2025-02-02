import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:scalapay/data/api_mamanger.dart';
import 'package:scalapay/data/endpoints.dart';
import 'package:scalapay/data/models/sp_product/sp_product.dart';

@injectable
class ProductService {
  Dio dio = ApiManager().provideDio();

  Future<List<SPProduct>> getProducts(
      String query,
      int per_page,
      int page,
      String filter_by,
      String sort_by,
      double minPrice,
      double maxPrice,
      String partnerId,
      String source,
      String language,
      String country,
      ) async {
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
      data: params,
    );
    List<SPProduct> products = List<SPProduct>.from(response.data as List);
    return products;
  }
}
