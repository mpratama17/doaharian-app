import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailBaru extends StatelessWidget {
  const DetailBaru({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.cyan,
              ),
              Positioned(
                top: 50,
                left: 20,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.amber,
          ),
        ],
      ),
    ));
  }
}
