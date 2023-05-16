import 'package:flutter/material.dart';
import 'package:tes/repository.dart';
import 'package:tes/repository_jadwal_sholat.dart';
import 'package:tes/view/login.dart';
import 'package:tes/view/user.dart';
import '../model/model_jadwal_sholat.dart';
import '../view/location.dart';

import '../model/model.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Doa> listdoa = [];
  // List<Sholat> listSholat = [];

  Repository repository = Repository();
  RepositorySholat repositorySholats = RepositorySholat();

  getData() async {
    listdoa = await repository.getData();
    setState(() {});
  }

  // getDataSholat() async {
  //   listSholat = await repositorySholats.getDataSholats();
  //   setState(() {});
  // }

  @override
  void initState() {
    getData();
    // getDataSholat();s
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(146, 246, 246, 246),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hello, Yoga Pratama",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/profil.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            scale: 0.5,
                            image: AssetImage("assets/mosque.jpeg"),
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomRight),
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
                child: Padding(
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
                    child: Card(
                      color: Color(0xFFFFFFFF),
                      child: ListTile(
                        title: Text(listdoa[index].doa.toString()),
                      ),
                    ),
                  );
                },
                itemCount: listdoa.length,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
