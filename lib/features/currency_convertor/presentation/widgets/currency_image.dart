import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CurrencyImage extends StatelessWidget {
  final String code;
  const CurrencyImage({
    Key? key,
    required this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url =
        "https://flagcdn.com/w80/${code.substring(0, max(0, code.length - 1)).toLowerCase()}.jpg";
    debugPrint(url);
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => Container(
          width: 50,
          height: 30,
          color: Colors.grey,
        ).animate().shimmer(),
        errorWidget: (context, url, error) => Container(
          width: 50,
          height: 30,
          color: Colors.grey,
        ),
        width: 50,
        memCacheWidth: 50,
        height: 30,
        fit: BoxFit.fill,
      ),
    );
  }
}
