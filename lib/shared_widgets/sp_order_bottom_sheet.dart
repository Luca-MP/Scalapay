import 'package:flutter/material.dart';

class SpOrderBottomSheet extends StatefulWidget {
  final BuildContext context;
  final void Function(OrderType?) orderType;

  const SpOrderBottomSheet({
    super.key,
    required this.context,
    required this.orderType,
  });

  @override
  State<SpOrderBottomSheet> createState() => _SpOrderBottomSheetState();
}

class _SpOrderBottomSheetState extends State<SpOrderBottomSheet> {
  OrderType _orderType = OrderType.asc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero
          .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 420,
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
              "Ordina",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            Container(
              height: 290,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  RadioListTile<OrderType>(
                    title: Text("Prezzo crescente"),
                    onChanged: (OrderType? value) => orderType(context, value),
                    value: OrderType.asc,
                    groupValue: _orderType,
                  ),
                  Divider(indent: 16, endIndent: 16),
                  RadioListTile<OrderType>(
                    title: Text("Prezzo decrescente"),
                    onChanged: (OrderType? value) => orderType(context, value),
                    value: OrderType.desc,
                    groupValue: _orderType,
                  ),
                  Divider(indent: 16, endIndent: 16),
                  RadioListTile<OrderType>(
                    title: Text("Nome A - Z"),
                    onChanged: (OrderType? value) => orderType(context, value),
                    value: OrderType.az,
                    groupValue: _orderType,
                  ),
                  Divider(indent: 16, endIndent: 16),
                  RadioListTile<OrderType>(
                    title: Text("Nome Z - A"),
                    onChanged: (OrderType? value) => orderType(context, value),
                    value: OrderType.za,
                    groupValue: _orderType,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  orderType(BuildContext context, OrderType? orderType) {
    setState(() => _orderType = orderType!);
    widget.orderType(_orderType);

    // added delay to show to the user the selection
    Future.delayed(
      const Duration(milliseconds: 250),
      () => Navigator.pop(context),
    );
  }
}

enum OrderType { asc, desc, az, za }
