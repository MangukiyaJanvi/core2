import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class Third extends StatefulWidget {
  const Third({Key? key}) : super(key: key);

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${l1[index].uname}"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${l1[index].uname}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "+91 ${l1[index].ucall}",
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
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
                  TextButton(
                    onPressed: () {},
                    child: Text("${l1[index].imail}"),
                  ),
                  Text(
                    "Address : ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${l1[index].add}",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      launchUrl(
                        Uri.parse('ur'),
                      );
                    },
                    child: Text(
                      "Website : ",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("${l1[index].web}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
