

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

import 'package:shine/data/api/api_service.dart';

import '../components/Common/AppBar/DefaultAppBar.dart';
import '../components/Common/CustomProgressIndicator.dart';

class DocumentScreen extends StatefulWidget {

  final String slug;

  const DocumentScreen({
    super.key,
    required this.slug
  });

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {

  var api = ApiService();
  var loading = true;
  var document;

  getDocument() {
    api.document({'slug': widget.slug}).then((data) {
      document = data;
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    getDocument();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: DefaultAppBar(
            title: loading ? '' : document['name'].toString().toLowerCase(),
            titleSize: 16
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery
                    .of(context)
                    .size
                    .height,
                minWidth: MediaQuery
                    .of(context)
                    .size
                    .width),
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: Colors.black54,
            ),
            child: loading ? CustomProgressIndicator() : Container(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      document['text'],
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.8)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}