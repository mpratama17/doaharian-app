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

  getData() async {
    listdoa = await repository.getData();
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
      // appBar: AppBar(title: Text('Doa Harian', 
      // style: TextStyle(fontWeight: FontWeight.bold),), 
      // elevation: 0,
      // actions: [
      //   IconButton(
      //     onPressed: () {
      //       // Navigator.push(
      //       //   context,
      //       //   MaterialPageRoute(
      //       //     builder: (context) => User(),
      //       //   ),
      //       // );
      //     },
      //     icon: Icon(Icons.person),
      //   ),
      // ]),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)
              ),
              child: Container(
                color: Colors.cyan,
                height: 190,
                width: 380,
                
              ),
            ),
            // SizedBox(height: 8),
            Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
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
                      height: 70,
                      // width: 300,
                      // color: Colors.grey[200],
            
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(listdoa[index].id.toString(), 
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Text(listdoa[index].doa.toString()
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: listdoa.length,
              ),
            )
            )
          ],
        ),
        // child: ListView.separated(
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
        //             padding: const EdgeInsets.all(16.0),
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
