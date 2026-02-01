import 'package:flutter/material.dart';
import 'package:news_app_t/model/artical.dart';

class Bnews extends StatelessWidget {
  const Bnews({super.key, required this.a});
  final Artical a;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: a.image != null
              ? Image.network(
                  a.image!, // Safe here because we just checked '!= null'
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  cacheHeight: 400,
                  cacheWidth: 800,
                )
              : Image.asset(
                  'assets/circle-stick-null-zero-260nw-1671885220.webp', // Your fallback image
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          a.title ?? 'nothing to show here',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          a.subTitle ?? 'nothing to show here',
          maxLines: 2,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
