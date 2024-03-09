
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagesGrid extends StatefulWidget {

  final List images;

  const ImagesGrid({
    super.key,
    required this.images,
  });

  @override
  State<ImagesGrid> createState() => _ImagesGridState();
}

class _ImagesGridState extends State<ImagesGrid> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Мои фото',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 18,
                fontFamily: 'Inter'
            ),
          ),
        ),
        Row(children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width/2-30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromRGBO(20, 20, 20, 0.8),
            ),
            child: Center(
              child: SvgPicture.asset('assets/icons/add-image.svg', width: 50),
            ),
          ),
          const SizedBox(width: 20),
          Column(children: [
            GestureDetector(
              onTap: () {
                print(1);
              },
              child: Container(
                height: 115,
                width: MediaQuery.of(context).size.width/2-30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(20, 20, 20, 0.8),
                ),
                child: GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Center(
                      child: SvgPicture.asset('assets/icons/add-image.svg', width: 50),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
              },
              child: Container(
                height: 115,
                width: MediaQuery.of(context).size.width/2-30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(20, 20, 20, 0.8),
                ),
                child: Center(
                  child: SvgPicture.asset('assets/icons/add-image.svg', width: 50),
                ),
              ),
            )
          ],)
        ],)
      ],
    );
  }
}