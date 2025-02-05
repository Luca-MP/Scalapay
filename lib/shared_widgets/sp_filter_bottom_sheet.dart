import 'package:flutter/material.dart';
import 'package:scalapay/sp_colors.dart';

class SpFilterBottomSheet extends StatefulWidget {
  final BuildContext context;
  final TextEditingController minController;
  final TextEditingController maxController;
  final void Function(int min, int max) applyFilters;

  const SpFilterBottomSheet({
    super.key,
    required this.context,
    required this.minController,
    required this.maxController,
    required this.applyFilters,
  });

  @override
  State<SpFilterBottomSheet> createState() => _SpFilterBottomSheetState();
}

class _SpFilterBottomSheetState extends State<SpFilterBottomSheet> {
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

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
        height: 340,
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
              widthFactor: 8.3,
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
                fontSize: 16,
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
                      Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              width: 150,
                              child: TextFormField(
                                maxLength: 5,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                controller: widget.minController,
                                onChanged: (value) {
                                  if (value.isEmpty) return;
                                },
                                validator: _minMaxValidator,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(fontSize: 0),
                                  counterText: "",
                                  labelText: "Minimo",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                onTapOutside: (_) => _focusNode.unfocus(),
                              ),
                            ),
                            Container(height: 1, width: 16, color: Colors.grey),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              width: 150,
                              child: TextFormField(
                                focusNode: _focusNode,
                                maxLength: 5,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                controller: widget.maxController,
                                onChanged: (value) {
                                  if (value.isEmpty) return;
                                },
                                validator: _maxValidator,
                                decoration: InputDecoration(
                                  errorStyle: const TextStyle(fontSize: 0),
                                  counterText: "",
                                  labelText: "Massimo",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                onTapOutside: (_) => _focusNode.unfocus(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.transparent),
                        foregroundColor: WidgetStateProperty.all(SPColors.mainPurple),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancella tutto", style: TextStyle(letterSpacing: 1.25),),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 10),
                    FilledButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(SPColors.mainPurple)
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget.applyFilters(
                            int.tryParse(widget.minController.value.text) ?? -1,
                            int.tryParse(widget.maxController.value.text) ?? -1,
                          );
                          // added delay to show to the user the selection
                          Future.delayed(
                            const Duration(milliseconds: 100),
                            () => Navigator.pop(context),
                          );
                        }
                      },
                      child: Text("Mostra risultati", style: TextStyle(letterSpacing: 1.25),),
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

  String? _minMaxValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a value';
    }

    int? intValue = int.tryParse(value);
    if (intValue == null) {
      return 'Enter a valid integer';
    }

    if (intValue >= int.parse(widget.maxController.text)) {
      return 'Lower than maximum';
    }

    return null;
  }

  String? _maxValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a value';
    }

    int? intValue = int.tryParse(value);
    if (intValue == null) {
      return 'Enter a valid integer';
    }

    if (intValue <= int.parse(widget.minController.text)) {
      return 'Greater than minimum';
    }

    return null;
  }
}
