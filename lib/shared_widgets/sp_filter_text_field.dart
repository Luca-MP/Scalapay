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
  late int minValue;
  late int maxValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget.minController.text = '500';
    widget.maxController.text = '100';
    minValue = int.parse(widget.minController.text);
    maxValue = int.parse(widget.maxController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: 160,
      child: TextFormField(
        key: _formKey,
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
