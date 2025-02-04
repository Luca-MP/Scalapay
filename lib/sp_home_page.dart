import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:scalapay/bloc/sp_bloc.dart';
import 'package:scalapay/data/models/sp_grouped_hits/sp_grouped_hits.dart';
import 'package:scalapay/shared_widgets/sp_article.dart';
import 'package:scalapay/shared_widgets/sp_assets.dart';
import 'package:scalapay/shared_widgets/sp_filter_bottom_sheet.dart';
import 'package:scalapay/shared_widgets/sp_order_bottom_sheet.dart';
import 'package:scalapay/sp_colors.dart';

class SpHomePage extends StatefulWidget {
  const SpHomePage({super.key});

  @override
  State<SpHomePage> createState() => _SpHomePageState();
}

class _SpHomePageState extends State<SpHomePage> {
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();
  late OrderType _orderType;
  final PagingController<int, SPGroupedHits> _pagingController =
      PagingController(firstPageKey: 1);
  static const _pageSize = 10;

  @override
  void initState() {
    _searchController.text = "Nike";
    _minController.text = "500";
    _maxController.text = "2000";
    _orderType = OrderType.asc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: SPColors.mainPurple,
      backgroundColor: Colors.white,
      onRefresh: () async => _pagingController.refresh(),
      child: Scaffold(
        key: _formKey,
        backgroundColor: Colors.white,
        body: BlocBuilder<SpBloc, SpState>(
          builder: (context, state) {
            state.whenOrNull(
              searching: () {
                _pagingController.addPageRequestListener(
                  (pageKey) => BlocProvider.of<SpBloc>(context).add(
                    SpEvent.search(
                      searchText: _searchController.text,
                      minPrice: double.parse(_minController.text),
                      maxPrice: double.parse(_maxController.text),
                      orderType: _orderType,
                      pageSize: _pageSize,
                      pageKey: pageKey,
                      pagingController: _pagingController,
                    ),
                  ),
                );
              },
            );
            return SafeArea(
              minimum: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12, top: 80, bottom: 10),
                    child: Text(
                      "Esplora i prodotti",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
                    ),
                  ),
                  TextFormField(
                    focusNode: _focusNode,
                    controller: _searchController,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      prefix: const SizedBox(width: 8),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: SPColors.mainPurple),
                          child: IconButton(
                            icon: const Icon(Icons.search),
                            color: Colors.white,
                            onPressed: () {

                            },
                          ),
                        ),
                      ),
                      hintText: "Cerca prodotti",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    onTapOutside: (_) => _focusNode.unfocus(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FilterChip(
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          backgroundColor: SPColors.whiteChip,
                          label: const Text("Filtri"),
                          avatar: SPAssets.filter,
                          onSelected: (bool value) => showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => SpFilterBottomSheet(
                              context: context,
                              minController: _minController,
                              maxController: _maxController,
                              applyFilters: (min, max) {
                                _minController.text = min.toString();
                                _maxController.text = max.toString();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          backgroundColor: SPColors.whiteChip,
                          label: const Text("Ordina"),
                          avatar: SPAssets.order,
                          onSelected: (_) => showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => SpOrderBottomSheet(
                              context: context,
                              orderType: _orderType,
                              applyOrderType: (type) {
                                _orderType = type;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PagedGridView<int, SPGroupedHits>(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 376,
                      ),
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      shrinkWrap: true,
                      pagingController: _pagingController,
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
                        firstPageProgressIndicatorBuilder: (_) {
                          return Transform.translate(
                            offset: Offset(0, MediaQuery.of(context).size.width / 4.5),
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: SPColors.mainPurple,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          );
                        },
                        newPageProgressIndicatorBuilder: (_) {
                          return Transform.translate(
                            offset: Offset(MediaQuery.of(context).size.width / 4.5, 0),
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: SPColors.mainPurple,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          );
                        },
                        noItemsFoundIndicatorBuilder: (_) => Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.width / 2),
                            const Text("Nessun articolo trovato"),
                          ],
                        ),
                        newPageErrorIndicatorBuilder: (_) => Transform.translate(
                          offset: Offset(MediaQuery.of(context).size.width / 4.5, 0),
                          child: Center(
                            child: TextButton.icon(
                              icon: const Icon(Icons.refresh_rounded),
                              label: const Text("Riprova"),
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all(SPColors.mainPurple),
                              ),
                              onPressed: () => _pagingController.retryLastFailedRequest(),
                            ),
                          ),
                        ),
                        firstPageErrorIndicatorBuilder: (_) => Center(
                          child: TextButton.icon(
                            icon: const Icon(Icons.refresh_rounded),
                            label: const Text("Riprova"),
                            style: ButtonStyle(
                              foregroundColor: WidgetStateProperty.all(SPColors.mainPurple),
                            ),
                            onPressed: () => _pagingController.refresh(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pagingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
