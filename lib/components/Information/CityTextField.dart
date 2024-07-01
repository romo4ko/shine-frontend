
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shine/data/api/api_service.dart';

class CityTextField extends StatefulWidget {

  final String title;
  final String placeholder;
  final TextEditingController? controller;

  const CityTextField({
    super.key,
    required this.title,
    required this.placeholder,
    this.controller
  });

  @override
  State<CityTextField> createState() => _CityTextFieldState();
}

class _CityTextFieldState extends State<CityTextField> {

  String? _searchingWithQuery;
  var api = ApiService();

  late Iterable<String> _lastOptions = <String>[];

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
                fontFamily: 'Inter'
            ),
          ),
        ),
        Autocomplete<String>(
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
            return TextFormField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontFamily: 'Inter'),
                fillColor: const Color.fromRGBO(20, 20, 20, 0.8),
                filled: true,
                focusColor: Colors.white,
                labelText: "Укажите город для поиска",
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              controller: fieldTextEditingController,
              focusNode: fieldFocusNode,
            );
          },
          onSelected: (String selection) {
            debugPrint(selection);
            widget.controller!.text = selection;
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ],
    );
  }
}
