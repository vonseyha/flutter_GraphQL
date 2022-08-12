import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachNetworkHelper extends StatelessWidget {
  final String? url;
  const CachNetworkHelper({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url!,
      // height: 100,
      placeholder: (context, url) => SizedBox(
        child: Center(
            child: Center(
          child: Image.network('https://icon-library.com/images/spinner-icon-gif/spinner-icon-gif-3.jpg', width: 50),
        )),
      ),
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      errorWidget: (context, url, error) => const Icon(Icons.error_outline),
      fadeInCurve: Curves.easeIn,
    );
  }
}
