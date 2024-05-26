import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shine/components/Common/CustomProgressIndicator.dart';

import '../../data/api/api_service.dart';

class ImagesForm extends StatefulWidget {
  final String title;

  const ImagesForm({
    super.key,
    required this.title,
  });

  @override
  State<ImagesForm> createState() => _ImagesFormState();
}

class _ImagesFormState extends State<ImagesForm> {
  var api = ApiService();
  var loading = false;

  final ImagePicker picker = ImagePicker();
  XFile? image;
  List<String> multipleImages = [];
  List<XFile> _images = [];

  List<dynamic> _uploadedImages = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 18,
                fontFamily: 'Inter'),
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () async {
                print(2);
                pickImages();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(20, 20, 20, 0.8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: _uploadedImages.length >= 1 ? Image.network(
                        _uploadedImages[0]['path'],
                        fit: BoxFit.cover,
                      ) : null,
                    ),
                  ),
                  _uploadedImages.length < 1 ? Center(
                    child: loading
                        ? CustomProgressIndicator()
                        : SvgPicture.asset('assets/icons/add-image.svg', width: 50),
                  ) : Container(),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    print(2);
                    pickImages();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 115,
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromRGBO(20, 20, 20, 0.8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: _uploadedImages.length >= 2 ? Image.network(
                            _uploadedImages[1]['path'],
                            fit: BoxFit.cover,
                          ) : null,
                        ),
                      ),
                      _uploadedImages.length < 2 ? Center(
                        child: loading
                            ? CustomProgressIndicator()
                            : SvgPicture.asset('assets/icons/add-image.svg',
                                width: 50),
                      ) : Container(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    print(3);
                    pickImages();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 115,
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromRGBO(20, 20, 20, 0.8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: _uploadedImages.length >= 3 ? Image.network(
                            _uploadedImages[2]['path'],
                            fit: BoxFit.cover,
                          ) : null,
                        ),
                      ),
                      _uploadedImages.length < 3 ? Center(
                        child: loading
                            ? CustomProgressIndicator()
                            : SvgPicture.asset('assets/icons/add-image.svg',
                                width: 50),
                      ) : Container(),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(height: _uploadedImages.length > 2 ? 20 : 0),
        _uploadedImages.length > 2 ? Row(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    print(2);
                    pickImages();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 115,
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromRGBO(20, 20, 20, 0.8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: _uploadedImages.length >= 4 ? Image.network(
                            _uploadedImages[3]['path'],
                            fit: BoxFit.cover,
                          ) : null,
                        ),
                      ),
                      _uploadedImages.length < 4 ? Center(
                        child: loading
                            ? CustomProgressIndicator()
                            : SvgPicture.asset('assets/icons/add-image.svg',
                            width: 50),
                      ) : Container(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    print(3);
                    pickImages();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 115,
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromRGBO(20, 20, 20, 0.8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: _uploadedImages.length >= 5 ? Image.network(
                            _uploadedImages[4]['path'],
                            fit: BoxFit.cover,
                          ) : null,
                        ),
                      ),
                      _uploadedImages.length < 5 ? Center(
                        child: loading
                            ? CustomProgressIndicator()
                            : SvgPicture.asset('assets/icons/add-image.svg',
                            width: 50),
                      ) : Container(),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () async {
                print(2);
                pickImages();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(20, 20, 20, 0.8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: _uploadedImages.length >= 6 ? Image.network(
                        _uploadedImages[5]['path'],
                        fit: BoxFit.cover,
                      ) : null,
                    ),
                  ),
                  _uploadedImages.length < 6 ? Center(
                    child: loading
                        ? CustomProgressIndicator()
                        : SvgPicture.asset('assets/icons/add-image.svg', width: 50),
                  ) : Container(),
                ],
              ),
            ),
          ],
        ) : Container(),
        SizedBox(height: _uploadedImages.length > 5 ? 20 : 0),
        _uploadedImages.length > 5 ? Row(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    print(2);
                    pickImages();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 115,
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromRGBO(20, 20, 20, 0.8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: _uploadedImages.length >= 7 ? Image.network(
                            _uploadedImages[6]['path'],
                            fit: BoxFit.cover,
                          ) : null,
                        ),
                      ),
                      _uploadedImages.length < 6 ? Center(
                        child: loading
                            ? CustomProgressIndicator()
                            : SvgPicture.asset('assets/icons/add-image.svg',
                            width: 50),
                      ) : Container(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    print(3);
                    pickImages();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 115,
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromRGBO(20, 20, 20, 0.8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: _uploadedImages.length >= 8 ? Image.network(
                            _uploadedImages[7]['path'],
                            fit: BoxFit.cover,
                          ) : null,
                        ),
                      ),
                      _uploadedImages.length < 7 ? Center(
                        child: loading
                            ? CustomProgressIndicator()
                            : SvgPicture.asset('assets/icons/add-image.svg',
                            width: 50),
                      ) : Container(),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () async {
                print(2);
                pickImages();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(20, 20, 20, 0.8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: _uploadedImages.length >= 9 ? Image.network(
                        _uploadedImages[8]['path'],
                        fit: BoxFit.cover,
                      ) : null,
                    ),
                  ),
                  _uploadedImages.length < 8 ? Center(
                    child: loading
                        ? CustomProgressIndicator()
                        : SvgPicture.asset('assets/icons/add-image.svg', width: 50),
                  ) : Container(),
                ],
              ),
            ),
          ],
        ) : Container(),
      ],
    );
  }

  pickImages() async {
    _images = await multiImagePicker();
    if (_images.isNotEmpty) {
      if (_images.length > 10) {
        _images.clear();
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Вы выбрали слишком много фото"),
          duration: Duration(milliseconds: 3000),
        ));
      } else {
        _uploadedImages = [];
        setState(() {});
        multipleImages = await multiImageUploader(_images);
      }
    } else if (_uploadedImages.length < 1) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Пожалуйста, добавьте хотя бы одно ваше фото"),
        duration: Duration(milliseconds: 3000),
      ));
    }
  }

  Future<List<String>> multiImageUploader(List<XFile> list) async {
    setState(() {
      loading = true;
    });
    List<String> _path = [];
    for (int i = 0; i < list.length; i++) {
      _path.add(await uploadImage(list[i], i));
    }
    setState(() {
      loading = false;
    });
    return _path;
  }

  Future<List<XFile>> multiImagePicker() async {
    List<XFile> _images = await ImagePicker().pickMultiImage(imageQuality: 50);
    if (_images != null && _images.isNotEmpty) {
      return _images;
    }
    return [];
  }

  Future<String> uploadImage(XFile image, int sorting) async {
    var api = ApiService();
    var uploadedImage = await api.storeImage({
      'sorting': sorting,
      'image': await MultipartFile.fromFile(image.path, filename: image.name),
    });
    _uploadedImages.add(uploadedImage['data']);
    return uploadedImage['data']['path'];
  }
}
