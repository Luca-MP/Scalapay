import 'package:flutter/material.dart';
import 'package:scalapay/shared_widgets/sp_filter_text_field.dart';

class SpFilterBottomSheet extends StatefulWidget {
  final BuildContext context;
  final void Function(int min, int max) showResults;

  const SpFilterBottomSheet({
    super.key,
    required this.context,
    required this.showResults,
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
        height: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              height: 6,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              widthFactor: 8.5,
              child: IconButton(
                icon: const Icon(Icons.close_rounded),
                iconSize: 32,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Text(
              "Filtra",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            Column(
              children: [
                Container(
                  height: 140,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fascia di prezzo"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SPFilterTextField(
                            title: "Minimo",
                            minController: minController,
                            maxController: maxController,
                            isMin: true,
                          ),
                          Container(
                            height: 1,
                            width: 16,
                            color: Colors.grey,
                          ),
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
                        widget.showResults(-1, -1);
                        Navigator.pop(context);
                      },
                      child: Text("Cancella tutto"),
                    ),
                    FilledButton(
                      onPressed: () {
                        widget.showResults(
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
