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

// Mock repository
class MockProductService extends Mock implements ProductService {}

void main() {
  group(
    "Tests InfiniteScrollPagination", () {
      testWidgets(
        'Displays initial data correctly', (WidgetTester tester) async {
          final pagingController = PagingController<int, SPGroupedHits>(firstPageKey: 1);
          final mockProductService = MockProductService();

          // Mock data response
          when(() => mockProductService.fetchData('Nike', 100, 500, OrderType.asc, 10, 1, pagingController)).thenAnswer((_) => ProductService().page1);

          // Pump the widget
          await tester.pumpWidget(await SPHomePage(pagingController));

          // Simulate data loading
          pagingController.appendPage(mockProductService.fetchData('Nike', 100, 500, OrderType.asc, 10, 1, pagingController), 2);
          await tester.pump();

          // Verify the first item appears
          expect(find.text(""), findsNothing);
          expect(find.text('Nike Sneakers Donna Nike Cortez Leather Bianco Rosso'), findsOneWidget);
        },
      );

      testWidgets(
        'Loads more items when scrolled', (WidgetTester tester) async {
          final pagingController = PagingController<int, SPGroupedHits>(firstPageKey: 1);
          final mockProductService = MockProductService();

          when(() => mockProductService.fetchData('Nike', 100, 500, OrderType.asc, 10, 1, pagingController)).thenAnswer((_) => ProductService().page1);
          when(() => mockProductService.fetchData('Nike', 100, 500, OrderType.asc, 10, 2, pagingController)).thenAnswer((_) => ProductService().page2);

          await tester.pumpWidget(await SPHomePage(pagingController));

          // Load the first page
          pagingController.appendPage(mockProductService.fetchData('Nike', 100, 500, OrderType.asc, 10, 1, pagingController), 2);
          await tester.pump();

          // Ensure first items are loaded
          expect(find.text('Nike Sneakers Donna Nike Cortez Leather Bianco Rosso'), findsOneWidget);
          expect(find.text('Nike Wmns Air Force 1 \'07, Scarpe da Basket Donna, White White Black, 36 EU'), findsOneWidget);

          // Scroll to trigger pagination
          await tester.drag(find.byType(MaterialApp), const Offset(0, -60000));
          await tester.pump();

          // Load next page
          pagingController.appendPage(mockProductService.fetchData('Nike', 100, 500, OrderType.asc, 10, 2, pagingController), 3);
          await tester.pump();

          // Verify new items loaded
          expect(find.text('Nike Pantalone Donna Nike Sportswear Tech Fleece Bianco'), findsOneWidget);
          expect(find.text('Nike Tuta da Uomo Sport Essentials Poly-Knit Nera Taglia L Cod DM6843-010'), findsOneWidget);
        }
      );

      testWidgets(
        'Displays error message when an error occurs', (WidgetTester tester) async {
          final pagingController = PagingController<int, SPGroupedHits>(firstPageKey: 1);
          final mockProductService = MockProductService();

          when(() => mockProductService.fetchData('Nike', 100, 500, OrderType.asc, 10, 1, pagingController)).thenThrow(Exception('Failed to load'));

          await tester.pumpWidget(await SPHomePage(pagingController));

          // Simulate an error
          pagingController.error = 'Failed to load';
          await tester.pump();

          // Verify error message appears
          expect(find.textContaining('Something went wrong'), findsOneWidget);
        },
      );

      testWidgets(
        'Refreshes data on pull-to-refresh', (WidgetTester tester) async {
          final pagingController = PagingController<int, SPGroupedHits>(firstPageKey: 1);
          final mockProductService = MockProductService();

          when(() => mockProductService.fetchData('Nike', 100, 500, OrderType.asc, 10, 1, pagingController)).thenAnswer((_) => ProductService().page1);

          await tester.pumpWidget(await SPHomePage(pagingController));

          // Load initial data
          pagingController.appendPage(mockProductService.fetchData('Nike', 100, 500, OrderType.asc, 10, 1, pagingController), 2);
          await tester.pump();

          // Verify initial items
          expect(find.text('Nike Sneakers Donna Nike Cortez Leather Bianco Rosso'), findsOneWidget);

          // Trigger refresh and waiting to load data again
          await tester.drag(find.byType(MaterialApp), const Offset(0, 300));
          await tester.pumpAndSettle(const Duration(seconds: 2));

          // Refresh data
          pagingController.refresh();
          await tester.pump();

          // Verify refresh worked
          expect(find.text('Nike Sneakers Donna Nike Cortez Leather Bianco Rosso'), findsOneWidget);
        },
      );
    },
  );
}

