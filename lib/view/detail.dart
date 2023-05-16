import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/model.dart';
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
      appBar: AppBar(
        title: Text(widget.item.doa!),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 12, left: 12, right: 12),
        child: Column(
          children: [
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.item.ayat!,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.item.artinya!,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
