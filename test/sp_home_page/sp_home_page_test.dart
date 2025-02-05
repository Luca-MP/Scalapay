import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:scalapay/bloc/sp_bloc.dart';
import 'package:scalapay/data/models/hits/sp_hits.dart';
import 'package:scalapay/data/models/sp_grouped_hits/sp_grouped_hits.dart';
import 'package:scalapay/data/models/sp_product/sp_product.dart';
import 'package:scalapay/shared_widgets/sp_article.dart';
import 'package:flutter/material.dart';
import 'package:scalapay/shared_widgets/sp_order_bottom_sheet.dart';

// Example productService class
class ProductService {
  Future<List<SPGroupedHits>> fetchData(
    searchText,
    minPrice,
    maxPrice,
    orderType,
    pageSize,
    pageKey,
    pagingController,
  ) async {
    return List.generate(
      1,
      (index) => SPGroupedHits(
        hits: [
          SPHits(
            document: SPDocument(
              affiliate_url:
                  "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUm9RRVVVZnRtUVlRczNSUm1HbWtGZGh2VElEWjVWWEFRPT01&offer=cHlXcEQxTWlpNndCTjk1cnVWUThnczFxdWlHSlNYR1dYTmRUMFVVZ2dleEU1ZDZ0Y1Zwcm5LTEEzWUI1OVQ4NDIxZUYwZ0MwYUR4OFBMaXNHM0ZyUUs0T1BiZjdjbkMyakRDRmpZM2tqYmswQ0ZDWS9kVEYzbVo0NWtFeGdoV091WDgyTHRRbGFVR0R0dW10U1pWNE5ZTnVTUnNZWGdpVmlPVG1ma1ZFZUwzWFZmaUtzV1BhYTg5enYxUUdMOHpWR29SOXVub3JtdkFxYjF3OGhOaVprQ1FBT2l1Tmp1clJlSUJicmYrRTg1empYSnBqVXFOeGYrSlV3SXdtQUhoUXhtNy9IWU5nRGc2SHJERnVlNWZjQ0NkblIzbjBEZDlkTUNkNXBtRW9Bc2xwdVQ4OHh6NjRpUW1uaWdiSUhWUSsrZU9CYzZ5aW5RSDVHNHJxS3NNYmpDUUhwY2xWYkUwaVBTSEI1N3BFR3o0PQ2&sid=&utm_medium=referral&utm_source=scalapayappit",
              brand: "Nike",
              brandId: "nike",
              category:
                  "Sport e Tempo libero > Prodotti per il Fitness > Pesistica",
              category_1: "Sport e Tempo libero",
              category_2: "Prodotti per il Fitness > Pesistica",
              description:
                  "La struttura zigrinata offre una presa sicura e confortevole, consentendo di concentrarsi su ogni ripetizione con precisione. Affidatevi alla qualità superiore del manubrio Nike Strength Pro Urethane per migliorare la vostra routine di fitness e",
              discount_percentage: 0,
              has_image: 1,
              id: "749071986",
              image: "https://pics.trovaprezzi.it/it-300x300/749071986.jpg",
              image_merchant:
                  "https://immagini.trovaprezzi.it/negozi/fitnessdigitalit.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
              list_price: 500,
              merchant: "Fitness Digital",
              merchantId: "fitnessdigitalit",
              new_offer: false,
              selling_price: 500,
              tags: [],
              title:
                  "Nike Strength Manubrio Nike Strength PRO Uretano (paio) - 32kg",
              url:
                  "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUm9RRVVVZnRtUVlRczNSUm1HbWtGZGh2VElEWjVWWEFRPT01&offer=cHlXcEQxTWlpNndCTjk1cnVWUThnczFxdWlHSlNYR1dYTmRUMFVVZ2dleEU1ZDZ0Y1Zwcm5LTEEzWUI1OVQ4NDIxZUYwZ0MwYUR4OFBMaXNHM0ZyUUs0T1BiZjdjbkMyakRDRmpZM2tqYmswQ0ZDWS9kVEYzbVo0NWtFeGdoV091WDgyTHRRbGFVR0R0dW10U1pWNE5ZTnVTUnNZWGdpVmlPVG1ma1ZFZUwzWFZmaUtzV1BhYTg5enYxUUdMOHpWR29SOXVub3JtdkFxYjF3OGhOaVprQ1FBT2l1Tmp1clJlSUJicmYrRTg1empYSnBqVXFOeGYrSlV3SXdtQUhoUXhtNy9IWU5nRGc2SHJERnVlNWZjQ0NkblIzbjBEZDlkTUNkNXBtRW9Bc2xwdVQ4OHh6NjRpUW1uaWdiSUhWUSsrZU9CYzZ5aW5RSDVHNHJxS3NNYmpDUUhwY2xWYkUwaVBTSEI1N3BFR3o0PQ2&sid=&utm_medium=referral&utm_source=scalapayappit",
              isMerchantCard: true,
              merchantToken: "6LKTPJ9RN",
            ),
          ),
        ],
      ),
    );
  }
}

// Mock repository
class MockProductService extends Mock implements ProductService {}

