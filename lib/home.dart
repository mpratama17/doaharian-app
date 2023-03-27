import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tes/repository.dart';

import 'model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<Content> listcontent = [];
  List<Doa> listdoa = [];

  Repository repository = Repository();

  getData() async {
    // listcontent = await repository.getData();
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
      appBar: AppBar(
        title: Text("Test API"),
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //snackbar
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(listdoa[index].ayat.toString()),
                    ));
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
                        )),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: listdoa.length)),
    );
  }
}
