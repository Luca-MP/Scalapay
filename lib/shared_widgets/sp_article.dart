import 'package:flutter/material.dart';
import 'package:scalapay/sp_colors.dart';

class SPArticle extends StatefulWidget {
  final Image articleImage;
  final String title;
  final String store;
  final double price;

  const SPArticle({
    super.key,
    required this.articleImage,
    required this.title,
    required this.store,
    required this.price,
  });

  @override
  State<SPArticle> createState() => _SPArticleState();
}

class _SPArticleState extends State<SPArticle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: SPColors.whiteBottomSheet,
            ),
            height: 195,
            child: Container(child: widget.articleImage),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                Text(
                  widget.store,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${widget.price}€ or",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "3 installments of\n€${(widget.price * 100 / 3).round() / 100}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
