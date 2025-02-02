import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:scalapay/bloc/sp_bloc.dart';
import 'package:scalapay/shared_widgets/sp_article.dart';
import 'package:scalapay/shared_widgets/sp_assets.dart';
import 'package:scalapay/shared_widgets/sp_filter_bottom_sheet.dart';
import 'package:scalapay/shared_widgets/sp_order_bottom_sheet.dart';
import 'package:scalapay/sp_colors.dart';

import 'injection.dart';

final GetIt getIt = GetIt.instance;

void main() {
  configureDependencies();
  runApp(
    BlocProvider(
      create: (_) => getIt<SpBloc>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.text = "Nike";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      backgroundColor: Colors.white,
      body: BlocBuilder<SpBloc, SpState>(
        builder: (context, state) {
          state.whenOrNull(
            initial: () {
              //todo
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
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
                  ),
                ),
                TextFormField(
                  focusNode: _focusNode,
                  controller: searchController,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    prefix: const SizedBox(width: 8),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: SPColors.mainPurple
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.search),
                          color: Colors.white,
                          onPressed: () {
                            BlocProvider.of<SpBloc>(context).add(
                              SpEvent.search(searchText: searchController.text),
                            );
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
                            applyFilters: (min, max) {
                              BlocProvider.of<SpBloc>(context).add(
                                SpEvent.filter(min: min, max: max),
                              );
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
                            applyOrderType: (type) {
                              BlocProvider.of<SpBloc>(context).add(
                                SpEvent.orderBy(orderType: type),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 376,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: SPArticle(
                          articleImage: SPAssets.shoe,
                          title: "Nike - Revolution 6 Next Nature Triple Balck",
                          store: "Pittarello",
                          price: 85.00,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
