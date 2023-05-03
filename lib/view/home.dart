import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tes/repository.dart';
import 'package:tes/view/user.dart';

import '../model/model.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Doa> listdoa = [];

  Repository repository = Repository();

  bool errorLogin = false;

  getData() async {
    listdoa = await repository.getData();
    if (listdoa == null) errorLogin = true;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.custom(childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(item: listdoa[index]),
                  ),
                );
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(listdoa[index].id.toString()),
                      SizedBox(
                        width: 10,
                      ),
                      Text(listdoa[index].doa.toString()),
                    ],
                  ),
                ),
              ),
              
            );
          },
          childCount: listdoa.length,
        ))
        // ListView.separated(
        //     itemBuilder: (context, index) {
        //       return InkWell(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => Detail(item: listdoa[index]),
        //             ),
        //           );
        //         },
        //         child: Container(
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Row(
        //               children: [
        //                 Text(listdoa[index].id.toString()),
        //                 SizedBox(
        //                   width: 10,
        //                 ),
        //                 Text(listdoa[index].doa.toString()),
        //               ],
        //             ),
        //           ),
        //         ),
        //       );
        //     },
        //     separatorBuilder: (context, index) {
        //       return Divider();
        //     },
        //     itemCount: listdoa.length),
      ),
    );
  }
}
