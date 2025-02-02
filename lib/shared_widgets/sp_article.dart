import 'package:flutter/material.dart';
import 'package:scalapay/shared_widgets/sp_assets.dart';

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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              color: Color.fromARGB(255, 244, 245, 250),
            ),
            height: 195,
            child: Container(
              child: widget.articleImage,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                Text(
                  widget.store,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 4),
                Text(
                  "${widget.price}€ or",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "3 installments of\n€${(widget.price *100/3).round() / 100}",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
