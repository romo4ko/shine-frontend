
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/api/api_service.dart';

class CityAutocomplete extends StatefulWidget {

  final String? value;
  final String title;
  final TextEditingController? controller;
  final Function callback;

  const CityAutocomplete({
    super.key,
    this.value,
    required this.title,
    this.controller,
    required this.callback
  });

  @override
  State<CityAutocomplete> createState() => _CityAutocompleteState();
}

class _CityAutocompleteState extends State<CityAutocomplete> {

  bool is_active = false;

  Key _key = new GlobalKey();
  final FocusNode _focusNode = FocusNode();

  String? _searchingWithQuery;
  var api = ApiService();

  late Iterable<String> _lastOptions = <String>[];


  @override
  void initState() {
    is_active = false;
    if (widget.value != null) {
      widget.controller!.text = widget.value!;
      is_active = true;
    }
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.callback();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 300,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) async {
                  _searchingWithQuery = textEditingValue.text;

                  var data = await api.cities({'text': _searchingWithQuery!});
                  print(data);
                  var inverted = data.map((map) => map['name']).toList();
                  print(inverted);
                  final Iterable<String> options = inverted.cast<String>();

                  if (_searchingWithQuery != textEditingValue.text) {
                    return _lastOptions;
                  }

                  _lastOptions = options;
                  return options;
                },
                optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                  return Container(
                    padding: EdgeInsets.only(right: 40, bottom: MediaQuery.of(context).size.height-300),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black.withOpacity(0.8),
                      elevation: 4.0,
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: options.map((String option) {
                          return ListTile(
                            title: Text(option, style: TextStyle(color: Colors.white)),
                            onTap: () {
                              onSelected(option);
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode,
                    VoidCallback onFieldSubmitted) {
                  fieldTextEditingController.text = widget.controller!.text;
                  return TextFormField(
                    controller: fieldTextEditingController,
                    textCapitalization: TextCapitalization.words,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        height: 1,
                        fontFamily: 'Inter'
                    ),
                    cursorColor: Colors.white.withOpacity(0.5),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20, right: 0),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      floatingLabelStyle: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                          fontFamily: 'Inter'
                      ),
                      labelStyle: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 18,
                          fontFamily: 'Inter'
                      ),
                      fillColor: Colors.transparent,
                      filled: true,
                      focusColor: Colors.transparent,
                      labelText: widget.title,
                    ),
                    focusNode: fieldFocusNode,
                  );
                },
                onSelected: (String selection) {
                  debugPrint(selection);
                  widget.controller!.text = selection;
                  FocusManager.instance.primaryFocus?.unfocus();
                  widget.callback();
                },
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SvgPicture.asset('assets/icons/arrow-right.svg', height: 14)
            ),
          ],
        ),
      ),
    );
  }
}