void main() {
  testWidgets(
    'Displays initial data correctly',
    (WidgetTester tester) async {
      final pagingController =
          PagingController<int, SPGroupedHits>(firstPageKey: 1);
      final mockProductService = MockProductService();

      // Mock data response
      when(() => mockProductService.fetchData(
          'Nike', 500, 501, OrderType.asc, 10, 1, pagingController)).thenAnswer(
        (_) async => List.generate(
          1,
          (index) => SPGroupedHits(
            hits: [
              SPHits(
                document: SPDocument(
                  affiliate_url:
                      "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUm9RRVVVZnRtUVlRczNSUm1HbWtGZGh2VElEWjVWWEFRPT01&offer=cHlXcEQxTWlpNndCTjk1cnVWUThnczFxdWlHSlNYR1dYTmRUMFVVZ2dleEU1ZDZ0Y1Zwcm5LTEEzWUI1OVQ4NDIxZUYwZ0MwYUR4OFBMaXNHM0ZyUUs0T1BiZjdjbkMyakRDRmpZM2tqYmswQ0ZDWS9kVEYzbVo0NWtFeGdoV091WDgyTHRRbGFVR0R0dW10U1pWNE5ZTnVTUnNZWGdpVmlPVG1ma1ZFZUwzWFZmaUtzV1BhYTg5enYxUUdMOHpWR29SOXVub3JtdkFxYjF3OGhOaVprQ1FBT2l1Tmp1clJlSUJicmYrRTg1empYSnBqVXFOeGYrSlV3SXdtQUhoUXhtNy9IWU5nRGc2SHJERnVlNWZjQ0NkblIzbjBEZDlkTUNkNXBtRW9Bc2xwdVQ4OHh6NjRpUW1uaWdiSUhWUSsrZU9CYzZ5aW5RSDVHNHJxS3NNYmpDUUhwY2xWYkUwaVBTSEI1N3BFR3o0PQ2&sid=&utm_medium=referral&utm_source=scalapayappit",
                  brand: "Nike",
                  brandId: "nike",
                  category:
                      "Sport e Tempo libero > Prodotti per il Fitness > Pesistica",
                  category_1: "Sport e Tempo libero",
                  category_2: "Prodotti per il Fitness > Pesistica",
                  description:
                      "La struttura zigrinata offre una presa sicura e confortevole, consentendo di concentrarsi su ogni ripetizione con precisione. Affidatevi alla qualità superiore del manubrio Nike Strength Pro Urethane per migliorare la vostra routine di fitness e",
                  discount_percentage: 0,
                  has_image: 1,
                  id: "749071986",
                  image: "https://pics.trovaprezzi.it/it-300x300/749071986.jpg",
                  image_merchant:
                      "https://immagini.trovaprezzi.it/negozi/fitnessdigitalit.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
                  list_price: 500,
                  merchant: "Fitness Digital",
                  merchantId: "fitnessdigitalit",
                  new_offer: false,
                  selling_price: 500,
                  tags: [],
                  title:
                      "Nike Strength Manubrio Nike Strength PRO Uretano (paio) - 32kg",
                  url:
                      "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUm9RRVVVZnRtUVlRczNSUm1HbWtGZGh2VElEWjVWWEFRPT01&offer=cHlXcEQxTWlpNndCTjk1cnVWUThnczFxdWlHSlNYR1dYTmRUMFVVZ2dleEU1ZDZ0Y1Zwcm5LTEEzWUI1OVQ4NDIxZUYwZ0MwYUR4OFBMaXNHM0ZyUUs0T1BiZjdjbkMyakRDRmpZM2tqYmswQ0ZDWS9kVEYzbVo0NWtFeGdoV091WDgyTHRRbGFVR0R0dW10U1pWNE5ZTnVTUnNZWGdpVmlPVG1ma1ZFZUwzWFZmaUtzV1BhYTg5enYxUUdMOHpWR29SOXVub3JtdkFxYjF3OGhOaVprQ1FBT2l1Tmp1clJlSUJicmYrRTg1empYSnBqVXFOeGYrSlV3SXdtQUhoUXhtNy9IWU5nRGc2SHJERnVlNWZjQ0NkblIzbjBEZDlkTUNkNXBtRW9Bc2xwdVQ4OHh6NjRpUW1uaWdiSUhWUSsrZU9CYzZ5aW5RSDVHNHJxS3NNYmpDUUhwY2xWYkUwaVBTSEI1N3BFR3o0PQ2&sid=&utm_medium=referral&utm_source=scalapayappit",
                  isMerchantCard: true,
                  merchantToken: "6LKTPJ9RN",
                ),
              ),
            ],
          ),
        ),
      );

      // Define the test widget
      final widget = MaterialApp(
        home: Scaffold(
          body: PagedGridView<int, SPGroupedHits>(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 376,
            ),
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            shrinkWrap: true,
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<SPGroupedHits>(
              animateTransitions: true,
              itemBuilder: (context, product, index) => GestureDetector(
                onTap: () => BlocProvider.of<SpBloc>(context).add(
                  SpEvent.openLink(url: product.hits.first.document.url!),
                ),
                child: SPArticle(
                  articleImage: product.hits.first.document.image,
                  title: product.hits.first.document.title,
                  store: product.hits.first.document.merchant,
                  price: product.hits.first.document.selling_price,
                ),
              ),
            ),
          ),
        ),
      );

      // Pump the widget
      await tester.pumpWidget(widget);

      // Simulate data loading
      pagingController.appendPage(
        await mockProductService.fetchData(
          'Nike',
          500,
          501,
          OrderType.asc,
          10,
          1,
          pagingController,
        ),
        2,
      );
      await tester.pump();

      // Verify the first item appears
      expect(find.text(""), findsNothing);
      expect(
        find.text(
            'Nike Strength Manubrio Nike Strength PRO Uretano (paio) - 32kg'),
        findsOneWidget,
      );
    },
  );
}
