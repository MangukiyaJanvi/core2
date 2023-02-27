import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';
import 'model.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtcall = TextEditingController();
  TextEditingController txtadd = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtweb = TextEditingController();
  String path="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Contact"),
          actions: [
            IconButton(
                onPressed: () {
                  Model m1 = Model(
                      add: txtadd.text,
                      imail: txtemail.text,
                      ucall: txtcall.text,
                      uname: txtname.text,
                      web: txtweb.text,
                  img: path);
                  l1.add(m1);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.done)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? xfile = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      path = xfile!.path;
                    });
                  },
                  child: (path.isEmpty)
                      ? CircleAvatar(
                    maxRadius: 100,
                    backgroundImage:
                    AssetImage("assets/images/profile.png"),
                  )
                      : CircleAvatar(
                    maxRadius: 100,
                    backgroundImage: FileImage(
                      File(path),
                    ),
                  ),
                ),
              ),
              Text("Enter The Full Name"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                controller: txtname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Enter The Number"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: txtcall,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Enter The Email"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: txtemail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Enter The Address"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                controller: txtadd,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Enter The Website"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.url,
                controller: txtweb,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
