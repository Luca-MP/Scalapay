import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scalapay/shared_widgets/sp_article.dart';
import 'package:scalapay/shared_widgets/sp_assets.dart';
import 'package:scalapay/shared_widgets/sp_filter_bottom_sheet.dart';
import 'package:scalapay/shared_widgets/sp_order_bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 80, bottom: 10),
              child: const Text(
                "Esplora i prodotti",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
            ),
            TextFormField(
              focusNode: _focusNode,
              initialValue: "Nike",
              onChanged: (value) {},
              decoration: InputDecoration(
                  prefix: const SizedBox(width: 8),
                  suffixIcon: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color.fromARGB(255, 87, 100, 236),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.search),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      )),
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
                  )),
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
                    backgroundColor: Color.fromARGB(255, 246, 247, 251),
                    label: Text("Filtri"),
                    avatar: SPAssets.filter,
                    onSelected: (bool value) => showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => SpFilterBottomSheet(
                        context: context,
                        showResults: (min, max) {
                          print("Min: $min, Max: $max");
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
                    backgroundColor: Color.fromARGB(255, 246, 247, 251),
                    label: Text("Ordina"),
                    avatar: SPAssets.order,
                    onSelected: (_) => showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => SpOrderBottomSheet(
                        context: context,
                        orderType: (type) => print("Order typer: $type"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 349,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: SPArticle(articleImage: SPAssets.shoe, title: "Nike - Revolution 6 Next Nature Triple Balck", store: "Pittarello", price: 85.00),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
