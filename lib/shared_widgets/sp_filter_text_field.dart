import 'package:flutter/material.dart';

class SPFilterTextField extends StatefulWidget {
  final String title;
  final TextEditingController minController;
  final TextEditingController maxController;
  final bool isMin;

  const SPFilterTextField({
    super.key,
    required this.title,
    required this.minController,
    required this.maxController,
    required this.isMin,
  });

  @override
  State<SPFilterTextField> createState() => _SPFilterTextFieldState();
}

class _SPFilterTextFieldState extends State<SPFilterTextField> {
  final FocusNode _focusNode = FocusNode();
  int minValue = 500;
  int maxValue = 2000;

  @override
  void initState() {
    super.initState();
    widget.minController.text = minValue.toString();
    widget.maxController.text = maxValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: 160,
      child: TextFormField(
        focusNode: _focusNode,
        maxLength: 4,
        textInputAction: widget.isMin ? TextInputAction.next : TextInputAction.done,
        keyboardType: TextInputType.number,
        controller: widget.isMin ? widget.minController : widget.maxController,
        onChanged: (value) {
          if (widget.isMin) {
            minValue = int.parse(value);
          } else {
            maxValue = int.parse(value);
          }
        },
        decoration: InputDecoration(
          counterText: '',
          labelText: widget.title,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
        onTapOutside: (_) => _focusNode.unfocus(),
      ),
    );
  }
}
