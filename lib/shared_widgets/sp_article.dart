import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scalapay/sp_colors.dart';

class SPArticle extends StatefulWidget {
  final String? articleImage;
  final String? title;
  final String? store;
  final double? price;

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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: SPColors.whiteBottomSheet,
          ),
          height: 208,
          child: CachedNetworkImage(
            imageUrl: widget.articleImage ?? "",
            fit: BoxFit.fitWidth,
            errorWidget: (context, url, error) => const Center(
              child: Icon(
                Icons.error,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.store ?? "",
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: SPColors.merchant,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${widget.price?.toStringAsFixed(2)}€ or",
                style: const TextStyle(
                  fontSize: 13,
                  color: SPColors.sellingPrice,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "3 installments of\n€${(widget.price! / 3).toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 15,
                  color: SPColors.mainPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
