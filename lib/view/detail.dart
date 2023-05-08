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
      body: Padding(padding: EdgeInsets.all(16), 
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(widget.item.ayat!,
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 12),
          Text(widget.item.artinya!, textAlign: TextAlign.justify,),
        ],
      ),
      ),
    );
  }
}
