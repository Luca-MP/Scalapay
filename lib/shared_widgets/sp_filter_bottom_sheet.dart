import 'package:flutter/material.dart';
import 'package:scalapay/shared_widgets/sp_filter_text_field.dart';
import 'package:scalapay/sp_colors.dart';

class SpFilterBottomSheet extends StatefulWidget {
  final BuildContext context;
  final void Function(int min, int max) applyFilters;

  const SpFilterBottomSheet({
    super.key,
    required this.context,
    required this.applyFilters,
  });

  @override
  State<SpFilterBottomSheet> createState() => _SpFilterBottomSheetState();
}

class _SpFilterBottomSheetState extends State<SpFilterBottomSheet> {
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.zero.copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: SPColors.whiteBottomSheet,
        ),
        height: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              height: 6,
              width: 50,
              decoration: BoxDecoration(
                color: SPColors.greyDivider,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              widthFactor: 8.5,
              child: IconButton(
                icon: const Icon(Icons.close_rounded, color: Colors.black),
                iconSize: 32,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const Text(
              "Filtra",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Column(
              children: [
                Container(
                  height: 140,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Fascia di prezzo"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SPFilterTextField(
                            title: "Minimo",
                            minController: minController,
                            maxController: maxController,
                            isMin: true,
                          ),
                          Container(height: 1, width: 16, color: Colors.grey),
                          SPFilterTextField(
                            title: "Massimo",
                            minController: minController,
                            maxController: maxController,
                            isMin: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        widget.applyFilters(-1, -1);
                        Navigator.pop(context);
                      },
                      child: Text("Cancella tutto"),
                    ),
                    FilledButton(
                      onPressed: () {
                        widget.applyFilters(
                          int.tryParse(minController.value.text) ?? -1,
                          int.tryParse(maxController.value.text) ?? -1,
                        );
                        Navigator.pop(context);
                      },
                      child: Text("Mostra risultati"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
