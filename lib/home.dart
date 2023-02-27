import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.black38,
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "MY CONTACT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black38),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 1.5),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Type name or number",
                            style: TextStyle(color: Colors.black38),
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        Box(l1[index].uname!, l1[index].ucall!, index,l1[index].img!),
                    itemCount: l1.length,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '2').then((value) {
                      setState(() {});
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Box(String name, String call, int index,String path) {
    return Container(
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (path.isEmpty)
                ? CircleAvatar(
              maxRadius: 22,
              backgroundImage:
              AssetImage("assets/images/profile.png"),
            )
                : CircleAvatar(
              maxRadius: 22,
              backgroundImage: FileImage(
                File(path),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '3',arguments: index);
                  },
                  child: Text(
                    "${name}",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Text(
                  "+91 ${call}",
                  style: TextStyle(color: Colors.black38),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                width: 25,
              ),
            ),
            IconButton(
                onPressed: () async {
                  await launchUrl(
                    Uri.parse('tel:${l1[index].ucall}'),
                  );
                },
                icon: Icon(Icons.call),
                color: Colors.black38),
            SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse('sms:${l1[index].ucall}'),
                  );
                },
                icon: Icon(Icons.message),
                color: Colors.black38),
          ],
        ),
      ),
    );
  }
}
