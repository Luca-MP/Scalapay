import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:scalapay/bloc/sp_bloc.dart';
import 'package:scalapay/data/productService.dart';
import 'package:scalapay/shared_widgets/sp_order_bottom_sheet.dart';

class MockProductService extends Mock implements ProductService {}

void main() {
  late SpBloc spBloc;
  late MockProductService mockProductService;
  late PagingController<int, dynamic> pagingController;

  setUp(() {
    mockProductService = MockProductService();
    spBloc = SpBloc(mockProductService);
    pagingController = PagingController(firstPageKey: 1);
  });

  tearDown(() {
    spBloc.close();
  });

  group("tests bloc", () {
    test('Initial state should be searching', () {
      expect(spBloc.state, const SpState.searching());
    });

    blocTest<SpBloc, SpState>(
      'emits nothing when search event is added (since state is not changing)',
      build: () {
        when(() => mockProductService.getProducts(
          query: any(named: "query"),
          per_page: any(named: "per_page"),
          page: any(named: "page"),
          filter_by: any(named: "filter_by"),
          sort_by: any(named: "sort_by"),
          minPrice: any(named: "minPrice"),
          maxPrice: any(named: "maxPrice"),
          partnerId: any(named: "partnerId"),
          source: any(named: "source"),
          language: any(named: "language"),
          country: any(named: "country"),
        )).thenAnswer((_) async => []);

        return spBloc;
      },
      act: (bloc) => bloc.add(SpEvent.search(
        searchText: "Nike",
        minPrice: 100.0,
        maxPrice: 500.0,
        orderType: OrderType.asc,
        pageSize: 10,
        pageKey: 1,
        pagingController: pagingController,
      )),
      expect: () => [],
    );

    blocTest<SpBloc, SpState>(
      'handles API failure properly',
      build: () {
        when(() => mockProductService.getProducts(
          query: any(named: "query"),
          per_page: any(named: "per_page"),
          page: any(named: "page"),
          filter_by: any(named: "filter_by"),
          sort_by: any(named: "sort_by"),
          minPrice: any(named: "minPrice"),
          maxPrice: any(named: "maxPrice"),
          partnerId: any(named: "partnerId"),
          source: any(named: "source"),
          language: any(named: "language"),
          country: any(named: "country"),
        )).thenThrow(Exception("API Error"));

        return spBloc;
      },
      act: (bloc) => bloc.add(SpEvent.search(
        searchText: "Nike",
        minPrice: 100.0,
        maxPrice: 500.0,
        orderType: OrderType.asc,
        pageSize: 10,
        pageKey: 1,
        pagingController: pagingController,
      )),
      verify: (_) => expect(pagingController.error, isA<Exception>()),
    );
  });
}
