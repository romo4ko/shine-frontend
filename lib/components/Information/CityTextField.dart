
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
        // const _AsyncAutocomplete(),
        TextFormField(
          controller: widget.controller,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Inter'),
          cursorColor: Colors.white.withOpacity(0.6),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10.0),
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
            labelText: widget.placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ],
    );
  }
}

class _AsyncAutocomplete extends StatefulWidget {
  const _AsyncAutocomplete();

  @override
  State<_AsyncAutocomplete> createState() => _AsyncAutocompleteState();
}

class _AsyncAutocompleteState extends State<_AsyncAutocomplete> {
  String? _searchingWithQuery;
  var api = ApiService();

  late Iterable<String> _lastOptions = <String>[];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
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
      onSelected: (String selection) {
        debugPrint(selection);
      },
    );
  }
}