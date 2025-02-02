import 'package:flutter/material.dart';
import 'package:scalapay/sp_colors.dart';

class SpOrderBottomSheet extends StatefulWidget {
  final BuildContext context;
  final void Function(OrderType?) applyOrderType;

  const SpOrderBottomSheet({
    super.key,
    required this.context,
    required this.applyOrderType,
  });

  @override
  State<SpOrderBottomSheet> createState() => _SpOrderBottomSheetState();
}

class _SpOrderBottomSheetState extends State<SpOrderBottomSheet> {
  OrderType _type = OrderType.asc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero
          .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: SPColors.whiteBottomSheet
        ),
        height: 420,
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
                icon: const Icon(Icons.close_rounded),
                iconSize: 32,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const Text(
              "Ordina",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Container(
              height: 290,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  RadioListTile(
                    title: const Text("Prezzo crescente"),
                    onChanged: (OrderType? value) => _orderType(context, value),
                    value: OrderType.asc,
                    groupValue: _type,
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  RadioListTile(
                    title: const Text("Prezzo decrescente"),
                    onChanged: (OrderType? value) => _orderType(context, value),
                    value: OrderType.desc,
                    groupValue: _type,
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  RadioListTile(
                    title: const Text("Nome A - Z"),
                    onChanged: (OrderType? value) => _orderType(context, value),
                    value: OrderType.az,
                    groupValue: _type,
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  RadioListTile(
                    title: const Text("Nome Z - A"),
                    onChanged: (OrderType? value) => _orderType(context, value),
                    value: OrderType.za,
                    groupValue: _type,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _orderType(BuildContext context, OrderType? orderType) {
    setState(() => _type = orderType!);
    widget.applyOrderType(_type);

    // added delay to show to the user the selection
    Future.delayed(
      const Duration(milliseconds: 250),
      () => Navigator.pop(context),
    );
  }
}

enum OrderType { asc, desc, az, za }
