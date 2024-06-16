
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shine/data/api/api_service.dart';

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

  var api = ApiService();
  var loading = false;

  final ImagePicker picker = ImagePicker();
  XFile? image;
  XFile? _image;

  List<dynamic> _uploadedImages = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 8),
          child: Text(
            'Мои фото',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter'
            ),
          ),
        ),
        Column(
          children: [
            Row(children: [
              // First
              GestureDetector(
                onTap: () async {
                  pickImage(0);
                },
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width/3*2-30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(20, 20, 20, 0.8),
                    image: widget.images.length >= 1 ?
                    DecorationImage(
                      image: NetworkImage(
                        widget.images[0]['path'],
                      ),
                      fit: BoxFit.cover
                    ) : null
                  ),
                  child: Center(
                    child: widget.images.length < 1 ? SvgPicture.asset('assets/icons/add-image.svg', width: 60) : Container(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(children: [
                GestureDetector(
                  onTap: () {
                    pickImage(1);
                  },
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width/3-20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(20, 20, 20, 0.8),
                      image: widget.images.length >= 2 ?
                      DecorationImage(
                          image: NetworkImage(
                            widget.images[1]['path'],
                          ),
                          fit: BoxFit.cover
                      ) : null
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Center(
                        child: widget.images.length < 2 ? SvgPicture.asset('assets/icons/add-image.svg', width: 40) : Container(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    pickImage(2);
                  },
                  // Second right
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width/3-20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(20, 20, 20, 0.8),
                      image: widget.images.length >= 3 ?
                      DecorationImage(
                          image: NetworkImage(
                            widget.images[2]['path'],
                          ),
                          fit: BoxFit.cover
                      ) : null
                    ),
                    child: Center(
                      child: widget.images.length < 3 ? SvgPicture.asset('assets/icons/add-image.svg', width: 40) : Container(),
                    ),
                  ),
                )
              ])
            ]),
            SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    pickImage(3);
                  },
                  child: Container(
                    height: 125,
                    width: MediaQuery.of(context).size.width/3-20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(20, 20, 20, 0.8),
                      image: widget.images.length >= 4 ?
                      DecorationImage(
                          image: NetworkImage(
                            widget.images[3]['path'],
                          ),
                          fit: BoxFit.cover
                      ) : null
                    ),
                    child: Center(
                      child: widget.images.length < 4 ? SvgPicture.asset('assets/icons/add-image.svg', width: 40) : Container(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    pickImage(4);
                  },
                  child: Container(
                    height: 125,
                    width: MediaQuery.of(context).size.width/3-20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(20, 20, 20, 0.8),
                      image: widget.images.length >= 5 ?
                      DecorationImage(
                          image: NetworkImage(
                            widget.images[4]['path'],
                          ),
                          fit: BoxFit.cover
                      ) : null
                    ),
                    child: Center(
                      child: widget.images.length < 5 ? SvgPicture.asset('assets/icons/add-image.svg', width: 40) : Container(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    pickImage(5);
                  },
                  child: Container(
                    height: 125,
                    width: MediaQuery.of(context).size.width/3-20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(20, 20, 20, 0.8),
                      image: widget.images.length >= 6 ?
                      DecorationImage(
                          image: NetworkImage(
                            widget.images[5]['path'],
                          ),
                          fit: BoxFit.cover
                      ) : null
                    ),
                    child: Center(
                      child: widget.images.length < 6 ? SvgPicture.asset('assets/icons/add-image.svg', width: 40) : Container(),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  pickImage(int sorting) async {
    _image = await imagePicker();
    if (_image != null) {
      setState(() {
        loading = true;
      });
      if (widget.images.length-1 >= sorting) {
        widget.images[sorting]['path'] = await uploadImage(_image!, sorting);
      } else {
        widget.images.add({
          'path': await uploadImage(_image!, sorting)
        });
      }
      setState(() {
        loading = false;
      });
    }
  }

  Future<XFile?> imagePicker() async {
    XFile? _image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (_image != null) {
      return _image;
    }
    return null;
  }

  Future<String> uploadImage(XFile image, int sorting) async {
    var uploadedImage = await api.storeImage({
      'sorting': sorting,
      'image': await MultipartFile.fromFile(image.path, filename: image.name),
    });
    _uploadedImages.add(uploadedImage['data']);
    return uploadedImage['data']['path'];
  }
}