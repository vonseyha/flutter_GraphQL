
import 'package:flutter/material.dart';

class ResueEmptyList extends StatelessWidget {
  final String? title;
  final double? size;
  const ResueEmptyList({
    Key? key,
    this.title,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://cdn.dribbble.com/users/888330/screenshots/2653750/empty_data_set.png',width: 220,height: 220,),
          Text(title!,style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
        ],
      ),
    );
  }
}
