import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model.dart';
import '../repository.dart';

class Detail extends StatefulWidget {
  final Doa item;
  //constructor with doa parameter
  const Detail({super.key, required this.item});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text(widget.item.ayat!),
        Text(widget.item.artinya!),
      ],
    ));
  }
}