// Example productService class
class ProductService {
  List<SPGroupedHits> page1 = [
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxVEFMS2pZT3dNaUVsMmtNNkswOG5ydFZISzhsbFVvWGJRPT01&offer=cU1RZWh2WXlsd29MME9rRndpV3NETE1MdlU4NCtZWjA0Szl3eWpVQk9WaXlXMkM4M1FpdGpWbktGSDViakxBTWdXUlBUVVA0YVVHMVUvUlVGWFhiUUJGaHhrY2VkT2FuU0UyU0o0aFlneVVBb1hSaHVGMzBpWEhWekxNb2xCNVhGVlZJY1lYQTR3SWdndTMzd0VCbVl5RHpzd1FpaEdmSm02aUQzVllkUEQ0UFBtL3dScUhrRnJlMEJ1SjQwcU83Lzd0QzNDcktNZFZtRER6L2JXNXU3MXJvdmcwcVcrblZQUDVsUURlMEpjbmMrUDJQek4vYmlPQVVacy9jOVJTcldNZDJUakllMWQ1YjhQc2NHOWNaS0dJVEcwcUVDcHFYak9yUFgyUWZOc3dQMkJzUGlSNnZ1NzV2T3hlbWF6NS94MXdBaTgyWTFaS0hibENqSko5eHcxRWdCM3lWS0FTRTRUVHZST241eDJickZ3M2tWVkJjYzlzNFR0TXJtVFpDK1V1b3I1MGxCYUN6d1VTei9acmdBOUtoYXZlVnVneWF1akdIMU9vWEZOUi9pTTBUdHB2bW53PT01&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Scarpe > Sneakers e Scarpe Sportive",
            category_1: "Moda",
            category_2: "Scarpe > Sneakers e Scarpe Sportive",
            description: "Taglie disponibili: 37_1_2 38 38_1_2 39 40 40_1_2 41 - Nike Sneakers Cortez Leather Donna White Varsity Red",
            discount_percentage: 0,
            has_image: 1,
            id: "753324111",
            image: "https://pics.trovaprezzi.it/it-300x300/753324111.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/nonsolosport.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "NonSoloSport",
            merchantId: "nonsolosport",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike Sneakers Donna Nike Cortez Leather Bianco Rosso",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxVEFMS2pZT3dNaUVsMmtNNkswOG5ydFZISzhsbFVvWGJRPT01&offer=cU1RZWh2WXlsd29MME9rRndpV3NETE1MdlU4NCtZWjA0Szl3eWpVQk9WaXlXMkM4M1FpdGpWbktGSDViakxBTWdXUlBUVVA0YVVHMVUvUlVGWFhiUUJGaHhrY2VkT2FuU0UyU0o0aFlneVVBb1hSaHVGMzBpWEhWekxNb2xCNVhGVlZJY1lYQTR3SWdndTMzd0VCbVl5RHpzd1FpaEdmSm02aUQzVllkUEQ0UFBtL3dScUhrRnJlMEJ1SjQwcU83Lzd0QzNDcktNZFZtRER6L2JXNXU3MXJvdmcwcVcrblZQUDVsUURlMEpjbmMrUDJQek4vYmlPQVVacy9jOVJTcldNZDJUakllMWQ1YjhQc2NHOWNaS0dJVEcwcUVDcHFYak9yUFgyUWZOc3dQMkJzUGlSNnZ1NzV2T3hlbWF6NS94MXdBaTgyWTFaS0hibENqSko5eHcxRWdCM3lWS0FTRTRUVHZST241eDJickZ3M2tWVkJjYzlzNFR0TXJtVFpDK1V1b3I1MGxCYUN6d1VTei9acmdBOUtoYXZlVnVneWF1akdIMU9vWEZOUi9pTTBUdHB2bW53PT01&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: null,
            merchantToken: null,
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=bW5JU0NRUWNwektiM1lWT1lUeHBoOVhBNmlGWEJiTEI0UlF0ZWV4YksrdC85Q0dWTDMzWTNocldzMFRYdG1HakROZEx3S0ZrT2owV0lKN09iMWt0WWZSc3hFblhqNDcwUkJrKzVsTkEwVHFJZzl1cVVHUEZDMmZ2S3pPQ2tNWlNtbTZ0WEtBSzZtOUhNdm5NcVBicEFDNHNRdDFIdXNXYUZwMEJkQS8xS1VKUHZGdGJST0toNzBXb3E4ZzFMQldlYi9Va0swQ3QwYjdINnlkQ2FZOW9LZHRkTTR1ZzBGeUdyWUVPT0cwOFVvWThkcXZpVWZFdGx4b21ZTHAxZEgxWVIrK1l1ZFBmMU1mN29TeUJnWmVPQ3IwaE1NTm1oYmN1Qmp4aUdKVGttdklSbmNUQjNyNENxaTdEekZxdG9rYUtwQ3hxNDhjU0FCeHlTY25SdEJnSzIwdlhES2lMZE1CSDZ4N3AvVGNKaVE4OER6c2ZWVVdhRGRaM0FRMWNvdjExQmg2S2dSb3RaemFJdllzUG8wYWMvQ2FEYlUyYWN3NWdpd2xjL0xhMnBRc1NWYm1XUlFZR2NtTTFvbWR0ODlvZFF3STB3RVdQWm9RPQ2&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Scarpe > Sneakers e Scarpe Sportive",
            category_1: "Moda",
            category_2: "Scarpe > Sneakers e Scarpe Sportive",
            description: "Nike Wmns Air Force 1 '07, Scarpe da Basket Donna, White White Black, 36 EU Marca: Nike Nike Scarpe da ginnastica unisex Air Force 1 07, colore bianco e nero, taglia 36 EU Tipo di prodotto: Shoes Taglia: EU 36 Colore: bianco e nero",
            discount_percentage: 0,
            has_image: 1,
            id: "701680287",
            image: "https://pics.trovaprezzi.it/it-300x300/701680287.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/amazonitshoes.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "Amazon",
            merchantId: "amazonitshoes",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike Wmns Air Force 1 '07, Scarpe da Basket Donna, White White Black, 36 EU",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=bW5JU0NRUWNwektiM1lWT1lUeHBoOVhBNmlGWEJiTEI0UlF0ZWV4YksrdC85Q0dWTDMzWTNocldzMFRYdG1HakROZEx3S0ZrT2owV0lKN09iMWt0WWZSc3hFblhqNDcwUkJrKzVsTkEwVHFJZzl1cVVHUEZDMmZ2S3pPQ2tNWlNtbTZ0WEtBSzZtOUhNdm5NcVBicEFDNHNRdDFIdXNXYUZwMEJkQS8xS1VKUHZGdGJST0toNzBXb3E4ZzFMQldlYi9Va0swQ3QwYjdINnlkQ2FZOW9LZHRkTTR1ZzBGeUdyWUVPT0cwOFVvWThkcXZpVWZFdGx4b21ZTHAxZEgxWVIrK1l1ZFBmMU1mN29TeUJnWmVPQ3IwaE1NTm1oYmN1Qmp4aUdKVGttdklSbmNUQjNyNENxaTdEekZxdG9rYUtwQ3hxNDhjU0FCeHlTY25SdEJnSzIwdlhES2lMZE1CSDZ4N3AvVGNKaVE4OER6c2ZWVVdhRGRaM0FRMWNvdjExQmg2S2dSb3RaemFJdllzUG8wYWMvQ2FEYlUyYWN3NWdpd2xjL0xhMnBRc1NWYm1XUlFZR2NtTTFvbWR0ODlvZFF3STB3RVdQWm9RPQ2&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: true,
            merchantToken: "6LKTPJ9RN",
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=cHlXcEQxTWlpNnpaQXNQMHFxdStIcHpROEhiU1JaYmNQZHJqMnhqL1ZzK0t4NVRPZGRtVEk0czVWZ0pKVmYzdCtMQjhaMm1WNTBMWmpiaThwNzZLQXArWUpDMjNZcDl3b0NrMUI4c0FJRFBhS3lZbVRvOVR3VFh2Nkl4RDNiZUF4TFFMMUtYVldJd1o4Zzl3TzcwK3BXbmNId0xlL1FCdExNUW9FUW5TU01rZHRaR25aTGkrUFZPRlE2U2dLVHVjU2xkT3ZqMlFrSDAxb1dTVWRiNFp0RVh3ZVRFKzJvZTZkazhVY2ptcUh3aXJsRTNkUGdkdmFZMHozL3VhSVU5bndRaDhhcVFnZkIxVXRJcU5ITjg2VXloL1YxZWRzQUZZS202dlRFWEg2V2EyVDJpcU1Ga0FsYWxrMmdpR3FnUEFLdFNFcVgxT1I5TDlCamUrNmlLUHIyMnRWaVVpVUc3STRyS1FJRE9GM0ZwRC9SZ1dFQjdOOVFEREQwa09jNXZ1Z0V2aEV1TUg4TVFwOHh0Qm10Y0ZTM1pPT3FRVmM2WUwzV010MUZtbklvM21vV082eTR4RDVXQTF2UFM2QjhNaDRzaHU3WklzVDRib2V1UVZIcFBFMW4wMHFLRExkaG5xcDdTVEtCaVNJSWhEbS90Zlo2NG9aL2RXWC9JSGpneUZnVGV1UU9EZi9WRT01&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Scarpe > Sneakers e Scarpe Sportive",
            category_1: "Moda",
            category_2: "Scarpe > Sneakers e Scarpe Sportive",
            description: "Nike - Air Max Invigor Print, Scarpe da corsa Uomo, Multicolore (Negro / Blanco / Gris (Black / White-Cool Grey)), 40,5 Colore: Black/White/Cool Grey",
            discount_percentage: 0,
            has_image: 1,
            id: "743625163",
            image: "https://pics.trovaprezzi.it/it-300x300/743625163.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/amazonitshoesnoprime.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "Amazon",
            merchantId: "amazonitshoesnoprime",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike - Air Max Invigor Print, Scarpe da corsa Uomo, Multicolore (Negro / Blanco / Gris (Black / White-Cool Grey)), 40,5",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=cHlXcEQxTWlpNnpaQXNQMHFxdStIcHpROEhiU1JaYmNQZHJqMnhqL1ZzK0t4NVRPZGRtVEk0czVWZ0pKVmYzdCtMQjhaMm1WNTBMWmpiaThwNzZLQXArWUpDMjNZcDl3b0NrMUI4c0FJRFBhS3lZbVRvOVR3VFh2Nkl4RDNiZUF4TFFMMUtYVldJd1o4Zzl3TzcwK3BXbmNId0xlL1FCdExNUW9FUW5TU01rZHRaR25aTGkrUFZPRlE2U2dLVHVjU2xkT3ZqMlFrSDAxb1dTVWRiNFp0RVh3ZVRFKzJvZTZkazhVY2ptcUh3aXJsRTNkUGdkdmFZMHozL3VhSVU5bndRaDhhcVFnZkIxVXRJcU5ITjg2VXloL1YxZWRzQUZZS202dlRFWEg2V2EyVDJpcU1Ga0FsYWxrMmdpR3FnUEFLdFNFcVgxT1I5TDlCamUrNmlLUHIyMnRWaVVpVUc3STRyS1FJRE9GM0ZwRC9SZ1dFQjdOOVFEREQwa09jNXZ1Z0V2aEV1TUg4TVFwOHh0Qm10Y0ZTM1pPT3FRVmM2WUwzV010MUZtbklvM21vV082eTR4RDVXQTF2UFM2QjhNaDRzaHU3WklzVDRib2V1UVZIcFBFMW4wMHFLRExkaG5xcDdTVEtCaVNJSWhEbS90Zlo2NG9aL2RXWC9JSGpneUZnVGV1UU9EZi9WRT01&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: true,
            merchantToken: "6LKTPJ9RN",
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=cHlXcEQxTWlpNncyN05sa1pSMFhUbWJ0V0gxYThabUx5aDhFcXRpaDMvVDFka0dKOE1VNnYrNzFrRnkxczhQWEVvU3lZWUNwRDBTaEREdTd5RGhPWmpXbnlYYmgzYVB4WTl1M1NIU3hUczVYZDNNbzlZcmZCRUVkMFUyZkZnYURMKzRkN01OVnZBamhKMmRDazBpR2xGc0JRaWt5Q2lSZzVDTk8ySlJCRHg3M0dxb1pxWVlnZ1RyY0NuUnkrVU5QelIrVzFrQmIrbFB1QTRCK0d6dG11em1EN3pTNU1Uc2ZQdGg0OVdpSm9LcG9CVFBQcmk3c3FMZnRSNnJoVWZtZXBLN08wWFJpWUNYM3VXN0QxMWVHTFBhMGlUYW1ZUjNVV3FsRE8rR0V3dGU1TnIxWXdUK0RVdXJvQVQ3WGVZcDJoVjZsWjBZckoxQT01&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "",
            brandId: "",
            category: "Sport e Tempo libero > Prodotti per il Fitness > Altre Attrezzature fitness",
            category_1: "Sport e Tempo libero",
            category_2: "Prodotti per il Fitness > Altre Attrezzature fitness",
            description: "Disponibili nei formati Small (fino a 18,1 kg), Medium (fino a 36,3 kg) e Large (fino a 54,4 kg), ciascuno progettato con dimensioni specifiche per soddisfare le vostre esigenze di allenamento.",
            discount_percentage: 0,
            has_image: 1,
            id: "749071989",
            image: "https://pics.trovaprezzi.it/it-300x300/749071989.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/fitnessdigitalit.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "Fitness Digital",
            merchantId: "fitnessdigitalit",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike Strength Sandbag Nike Strength - S",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=cHlXcEQxTWlpNncyN05sa1pSMFhUbWJ0V0gxYThabUx5aDhFcXRpaDMvVDFka0dKOE1VNnYrNzFrRnkxczhQWEVvU3lZWUNwRDBTaEREdTd5RGhPWmpXbnlYYmgzYVB4WTl1M1NIU3hUczVYZDNNbzlZcmZCRUVkMFUyZkZnYURMKzRkN01OVnZBamhKMmRDazBpR2xGc0JRaWt5Q2lSZzVDTk8ySlJCRHg3M0dxb1pxWVlnZ1RyY0NuUnkrVU5QelIrVzFrQmIrbFB1QTRCK0d6dG11em1EN3pTNU1Uc2ZQdGg0OVdpSm9LcG9CVFBQcmk3c3FMZnRSNnJoVWZtZXBLN08wWFJpWUNYM3VXN0QxMWVHTFBhMGlUYW1ZUjNVV3FsRE8rR0V3dGU1TnIxWXdUK0RVdXJvQVQ3WGVZcDJoVjZsWjBZckoxQT01&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: null,
            merchantToken: null,
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=bW5JU0NRUWNwektBb0ltZGE1R3l4V2tSaVNzQ0xhaGxJOVhtU2hoWnYxUm8wS0Izc3RXYUp3K2Q0YWM2TUhqTGd2ZGd0Q0ZhWWFJZndtRlYydFJuMmxtS0hWUnpqb1VRM2xnVG5zb2Q0ZzRWNnpCakFORUc4L213a25iZElrMVgvMnZaM2paODMzUVJhVWtUaFh1SWJDc2NsblcvZUt0eWphdnViMDR6bXBjZFliZ0JEMUovSlBEWE5BVnBQMVhXUG9UNUNZSE1aNW43ZWdoZDZ3RnpnU3NtUzducHNNUzJPU29MRHljTVNid0E2Q0N5NDNwZXBKTENCNktEK3NCMkF6RU9pK0dkYXcwWVllRG1Ba2hhV1RxUFp0dXdpMUJ3NkZEZzVYTHR2MFpHRGtZb3g2eWhHMEdZWkJhS2dBV05LbmdUNElYcldUc2RETVk2ZEh0RHFSUnJPdDU5TjhYQQ2&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Sport e Tempo libero > Prodotti per il Fitness > Pesistica",
            category_1: "Sport e Tempo libero",
            category_2: "Prodotti per il Fitness > Pesistica",
            description: "Realizzate in gomma vergine di prima qualità, sono costruite per resistere a innumerevoli ripetizioni. Elevate il vostro gioco di fitness con Nike, dove versatilità e resistenza incontrano i vostri obiettivi di forza.",
            discount_percentage: 0,
            has_image: 1,
            id: "708214768",
            image: "https://pics.trovaprezzi.it/it-300x300/708214768.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/fitnessdigitalit.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "Fitness Digital",
            merchantId: "fitnessdigitalit",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike Strength Disco di gomma Nike Strength Bumper - 20kg",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=bW5JU0NRUWNwektBb0ltZGE1R3l4V2tSaVNzQ0xhaGxJOVhtU2hoWnYxUm8wS0Izc3RXYUp3K2Q0YWM2TUhqTGd2ZGd0Q0ZhWWFJZndtRlYydFJuMmxtS0hWUnpqb1VRM2xnVG5zb2Q0ZzRWNnpCakFORUc4L213a25iZElrMVgvMnZaM2paODMzUVJhVWtUaFh1SWJDc2NsblcvZUt0eWphdnViMDR6bXBjZFliZ0JEMUovSlBEWE5BVnBQMVhXUG9UNUNZSE1aNW43ZWdoZDZ3RnpnU3NtUzducHNNUzJPU29MRHljTVNid0E2Q0N5NDNwZXBKTENCNktEK3NCMkF6RU9pK0dkYXcwWVllRG1Ba2hhV1RxUFp0dXdpMUJ3NkZEZzVYTHR2MFpHRGtZb3g2eWhHMEdZWkJhS2dBV05LbmdUNElYcldUc2RETVk2ZEh0RHFSUnJPdDU5TjhYQQ2&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: null,
            merchantToken: null,
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=WkxFdm93d3Y2VVo1dEFDQlRNc1A1TTRvOUJxMUlnWVd0NXpVd2VPTkduRXlKUGZBVFZ3eGpNMjNkWlZQeEk3NDFxaDBOTlZTdWpieU95NVc1d05tWW1QTGY3QWYzNVFlRzBKOTJ1TlF5RzI4RWFhY1cwWmNVb1NZYzJCZGFTS0hDNW1zUnZqbmZjQnFPamtYZXl5dkVicjVVL0djT0xFckI0LzQybHdqZG9jVzRveGRBRXZqbFhQd3Z0LytCNlFwc2VZcnNobW13OEptV2pNNkF5Z2crWGFOSVBNcUtPNTU5aHllMHlpeEJsRVpiUWRIREVZaFRZaEl4UVV6VlFuQUNxTnJkNjdBNFB4OE9wM0UxWnVmVC9pNnBhbTMvSXNGNWNSNkdod0gvbVlSODRQTjFETnVJa1R4WkJCZ0E2d3pHc2hzTjdic0FnbmtXSnVzTml1MjAvbHB4bWE1aFZIc0hZME5MV2IzYkdPaWZRazNZVUU4THFhYURJaElwc2wwSTNFaWRsK0tSMU9tRmdobmJjVnowT1c2R2JSd0dkdEU1&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Scarpe > Sneakers e Scarpe Sportive",
            category_1: "Moda",
            category_2: "Scarpe > Sneakers e Scarpe Sportive",
            description: "Taglie disponibili: 44 44_1_2 45 46 39 40 41 42 42_1_2 43 - Nike Sneakers Full Force Low Uomo White",
            discount_percentage: 0,
            has_image: 1,
            id: "632180452",
            image: "https://pics.trovaprezzi.it/it-300x300/632180452.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/nonsolosport.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "NonSoloSport",
            merchantId: "nonsolosport",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike Sneakers Uomo Nike Full Force Low Bianco",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=WkxFdm93d3Y2VVo1dEFDQlRNc1A1TTRvOUJxMUlnWVd0NXpVd2VPTkduRXlKUGZBVFZ3eGpNMjNkWlZQeEk3NDFxaDBOTlZTdWpieU95NVc1d05tWW1QTGY3QWYzNVFlRzBKOTJ1TlF5RzI4RWFhY1cwWmNVb1NZYzJCZGFTS0hDNW1zUnZqbmZjQnFPamtYZXl5dkVicjVVL0djT0xFckI0LzQybHdqZG9jVzRveGRBRXZqbFhQd3Z0LytCNlFwc2VZcnNobW13OEptV2pNNkF5Z2crWGFOSVBNcUtPNTU5aHllMHlpeEJsRVpiUWRIREVZaFRZaEl4UVV6VlFuQUNxTnJkNjdBNFB4OE9wM0UxWnVmVC9pNnBhbTMvSXNGNWNSNkdod0gvbVlSODRQTjFETnVJa1R4WkJCZ0E2d3pHc2hzTjdic0FnbmtXSnVzTml1MjAvbHB4bWE1aFZIc0hZME5MV2IzYkdPaWZRazNZVUU4THFhYURJaElwc2wwSTNFaWRsK0tSMU9tRmdobmJjVnowT1c2R2JSd0dkdEU1&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: null,
            merchantToken: null,
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=dmd6TFpvWFhrTVhEeUhzKzNMWFdIeWhObWY2S1RkQVNpU2sxblNQNFpLNjhIMlZJUk03RHNuZ0EwckZteGo2YzNYVFluV0V2RGJGcmFLanRHQjNGRW1sT1AwTkI5WlJlcEdYVHVpUHRsZGUxTldzdnRreU1zV1lHeG93UTUzZ1RhZWJVR1crVm83cjBpNXhBSFhLbzhLWlppTXRKMjRUY1V6WmlKdmZmcFFTaW9JTHo2Wk9tTGNUNVRwQVJxWEJWWEMwM0JCTjJoWFk1OE8rV3hOREx2TTFiWmZxVGxiUE1TT0hNNUQ0a3d2QTVSNHF2ZFMvcEpsYlFaUDM5T2dUbzNxOEI5YmdFVWd5WkxqSnVFcjRCekh1YS9YeWVnTE42Mm5zRTRqT2d2MEhIK25GZnk0YlI3WHlsK0VaOHlHbis3d1JJamFFY2lHVHA1clVBSzFTTkhZTTlWNGtBQ1lGSjlndTFvVFBpQTFrME5UQlA4K052RnFJS3pOZmFNdmE1b3Nna0ljMUJUQUU4YWdIN090V3Z4b2FJWXYvbFhGV2JWMTFCeFdML1Q2QT01&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Scarpe > Sneakers e Scarpe Sportive",
            category_1: "Moda",
            category_2: "Scarpe > Sneakers e Scarpe Sportive",
            description: "Taglie disponibili: 36_1_2 37_1_2 38 38_1_2 39 40 40_1_2 41 - Nike Sneakers Gamma Force Donna White Light Bone",
            discount_percentage: 0,
            has_image: 1,
            id: "683671548",
            image: "https://pics.trovaprezzi.it/it-300x300/683671548.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/nonsolosport.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "NonSoloSport",
            merchantId: "nonsolosport",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike Sneakers Donna Nike Gamma Force Bianco Beige",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=dmd6TFpvWFhrTVhEeUhzKzNMWFdIeWhObWY2S1RkQVNpU2sxblNQNFpLNjhIMlZJUk03RHNuZ0EwckZteGo2YzNYVFluV0V2RGJGcmFLanRHQjNGRW1sT1AwTkI5WlJlcEdYVHVpUHRsZGUxTldzdnRreU1zV1lHeG93UTUzZ1RhZWJVR1crVm83cjBpNXhBSFhLbzhLWlppTXRKMjRUY1V6WmlKdmZmcFFTaW9JTHo2Wk9tTGNUNVRwQVJxWEJWWEMwM0JCTjJoWFk1OE8rV3hOREx2TTFiWmZxVGxiUE1TT0hNNUQ0a3d2QTVSNHF2ZFMvcEpsYlFaUDM5T2dUbzNxOEI5YmdFVWd5WkxqSnVFcjRCekh1YS9YeWVnTE42Mm5zRTRqT2d2MEhIK25GZnk0YlI3WHlsK0VaOHlHbis3d1JJamFFY2lHVHA1clVBSzFTTkhZTTlWNGtBQ1lGSjlndTFvVFBpQTFrME5UQlA4K052RnFJS3pOZmFNdmE1b3Nna0ljMUJUQUU4YWdIN090V3Z4b2FJWXYvbFhGV2JWMTFCeFdML1Q2QT01&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: null,
            merchantToken: null,
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=Ly9zSzBJYmhyUmZ4Y3o2cU56VnV4UWRGRW1lVkU5Vk5ONnc2WGZieEpBWm9JOUdicko5RUxpemVNZnNpd25RVWh6aU5QRm8xU01CU0wxNGlwelJ5aUVmbVVVSHZwNzN5K2VoczYwSk1KeFdGQzI1UjBqdUNjdUNHZmpjRnRJUjBJVWg5K0xGaDRTYlU5VDNVekRsNDhRZkJxbmw0ejdUMkNTRzVnUDRRVXF3RitqbmM3K285bXdXZ3ZRK2RxTmNZSDg2ZGVTZjRsZ1ludkFnenRnME16L2NzUndZc0Z5QmluZjhQc0ZsQUN1Z0VkeHhBWFg2eG1rQXZFa0hrMXE3ZEFmWXdxbnAwY2FNQmdQVFd1ZDEwVS85QzB3OGNQU2d1RUpJc09VMFRGN0JJT2I1U1E2Y1NiZnlPSCs2MFg2Y0ZOVU05RmtYUnpNWnZpU1h1RnlibXQwREhpamFSSzQyRHFOSDE1U2x1WGRoQ2lBdXk0RGEyckN1ak1ma0xsQVBPUnFHOC9ULzQwQnFBajRxSjVoaExKd0pLanE5SjYyaGx4RUw0U3gvcVhvSGQ3aTJ0bzNOYXZxR2VBY21jVlNsWUMzbmRIUUV4b0YwPQ2&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Abbigliamento > Abbigliamento Sportivo",
            category_1: "Moda",
            category_2: "Abbigliamento > Abbigliamento Sportivo",
            description: "Taglie disponibili: L M S XL - Nike Maglia da Calcio Replica Inter 2024/25 Stadium Home Uomo Lyon Blue",
            discount_percentage: 0,
            has_image: 1,
            id: "693808880",
            image: "https://pics.trovaprezzi.it/it-300x300/693808880.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/nonsolosport.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "NonSoloSport",
            merchantId: "nonsolosport",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike Maglia da Calcio Replica Uomo Nike Inter 2024/25 Stadium Home Blu",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=Ly9zSzBJYmhyUmZ4Y3o2cU56VnV4UWRGRW1lVkU5Vk5ONnc2WGZieEpBWm9JOUdicko5RUxpemVNZnNpd25RVWh6aU5QRm8xU01CU0wxNGlwelJ5aUVmbVVVSHZwNzN5K2VoczYwSk1KeFdGQzI1UjBqdUNjdUNHZmpjRnRJUjBJVWg5K0xGaDRTYlU5VDNVekRsNDhRZkJxbmw0ejdUMkNTRzVnUDRRVXF3RitqbmM3K285bXdXZ3ZRK2RxTmNZSDg2ZGVTZjRsZ1ludkFnenRnME16L2NzUndZc0Z5QmluZjhQc0ZsQUN1Z0VkeHhBWFg2eG1rQXZFa0hrMXE3ZEFmWXdxbnAwY2FNQmdQVFd1ZDEwVS85QzB3OGNQU2d1RUpJc09VMFRGN0JJT2I1U1E2Y1NiZnlPSCs2MFg2Y0ZOVU05RmtYUnpNWnZpU1h1RnlibXQwREhpamFSSzQyRHFOSDE1U2x1WGRoQ2lBdXk0RGEyckN1ak1ma0xsQVBPUnFHOC9ULzQwQnFBajRxSjVoaExKd0pLanE5SjYyaGx4RUw0U3gvcVhvSGQ3aTJ0bzNOYXZxR2VBY21jVlNsWUMzbmRIUUV4b0YwPQ2&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: null,
            merchantToken: null,
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=WkxFdm93d3Y2VWJCd0hSMFZHVmt5RVJsYlM0TVJKRE84MzFWSFp4alBQL1g0T3l1bWh6TkZzdnNXSzJUd3ZybXhKUmt5WEVlVlBGSnp6dWpaeTZuOWtpV25yOUFPMzhWcS9VSjZGd1BHU1pFTWpQMWx6eHNsTXJFRFU3Rk1Xc0tMa0lyaE81RHJNS0NEaEprR0F2TWYyNW12UWdkdkMrU3lTclpZRWtTQlFoajlvS1dCQ0xCMzE0L1hwbWlwVWhCQ1UvOEZITERSL0UySGVNRlZ0eDJBc1dveXpYR0crZFdSZ1ZCTkJkalpwNHcvYi9EV283MGtPZjVxbzcya0pvT29VWWgrNEdMcTB6YlZQYUt3RTdqM1FqTU9LMjZXVkpoeG03TlFlcHdQL1dvUTJ3KzJBb3MwSldDWHA4UFU5cUtSK2Ezb3RHUnBGd2o4T0NjamowV0hJQ2oyTitCOFlDeWhOb0dkYWFwS2ZUa3YrTzJ1Rjc3MG85N2lXdDVmOE5mSTBkZFhZYXFkcFY2eW9mNVhpOVNxZGhvaFFZTnBUaEQ1&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Abbigliamento > Abbigliamento Sportivo",
            category_1: "Moda",
            category_2: "Abbigliamento > Abbigliamento Sportivo",
            description: "Taglie disponibili: L M S XS - Pantaloni Donna Nike Sportswear Tech Fleece Dark Grey Heather Black",
            discount_percentage: 0,
            has_image: 1,
            id: "632179300",
            image: "https://pics.trovaprezzi.it/it-300x300/632179300.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/nonsolosport.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "NonSoloSport",
            merchantId: "nonsolosport",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike Pantaloni Sportswear Tech Fleece Donna Grigio",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=WkxFdm93d3Y2VWJCd0hSMFZHVmt5RVJsYlM0TVJKRE84MzFWSFp4alBQL1g0T3l1bWh6TkZzdnNXSzJUd3ZybXhKUmt5WEVlVlBGSnp6dWpaeTZuOWtpV25yOUFPMzhWcS9VSjZGd1BHU1pFTWpQMWx6eHNsTXJFRFU3Rk1Xc0tMa0lyaE81RHJNS0NEaEprR0F2TWYyNW12UWdkdkMrU3lTclpZRWtTQlFoajlvS1dCQ0xCMzE0L1hwbWlwVWhCQ1UvOEZITERSL0UySGVNRlZ0eDJBc1dveXpYR0crZFdSZ1ZCTkJkalpwNHcvYi9EV283MGtPZjVxbzcya0pvT29VWWgrNEdMcTB6YlZQYUt3RTdqM1FqTU9LMjZXVkpoeG03TlFlcHdQL1dvUTJ3KzJBb3MwSldDWHA4UFU5cUtSK2Ezb3RHUnBGd2o4T0NjamowV0hJQ2oyTitCOFlDeWhOb0dkYWFwS2ZUa3YrTzJ1Rjc3MG85N2lXdDVmOE5mSTBkZFhZYXFkcFY2eW9mNVhpOVNxZGhvaFFZTnBUaEQ1&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: null,
            merchantToken: null,
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=Ly9zSzBJYmhyUmRoYzBOU2Q3NXBrckNjM3E2ODdIUzB5VGVTa3dadUV0MHRLbmFtZHRtQWRQYmwxZy9rNWpTUFBBMlphT0NqUzIxT2h1cTE5UVVqWE9RZ1VoM2cyaCswekpRd3ZXN1RCMmlHYm11WFROdk96TERRZzZrS1UyY1VoVHQxSTQ5OVBoWWRjQXRsMk50dUMzS2pNVVRTT0FuSm9jTkR0ODRtL3VXbStJbERJbHVRb0RUUUk4T2Y3QWdXYXNCdTl5cUtFUkY2bFV6VW0xVU1yOG5UeU1XSGtKOEx5WGVuR3B1QjVvVHpnb0kvbGhuWEp1a2RsOHJBclc2MWJtNFc1Qnk0am1iclBSblRsRkJ4cHhjUVZZcUlCNk9neTJYdnV3Y2NqS2RYL1ZGWThqVXM0eFpyM1ZvT29pUTBGL0tHRWd4MXpOZDF2R3dQdVpvMGZEMjJva3MwdEVrR013V1V2S0JaMWszUWowd3F4NXE2WUdIUkJORStQdWg1bSszbHpab0VvNThoTHBxRnUvTFovS2cyZnUvaWFxd3BLdXlCQmYzc3RTbz01&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Scarpe > Sneakers e Scarpe Sportive",
            category_1: "Moda",
            category_2: "Scarpe > Sneakers e Scarpe Sportive",
            description: "Nike Air Max Dawn (GS), Sneaker, Multicolore, 38.5 EU Scarpe sportive Air classico per uno stile quiotidiano Unità Max Air sotto il tallone e morbida schiuma sotto il piede per ammortizzazione e leggerezza.",
            discount_percentage: 0,
            has_image: 1,
            id: "696929987",
            image: "https://pics.trovaprezzi.it/it-300x300/696929987.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/amazonitshoes.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "Amazon",
            merchantId: "amazonitshoes",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike Air Max Dawn (GS), Sneaker, Multicolore, 38.5 EU",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxUkYzUVdJNm5vaTFmRTNiaHA1Z2MzNHVib0VPMldtNEJnPT01&offer=Ly9zSzBJYmhyUmRoYzBOU2Q3NXBrckNjM3E2ODdIUzB5VGVTa3dadUV0MHRLbmFtZHRtQWRQYmwxZy9rNWpTUFBBMlphT0NqUzIxT2h1cTE5UVVqWE9RZ1VoM2cyaCswekpRd3ZXN1RCMmlHYm11WFROdk96TERRZzZrS1UyY1VoVHQxSTQ5OVBoWWRjQXRsMk50dUMzS2pNVVRTT0FuSm9jTkR0ODRtL3VXbStJbERJbHVRb0RUUUk4T2Y3QWdXYXNCdTl5cUtFUkY2bFV6VW0xVU1yOG5UeU1XSGtKOEx5WGVuR3B1QjVvVHpnb0kvbGhuWEp1a2RsOHJBclc2MWJtNFc1Qnk0am1iclBSblRsRkJ4cHhjUVZZcUlCNk9neTJYdnV3Y2NqS2RYL1ZGWThqVXM0eFpyM1ZvT29pUTBGL0tHRWd4MXpOZDF2R3dQdVpvMGZEMjJva3MwdEVrR013V1V2S0JaMWszUWowd3F4NXE2WUdIUkJORStQdWg1bSszbHpab0VvNThoTHBxRnUvTFovS2cyZnUvaWFxd3BLdXlCQmYzc3RTbz01&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: true,
            merchantToken: "6LKTPJ9RN",
          ),
        ),
      ],
    ),
  ];

  List<SPGroupedHits> page2 = [
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=WkxFdm93d3Y2VVpuWVphem9zY3VSeXNrWkpWKzJnYUZaT0lXUEtIbmo4Y3FDVk9zYWhtb3NhNWxoMWJVaTRxQXlVY3NCWmtxM1FYNVhPb2xSeW5DQ3p0RC9PbENzVmhtSnR5WTlpejA4MXlmdGFMcXVMc1BQaWNENGx5TzA1U0JFb1ZzRmFTL05jL1Y4M2x4b0J1UTBtenZ4TmxKZ0ovVjJ0NFV6SGFrOVVPQXJPTklXMVFVdG5PWU1YSERWK25wdUlmRHlnSEE0TjhxaXZha1gwVkhIb1hQNzV3NmdRRkYreHFjOVUrT1RteGNQLzFMVE5MbXR2VGVPclg2dUZIZ1B5U2c3UnJsZVBlbUFIS1lOenZKbmw0UXVRMEZ1NlZuUlBnVjcvcWpxRS9QWjM5SXNremNXWXdtUllhY1NTMUVHclpjZVlzOUFISlZDSXZCalVjb3ZGcW5ZT2hMMnJYRmhJK2N3cmlyZDNySXBmdVpSWlJSRmt0U0JONnk4NVZzMTV1dWdjbnBKMlArN3RoTVdDRk5Bd2crQU9qLzRsbks1&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Abbigliamento > Abbigliamento Sportivo",
            category_1: "Moda",
            category_2: "Abbigliamento > Abbigliamento Sportivo",
            description: "Taglie disponibili: M S XS - Nike Pantalone Sportswear Tech Fleece Donna White",
            discount_percentage: 0,
            has_image: 1,
            id: "632179765",
            image: "https://pics.trovaprezzi.it/it-300x300/632179765.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/nonsolosport.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "NonSoloSport",
            merchantId: "nonsolosport",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike Pantalone Donna Nike Sportswear Tech Fleece Bianco",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=WkxFdm93d3Y2VVpuWVphem9zY3VSeXNrWkpWKzJnYUZaT0lXUEtIbmo4Y3FDVk9zYWhtb3NhNWxoMWJVaTRxQXlVY3NCWmtxM1FYNVhPb2xSeW5DQ3p0RC9PbENzVmhtSnR5WTlpejA4MXlmdGFMcXVMc1BQaWNENGx5TzA1U0JFb1ZzRmFTL05jL1Y4M2x4b0J1UTBtenZ4TmxKZ0ovVjJ0NFV6SGFrOVVPQXJPTklXMVFVdG5PWU1YSERWK25wdUlmRHlnSEE0TjhxaXZha1gwVkhIb1hQNzV3NmdRRkYreHFjOVUrT1RteGNQLzFMVE5MbXR2VGVPclg2dUZIZ1B5U2c3UnJsZVBlbUFIS1lOenZKbmw0UXVRMEZ1NlZuUlBnVjcvcWpxRS9QWjM5SXNremNXWXdtUllhY1NTMUVHclpjZVlzOUFISlZDSXZCalVjb3ZGcW5ZT2hMMnJYRmhJK2N3cmlyZDNySXBmdVpSWlJSRmt0U0JONnk4NVZzMTV1dWdjbnBKMlArN3RoTVdDRk5Bd2crQU9qLzRsbks1&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: null,
            merchantToken: null,
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=RnNQaWhnV3RvNlorVVhDeTFCY0djZlBJTEt3RVVxa2Q5bkVWZW44d1pzVFo2c1YvVG5GS2RNM2IrVHN0bzRiQUdDREpwWExFM0VqRTJCZUQ3Uk1HVlBHWk9iWGJCUjBpZTNxZTZTV285dStmV2g4OHMyQU1nREZjb3NtS1JJcnNjdzB2VWJudzRiZGtJdVNjYTY3YmVudFJ3T0ZtZ3p5aTdOZ2xHdTNmRnVwVCtBaVNsTVRqcGhhRW8yV0xoY204WWl5Wjl1a05VTXJUazBHc28raDFnSXJBY1ArNFBZeFpNZ3BQN2UzblBvUFovOXhUT3FGU282cG05cEY1UG1DazB1WCs4RzQrMnBVQi81SEpiY2ZTQ3I5VWpaVzE4QmluclhxU3AzTFphQ2hOVUtpTjdGcGk0MlZKVDdSdmgyT1I2Yi9JVkszZlNhcnptK1VtUU9YSjJQL0FaSlMxT21wWTZndzhxRVdyQ0NnOG1UNDBGekZWanZjV3NrV1dNcU1kRmQzOUFtNldTSU1KRVpaRnZraFJTYkh2anQ5NUM4ZWdNcmh3Y0NwVWkzLzlZU2haNFdVa3hsTitNQVRkREVzUmFpcEdjb2tldTdMN1RrdU1jODF5ZmdlaXJpN0tYT1JoVTNXc2t4NHFHL0U90&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Abbigliamento > Abbigliamento Sportivo",
            category_1: "Moda",
            category_2: "Abbigliamento > Abbigliamento Sportivo",
            description: "Nike Tuta da Uomo Sport Essentials Poly-Knit Nera Taglia L Cod DM6843-010 Marca: NIKE Tipo di prodotto: TUTA DA SPORT Taglia: L Colore: NeroBianco",
            discount_percentage: 0,
            has_image: 1,
            id: "609454595",
            image: "https://pics.trovaprezzi.it/it-300x300/609454595.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/amazonmpapparelnoprime.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "Amazon.it marketplace",
            merchantId: "amazonmpapparelnoprime",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike Tuta da Uomo Sport Essentials Poly-Knit Nera Taglia L Cod DM6843-010",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=RnNQaWhnV3RvNlorVVhDeTFCY0djZlBJTEt3RVVxa2Q5bkVWZW44d1pzVFo2c1YvVG5GS2RNM2IrVHN0bzRiQUdDREpwWExFM0VqRTJCZUQ3Uk1HVlBHWk9iWGJCUjBpZTNxZTZTV285dStmV2g4OHMyQU1nREZjb3NtS1JJcnNjdzB2VWJudzRiZGtJdVNjYTY3YmVudFJ3T0ZtZ3p5aTdOZ2xHdTNmRnVwVCtBaVNsTVRqcGhhRW8yV0xoY204WWl5Wjl1a05VTXJUazBHc28raDFnSXJBY1ArNFBZeFpNZ3BQN2UzblBvUFovOXhUT3FGU282cG05cEY1UG1DazB1WCs4RzQrMnBVQi81SEpiY2ZTQ3I5VWpaVzE4QmluclhxU3AzTFphQ2hOVUtpTjdGcGk0MlZKVDdSdmgyT1I2Yi9JVkszZlNhcnptK1VtUU9YSjJQL0FaSlMxT21wWTZndzhxRVdyQ0NnOG1UNDBGekZWanZjV3NrV1dNcU1kRmQzOUFtNldTSU1KRVpaRnZraFJTYkh2anQ5NUM4ZWdNcmh3Y0NwVWkzLzlZU2haNFdVa3hsTitNQVRkREVzUmFpcEdjb2tldTdMN1RrdU1jODF5ZmdlaXJpN0tYT1JoVTNXc2t4NHFHL0U90&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: null,
            merchantToken: null,
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=cHlXcEQxTWlpNnlSWGNiK1I2RElMVUtaaHBUM29hSjczWHRCdERjTkNNbERHSE5ncDNidTlBV0lDSEFjUWdkU0VQa29MdG14UDVrTHZ3N0krWEl1WnNPWUtPckdqQzNRcmxVTjhDWlNQbmYxQlNTSlMrTWFwQnhEVFdFczVsL3N6MWJvbEZuSWxGRFFjWXphWmNuNlNuY3lPQ3g5cE44NDN4WnFNVXVtSTFYcW5URjFOMlU2VFJyNDhoVHQvYzNNcTFYcFk1Wk53QXFOM1pZMjc2ckxCbUpBVkJRNHVNZW9jb0ROZkxRbnRkcWNVUmRKZTdIbVc0MldUcVQ2UVh5aDhqUkFINHFCY0NGNUtiSXJmTkQyc3ZUNzFPSDV1aFliS1h4clFKT0g2bGV6OWx0Y1Y2eU56a1pWOHVDYXFXWEkwMXdJbUpWNzNYYWZvbkttMkNTdFE1ekpYaGVLdDlaNDFlSHl1cXZjVWFvSURKWHVwTGpjYTQxbnZYYkhtTGFwZ2dZb0JuckxTcmdFUE8vOUR1VW53M3d1d2hIamEwdjY1&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Abbigliamento > Abbigliamento Sportivo",
            category_1: "Moda",
            category_2: "Abbigliamento > Abbigliamento Sportivo",
            description: "Nike COL BLOCK PUFFER Piumino Nike COL BLOCK, Nero, 5-6 anni Tipo di prodotto: COAT Marca: Nike Colore: 023 Grigio Nero",
            discount_percentage: 0,
            has_image: 1,
            id: "742408039",
            image: "https://pics.trovaprezzi.it/it-300x300/742408039.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/amazonmpapparelnoprime.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "Amazon.it marketplace",
            merchantId: "amazonmpapparelnoprime",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike COL BLOCK PUFFER",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=cHlXcEQxTWlpNnlSWGNiK1I2RElMVUtaaHBUM29hSjczWHRCdERjTkNNbERHSE5ncDNidTlBV0lDSEFjUWdkU0VQa29MdG14UDVrTHZ3N0krWEl1WnNPWUtPckdqQzNRcmxVTjhDWlNQbmYxQlNTSlMrTWFwQnhEVFdFczVsL3N6MWJvbEZuSWxGRFFjWXphWmNuNlNuY3lPQ3g5cE44NDN4WnFNVXVtSTFYcW5URjFOMlU2VFJyNDhoVHQvYzNNcTFYcFk1Wk53QXFOM1pZMjc2ckxCbUpBVkJRNHVNZW9jb0ROZkxRbnRkcWNVUmRKZTdIbVc0MldUcVQ2UVh5aDhqUkFINHFCY0NGNUtiSXJmTkQyc3ZUNzFPSDV1aFliS1h4clFKT0g2bGV6OWx0Y1Y2eU56a1pWOHVDYXFXWEkwMXdJbUpWNzNYYWZvbkttMkNTdFE1ekpYaGVLdDlaNDFlSHl1cXZjVWFvSURKWHVwTGpjYTQxbnZYYkhtTGFwZ2dZb0JuckxTcmdFUE8vOUR1VW53M3d1d2hIamEwdjY1&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: null,
            merchantToken: null,
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=RnNQaWhnV3RvNmJndnh0blVLdjhwRFhPaGthcGljOXprQW1rY2xRYVFjTUJNQ3Y1WjN3cE9GS3F4dW9DWFhzY1RjSDFwbjlPaCtqVXJ4RTJCT204d3dhZGF5bEZNUVlsSTBuRW52K3R6cWhmUWlrbXBlR0cyNm5uNDJEa2xhaXhST3lsN3V6Yi9hUXFnN3ZBTlk3Qi95YXEwT0ZtM01iZUt5S09ZN2huZjhHTHhYSUhGcVRablBNUHVQY2pHazlIdG5ob0N6UkN2c2dObU9JQUtUa0tPeUVkWldiK2luOHcvNXp5ZDFkTjBQNE41SVNhQVdrQ1ZjVmNoRUVUWWU1WHVBcjlER0FtbWFRPQ2&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Scarpe > Sneakers e Scarpe Sportive",
            category_1: "Moda",
            category_2: "Scarpe > Sneakers e Scarpe Sportive",
            description: "Creata per il parquet, ma ideale per il tempo libero, riecco l'icona del basket degli anni Ottanta con strati esterni perfettamente lucidati e i colori University della prima edizione Con il classico design da basket, la Nike Dunk High ripropone lo stile",
            discount_percentage: 0,
            has_image: 1,
            id: "601404234",
            image: "https://pics.trovaprezzi.it/it-300x300/601404234.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/footland.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "Footland",
            merchantId: "footland",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "NIKE DUNK HIGH",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=RnNQaWhnV3RvNmJndnh0blVLdjhwRFhPaGthcGljOXprQW1rY2xRYVFjTUJNQ3Y1WjN3cE9GS3F4dW9DWFhzY1RjSDFwbjlPaCtqVXJ4RTJCT204d3dhZGF5bEZNUVlsSTBuRW52K3R6cWhmUWlrbXBlR0cyNm5uNDJEa2xhaXhST3lsN3V6Yi9hUXFnN3ZBTlk3Qi95YXEwT0ZtM01iZUt5S09ZN2huZjhHTHhYSUhGcVRablBNUHVQY2pHazlIdG5ob0N6UkN2c2dObU9JQUtUa0tPeUVkWldiK2luOHcvNXp5ZDFkTjBQNE41SVNhQVdrQ1ZjVmNoRUVUWWU1WHVBcjlER0FtbWFRPQ2&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: true,
            merchantToken: "6M3T0QS8I",
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=cHlXcEQxTWlpNnhGZFNVVnZVaDkwYmphalJGTkhMMXd6bWVtNERvWnJmTzZWaHRRU0RzbWgzRm9rUXUrcmxoTmJxS3QvZFVua29zRDR4ejZSd2tTUGZVUFB4TWc3MkJRUndKVEZQU1NDbElKaTFnbytFd291aFBNT1ZFK3VObkR6N3FrdVNFYTJnT2RhMGR5NGdnQVdYV3RvWjZManFBYUppSkloNERLQ3VCZGVyU3pBK1kxWlFITlZqb2drWGZXTzVyL1ByVUpRaktMKzd0cjFMRU0wTmhtYzg5Mnp5QWhsdkdrem1CNWEzZTUyNFUwZk51RG93TjA0OTA1NUd5NW1BVlBYckdWc0prODJMeTVWN2tsZ25QYnMvY0Z0VmF10&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Scarpe > Sneakers e Scarpe Sportive",
            category_1: "Moda",
            category_2: "Scarpe > Sneakers e Scarpe Sportive",
            description: "La leggenda continua a risplendere con l'originale da basket Nata dall'unione di comfort da parquet e stile per il tempo libero, questa scarpa aggiunge un tocco di novit&#224 a un modello molto noto con struttura anni Ottanta, dettagli d'impatto e stile",
            discount_percentage: 0,
            has_image: 1,
            id: "742939081",
            image: "https://pics.trovaprezzi.it/it-300x300/742939081.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/footland.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "Footland",
            merchantId: "footland",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "NIKE AIR FORCE 1 '07",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=cHlXcEQxTWlpNnhGZFNVVnZVaDkwYmphalJGTkhMMXd6bWVtNERvWnJmTzZWaHRRU0RzbWgzRm9rUXUrcmxoTmJxS3QvZFVua29zRDR4ejZSd2tTUGZVUFB4TWc3MkJRUndKVEZQU1NDbElKaTFnbytFd291aFBNT1ZFK3VObkR6N3FrdVNFYTJnT2RhMGR5NGdnQVdYV3RvWjZManFBYUppSkloNERLQ3VCZGVyU3pBK1kxWlFITlZqb2drWGZXTzVyL1ByVUpRaktMKzd0cjFMRU0wTmhtYzg5Mnp5QWhsdkdrem1CNWEzZTUyNFUwZk51RG93TjA0OTA1NUd5NW1BVlBYckdWc0prODJMeTVWN2tsZ25QYnMvY0Z0VmF10&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: true,
            merchantToken: "6M3T0QS8I",
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=WkxFdm93d3Y2VVlRVEN3b3VzSWlnMEgzL0ZTck5aYXBWd1AvMjBHT2p4a2o4ZXljNEVmNTdjZU5rR0Z4b3JidnN0cjRCckxjUk9PeXhXdEZVTUU2ZS9SWjVjajU5YjAzODEzbjJKeitQUTR2bnJzU0svdG5nUURnbW8rRlR5L0tDbGt1L0pHbjJCb2JCZndKOHhaQk8zN1RBbWFwQkZQSXA4TjZNdnIrRXlQMURTYldPcThBY0kwd2xVR0l1ZERBbUhMZy9sRnhha0d3bTdPUTdCVFRML2QzUTJ5ZXZJc2lJcEQweWV0Wjd3RWxMMWpERXA4dG4ybEVKK0Z6a1FRSGNrVGVGVVhqUlBwRHRNMDRqc291SEJJRnlOYXNQNUpXVDZ0V1JzM3pKaXRWOWNBWWdmQ2puWi9sb3h6MmNWT0FQdnhhNmhndkNSZWwxNGtzTmU2WThGNUFpRVpuUkkrL21mV0xmZmFxcnlLNXM4eE5kOGdOcm92bkUrb1orYWRKbFczbkkyS1NGMGp3YWlaaDJFQkJ1SXBwbU9ONlAwekl0UTBvamdtVDY2d0JoMkN2UGZNQnVNci82cEZqd2p5NW96VDFQZEQ4ckNmNjlZZGdidkxISVpJYzQxRENOU2xr0&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Scarpe > Sneakers e Scarpe Sportive",
            category_1: "Moda",
            category_2: "Scarpe > Sneakers e Scarpe Sportive",
            description: "Nike Air Max Bella Tr 5, Scarpe da Ginnastica Donna, Nero (Black/White-Dk Smoke Grey), 39 EU L'intersuola in schiuma e l'unità Max Air nel tallone portano stabilità e ammortizzazione ad alte prestazioni ad ogni passo Il supporto e il contenimento",
            discount_percentage: 0,
            has_image: 1,
            id: "635132228",
            image: "https://pics.trovaprezzi.it/it-300x300/635132228.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/amazonitshoes.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "Amazon",
            merchantId: "amazonitshoes",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike Air Max Bella Tr 5, Scarpe da Ginnastica Donna, Nero (Black/White-Dk Smoke Grey), 39 EU",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=WkxFdm93d3Y2VVlRVEN3b3VzSWlnMEgzL0ZTck5aYXBWd1AvMjBHT2p4a2o4ZXljNEVmNTdjZU5rR0Z4b3JidnN0cjRCckxjUk9PeXhXdEZVTUU2ZS9SWjVjajU5YjAzODEzbjJKeitQUTR2bnJzU0svdG5nUURnbW8rRlR5L0tDbGt1L0pHbjJCb2JCZndKOHhaQk8zN1RBbWFwQkZQSXA4TjZNdnIrRXlQMURTYldPcThBY0kwd2xVR0l1ZERBbUhMZy9sRnhha0d3bTdPUTdCVFRML2QzUTJ5ZXZJc2lJcEQweWV0Wjd3RWxMMWpERXA4dG4ybEVKK0Z6a1FRSGNrVGVGVVhqUlBwRHRNMDRqc291SEJJRnlOYXNQNUpXVDZ0V1JzM3pKaXRWOWNBWWdmQ2puWi9sb3h6MmNWT0FQdnhhNmhndkNSZWwxNGtzTmU2WThGNUFpRVpuUkkrL21mV0xmZmFxcnlLNXM4eE5kOGdOcm92bkUrb1orYWRKbFczbkkyS1NGMGp3YWlaaDJFQkJ1SXBwbU9ONlAwekl0UTBvamdtVDY2d0JoMkN2UGZNQnVNci82cEZqd2p5NW96VDFQZEQ4ckNmNjlZZGdidkxISVpJYzQxRENOU2xr0&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: true,
            merchantToken: "6LKTPJ9RN",
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=cHlXcEQxTWlpNnp5VlBodngwZlZlbE1XRlNFd1QyLy9FbThwRXh0REN1T2h0bmhKRjRoVERLYnJxdmoxSC9rbnM5aDZaWjVCL2ZvOWRBOXpTd1hxMjlEV3cxK1FuTCszL2hrK2NvRXlkV3o5ZDE0YUNGMEZYbTFOc0dmVlhwTlZPbFBQODk0TE9lZkJuV3Bxc09scDc5MkNTOUtra3M2ZWw1NndCcGh4M2dhZU54M2JZZ0c1ZlkrMWY5cExNellsTjRtK2lnQURSbjUyVlZDbGhKM0ZIVHNKRDBSK2k5Tk9HUXRrcFhncUYwbGp0MWVQcDBLdElPQ1Q5aUVhakRtOFNmMTVuUVdYNEdiZzJOYXpMdURpNGNXNWVyb3NwaVNxL3RScHBneFpqcUdMSHJmeXVxeTYwZlM5WFdxY2xvUTBTMEE2TUFyeEJTMUY0MlpFVzZHMFBad09LL05UMnk2YkJZN09TMkdvZjRDR0YwUmU1RlQrVnpKN3lOL1R6VEVNZ0VOaG0rL3REMDNVektQUFpKa1Rma0pEaElpUlBRS1lFMStZb2ZxdklQQit1N1F3YWt3eURaNUpEdm5uRlFjY1daZkZaZDhuWVJOcnJHaDk0Z0RLNGszV0NZRWtqbkJJ0&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Abbigliamento > Abbigliamento Sportivo",
            category_1: "Moda",
            category_2: "Abbigliamento > Abbigliamento Sportivo",
            description: "Nike M Nk Wvn LND WR HD Jkt Hip Length Hooded, Sail/Black/Sail, XL Uomo Giacca con cappuccio da uomo Vestibilità standard per una vestibilità rilassata e semplice Occhielli in gomma Nike Grind 100% poliestere",
            discount_percentage: 0,
            has_image: 1,
            id: "747301337",
            image: "https://pics.trovaprezzi.it/it-300x300/747301337.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/amazonmpapparelnoprime.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "Amazon.it marketplace",
            merchantId: "amazonmpapparelnoprime",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Nike M Nk Wvn LND WR HD Jkt Hip Length Hooded, Sail/Black/Sail, XL Uomo",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=cHlXcEQxTWlpNnp5VlBodngwZlZlbE1XRlNFd1QyLy9FbThwRXh0REN1T2h0bmhKRjRoVERLYnJxdmoxSC9rbnM5aDZaWjVCL2ZvOWRBOXpTd1hxMjlEV3cxK1FuTCszL2hrK2NvRXlkV3o5ZDE0YUNGMEZYbTFOc0dmVlhwTlZPbFBQODk0TE9lZkJuV3Bxc09scDc5MkNTOUtra3M2ZWw1NndCcGh4M2dhZU54M2JZZ0c1ZlkrMWY5cExNellsTjRtK2lnQURSbjUyVlZDbGhKM0ZIVHNKRDBSK2k5Tk9HUXRrcFhncUYwbGp0MWVQcDBLdElPQ1Q5aUVhakRtOFNmMTVuUVdYNEdiZzJOYXpMdURpNGNXNWVyb3NwaVNxL3RScHBneFpqcUdMSHJmeXVxeTYwZlM5WFdxY2xvUTBTMEE2TUFyeEJTMUY0MlpFVzZHMFBad09LL05UMnk2YkJZN09TMkdvZjRDR0YwUmU1RlQrVnpKN3lOL1R6VEVNZ0VOaG0rL3REMDNVektQUFpKa1Rma0pEaElpUlBRS1lFMStZb2ZxdklQQit1N1F3YWt3eURaNUpEdm5uRlFjY1daZkZaZDhuWVJOcnJHaDk0Z0RLNGszV0NZRWtqbkJJ0&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: null,
            merchantToken: null,
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=S282bTBVY1U2bVg5a0Nsb1JyaE0vdko4eEFFaXVCUW1TeGwyd3kxc04rbHFaR3p4U0RMK3dxR2ZjcHhLcnE1aEh4QzM2ak5USGNpOUdCSXBBbktwSm9mT1lJNmtWRXFXY3VNWWQ1dEJPOEsxVmJFMTE4MWRPc0dhd3dlVTdpZWM1WHFaamxWVnR4WDI4ZVlHd3VjTXc4MGZ3anlNYXc2OTZwNlRRNENyMnRHU08waElFbVozUFZva2cvSTdPd1RWYjFRZzRFNmJGcjZoSEQ4SnJ4VEVFSmg0UVRrbHp4WHo4QnVWYTdqRmdvZkhCSUNEb1lHS0kvRFIrZG0weXk4UVRLMmVXS0lRL2xmZE1jYlM0cS93MnA5aFNvT0JOTzN0SGczekJReHAzQXVuek9URTV5aU51Rldqbk1VTDFiNTZEUmFYT3ZRZHVvaTM4OGgrL0NTVlVaT3ZqU0RkalFoSndyNEd2VFVBeUdnWERqNzNQU2RROW1GeUFPaUo1RWlBdkJjajdYOWJ1VVlwY2R0QldobmdLUT090&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "",
            brandId: "",
            category: "Casa e Giardino > Casa > Articoli per la Casa Fatti a mano",
            category_1: "Casa e Giardino",
            category_2: "Casa > Articoli per la Casa Fatti a mano",
            description: "Nike Nike",
            discount_percentage: 0,
            has_image: 1,
            id: "476744798",
            image: "https://pics.trovaprezzi.it/it-300x300/476744798.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/amazonmpguildnoprime.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100,
            merchant: "Amazon.it marketplace",
            merchantId: "amazonmpguildnoprime",
            new_offer: false,
            selling_price: 100,
            tags: [],
            title: "Generic Nike",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=S282bTBVY1U2bVg5a0Nsb1JyaE0vdko4eEFFaXVCUW1TeGwyd3kxc04rbHFaR3p4U0RMK3dxR2ZjcHhLcnE1aEh4QzM2ak5USGNpOUdCSXBBbktwSm9mT1lJNmtWRXFXY3VNWWQ1dEJPOEsxVmJFMTE4MWRPc0dhd3dlVTdpZWM1WHFaamxWVnR4WDI4ZVlHd3VjTXc4MGZ3anlNYXc2OTZwNlRRNENyMnRHU08waElFbVozUFZva2cvSTdPd1RWYjFRZzRFNmJGcjZoSEQ4SnJ4VEVFSmg0UVRrbHp4WHo4QnVWYTdqRmdvZkhCSUNEb1lHS0kvRFIrZG0weXk4UVRLMmVXS0lRL2xmZE1jYlM0cS93MnA5aFNvT0JOTzN0SGczekJReHAzQXVuek9URTV5aU51Rldqbk1VTDFiNTZEUmFYT3ZRZHVvaTM4OGgrL0NTVlVaT3ZqU0RkalFoSndyNEd2VFVBeUdnWERqNzNQU2RROW1GeUFPaUo1RWlBdkJjajdYOWJ1VVlwY2R0QldobmdLUT090&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: null,
            merchantToken: null,
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=Y0dDVGd4TS9reURGcXdZbTZOU1A0WDIvTVUzOXY2ekNHejlGVWxjNExlUXNSM1padERWbS83N0hLR1NsNjB0VjBMdUd4RzdJWkd1NkNHUWUvNE52MXNPSFBkU1ZBVkNmV1JiVDg4Q3g2a1lOTTFFWlFka2ZpcVF3Q2YrSGNSeVk1alBTMG53TGQzdXhqQU51Y2Fwa2lxYjJWQmkvR2QrcFIrb3RrNi9CR2Y3RnhnUisydjIzNGQ3Zm9FTi9oUXVXeG8wRWNMRVZuN3RoeFIySE1SUXd5MS9tNEZqZUpYLzBONVJRQ1RUTFlvWHpHYUpjQmhKR1EyOG4rVmhGb3RRcE1id3FDTGFFY0ZpWVAydGxBZWdMNkc0c3JIQkJKempJL3RLQjZJVWs1UXZ4anZoTTBIbHM5SzhZS0dwUlJ1MG12Mm93d00vRWVZTG9VL3ZwempRbkxvVldiczREb2NXUFh0MmduS1RjOWsyYStEY3k1ODI3K2dwM2xxMFVJVFdvUW15MGtSS0RadmY5Y2hydVFOdW5OYzZ6L25USXR1cHRxZ0FIcm5Fb0UxNEQwUjBZdnJtMkE3cmYzV0ZGYW1oazR5N2tnNE9Ea0lSTFZGQ1Z1bWk1eGQ4UkdQZTlEL1FG0&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Scarpe > Sneakers e Scarpe Sportive",
            category_1: "Moda",
            category_2: "Scarpe > Sneakers e Scarpe Sportive",
            description: "Nike Damen Zoom Span 2, Scarpe Running Donna, Grigio (Light Carbon/Dark Raisin-Aurora), 37.5 EU Nike Damen Zoom Span 2, Scarpe Running Donna, Grigio (Light Carbon/Dark Raisin-Aurora), 37.5 EU",
            discount_percentage: 0,
            has_image: 1,
            id: "629180413",
            image: "https://pics.trovaprezzi.it/it-300x300/629180413.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/amazonitshoes.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100.14,
            merchant: "Amazon",
            merchantId: "amazonitshoes",
            new_offer: false,
            selling_price: 100.14,
            tags: [],
            title: "Nike Damen Zoom Span 2, Scarpe Running Donna, Grigio (Light Carbon/Dark Raisin-Aurora), 37.5 EU",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=Y0dDVGd4TS9reURGcXdZbTZOU1A0WDIvTVUzOXY2ekNHejlGVWxjNExlUXNSM1padERWbS83N0hLR1NsNjB0VjBMdUd4RzdJWkd1NkNHUWUvNE52MXNPSFBkU1ZBVkNmV1JiVDg4Q3g2a1lOTTFFWlFka2ZpcVF3Q2YrSGNSeVk1alBTMG53TGQzdXhqQU51Y2Fwa2lxYjJWQmkvR2QrcFIrb3RrNi9CR2Y3RnhnUisydjIzNGQ3Zm9FTi9oUXVXeG8wRWNMRVZuN3RoeFIySE1SUXd5MS9tNEZqZUpYLzBONVJRQ1RUTFlvWHpHYUpjQmhKR1EyOG4rVmhGb3RRcE1id3FDTGFFY0ZpWVAydGxBZWdMNkc0c3JIQkJKempJL3RLQjZJVWs1UXZ4anZoTTBIbHM5SzhZS0dwUlJ1MG12Mm93d00vRWVZTG9VL3ZwempRbkxvVldiczREb2NXUFh0MmduS1RjOWsyYStEY3k1ODI3K2dwM2xxMFVJVFdvUW15MGtSS0RadmY5Y2hydVFOdW5OYzZ6L25USXR1cHRxZ0FIcm5Fb0UxNEQwUjBZdnJtMkE3cmYzV0ZGYW1oazR5N2tnNE9Ea0lSTFZGQ1Z1bWk1eGQ4UkdQZTlEL1FG0&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: true,
            merchantToken: "6LKTPJ9RN",
          ),
        ),
      ],
    ),
    SPGroupedHits(
      hits: [
        SPHits(
          document: SPDocument(
            affiliate_url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=S2Fkc2c4aTFXdTAxRFdQQlBTYURFL095WHZlN2MxaS9lWGhFWDVKZndDRU40Qk1xeGlmMjY4aXdrVXVsSXR6Mm55cXNIL2pGMU9yak81b1Y3YytTZlljeUhlamlya1czcGlad3NubWZwbzkzcEgrRS90Z3o4UEw2QzBCLzQ2dk9na1NRVG5Kd0dXdFMweHFpallndjh3ZUtCazJXK1FheXJUb1NhN2VOZzFaRDE5TjBiWWxiOWdtUG45dFpobi9GTS9VOGU2NUpvVkVxOHU5eG9NZDJ2cUtaa3FXSmdleFUyR2s5WWNEY0MwODlQT3NxcUJvVEpnV3BDNUxYQ2RtTlEwc1d2cUxsd1cySVhzdGp1ZnU2U3ptSXY2UjNITkVDQk11UU5nVkdSVWNQQlFmcE1PN1ZndVoyMlhYV3NqODByZXkrWWF6bmNKTko3SVByV2twV0JERktRejBxVTJLWlFtKytlSzd6cFA0MGJpOEszc1cwNURjb2M3b3Q4UzVQWTRDQUtNKy8rSENBcFVEaEJ2MGxHRDNWQSs4Y0JzWVJ1UXN6T1RJQXRkNXVKUExWUGZqOGt3PT01&sid=&utm_medium=referral&utm_source=scalapayappit",
            brand: "Nike",
            brandId: "nike",
            category: "Moda > Abbigliamento > Abbigliamento Sportivo",
            category_1: "Moda",
            category_2: "Abbigliamento > Abbigliamento Sportivo",
            description: "Nike W Nk Shld Jkt HD Runway, Giacca Sportiva Donna, Black/Reflective Silv, S Taglio regolare Impermeabile e leggera Ripiegabile nella tasca centrale",
            discount_percentage: 0,
            has_image: 1,
            id: "728868079",
            image: "https://pics.trovaprezzi.it/it-300x300/728868079.jpg",
            image_merchant: "https://immagini.trovaprezzi.it/negozi/amazonitsport.png?tr=w-80,h-30,cm-pad_resize,bg-FFFFFF",
            list_price: 100.16,
            merchant: "Amazon",
            merchantId: "amazonitsport",
            new_offer: false,
            selling_price: 100.16,
            tags: [],
            title: "Nike W Nk Shld Jkt HD Runway, Giacca Sportiva Donna, Black/Reflective Silv, S",
            url: "https://www.trovaprezzi.it/splashsp?impression=Vzl6eFN4eHZRNFR6eHNPUVlyQmdxWnhhRGV6VW1aLzRuejk3MHRtSzdVeUhkdXNoanBSUVd3PT01&offer=S2Fkc2c4aTFXdTAxRFdQQlBTYURFL095WHZlN2MxaS9lWGhFWDVKZndDRU40Qk1xeGlmMjY4aXdrVXVsSXR6Mm55cXNIL2pGMU9yak81b1Y3YytTZlljeUhlamlya1czcGlad3NubWZwbzkzcEgrRS90Z3o4UEw2QzBCLzQ2dk9na1NRVG5Kd0dXdFMweHFpallndjh3ZUtCazJXK1FheXJUb1NhN2VOZzFaRDE5TjBiWWxiOWdtUG45dFpobi9GTS9VOGU2NUpvVkVxOHU5eG9NZDJ2cUtaa3FXSmdleFUyR2s5WWNEY0MwODlQT3NxcUJvVEpnV3BDNUxYQ2RtTlEwc1d2cUxsd1cySVhzdGp1ZnU2U3ptSXY2UjNITkVDQk11UU5nVkdSVWNQQlFmcE1PN1ZndVoyMlhYV3NqODByZXkrWWF6bmNKTko3SVByV2twV0JERktRejBxVTJLWlFtKytlSzd6cFA0MGJpOEszc1cwNURjb2M3b3Q4UzVQWTRDQUtNKy8rSENBcFVEaEJ2MGxHRDNWQSs4Y0JzWVJ1UXN6T1RJQXRkNXVKUExWUGZqOGt3PT01&sid=&utm_medium=referral&utm_source=scalapayappit",
            isMerchantCard: true,
            merchantToken: "6LKTPJ9RN",
          ),
        ),
      ],
    ),
  ];

  List<SPGroupedHits> fetchData(searchText, minPrice, maxPrice, orderType, pageSize, pageKey, pagingController) {
    switch (pageKey as int) {
      case 1:
        return page1;
      case 2:
        return page2;
    }
    return [];
  }
}

// Define the test widget
Future<Widget> SPHomePage(
  PagingController<int, SPGroupedHits> pagingController,
) async {
  return MaterialApp(
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
}
