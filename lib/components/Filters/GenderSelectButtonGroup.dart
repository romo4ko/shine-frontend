
import 'package:flutter/material.dart';

class GenderSelectButtonGroup extends StatefulWidget {

  final TextEditingController controller;
  final List available;

  const GenderSelectButtonGroup({
    super.key,
    required this.controller,
    required this.available
  });

  @override
  State<GenderSelectButtonGroup> createState() => _GenderSelectButtonGroupState();
}

class _GenderSelectButtonGroupState extends State<GenderSelectButtonGroup> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: Color.fromRGBO(20, 20, 20, 0.8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.available.contains('male') ? SizedBox(
            height: 40,
            width: (MediaQuery.of(context).size.width-40)/widget.available.length,
            child: ElevatedButton(
              onPressed: () => {
                setState(() => widget.controller.text = 'men')
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
                backgroundColor: (widget.controller.text == 'men' ? Color.fromRGBO(20, 20, 20, 0.8) : Colors.transparent),
                foregroundColor: (widget.controller.text == 'men' ? Color.fromRGBO(20, 20, 20, 0.8) : Colors.transparent),
                disabledBackgroundColor: Colors.transparent,
                disabledForegroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
              ),
              child: Align(
                child: Text(
                  "Парни",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      height: 1,
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: (widget.controller.text == 'men' ? Colors.white : Colors.white.withOpacity(0.6))
                  ),
                ),
              ),
            ),
          ) : SizedBox(),
          widget.available.contains('female') ? SizedBox(
            height: 40,
            width: (MediaQuery.of(context).size.width-40)/widget.available.length,
            child: ElevatedButton(
              onPressed: () => {
                setState(() => {widget.controller.text = 'women'})
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
                backgroundColor: (widget.controller.text == 'women' ? Color.fromRGBO(20, 20, 20, 0.8) : Colors.transparent),
                foregroundColor: (widget.controller.text == 'women' ? Color.fromRGBO(20, 20, 20, 0.8) : Colors.transparent),
                disabledBackgroundColor: Colors.transparent,
                disabledForegroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
              ),
              child: Align(
                child: Text(
                  "Девушки",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      height: 1,
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: (widget.controller.text == 'women' ? Colors.white : Colors.white.withOpacity(0.6))
                  ),
                ),
              ),
            ),
          ) : SizedBox(),
          widget.available.contains('all') ? SizedBox(
            height: 40,
            width: (MediaQuery.of(context).size.width-40)/widget.available.length,
            child: ElevatedButton(
              onPressed: () => {
                setState(() => widget.controller.text = 'all')
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
                backgroundColor: (widget.controller.text == 'all' ? Color.fromRGBO(20, 20, 20, 0.8) : Colors.transparent),
                foregroundColor: (widget.controller.text == 'all' ? Color.fromRGBO(20, 20, 20, 0.8) : Colors.transparent),
                disabledBackgroundColor: Colors.transparent,
                disabledForegroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
              ),
              child: Align(
                child: Text(
                  "Не важно",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      height: 1,
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: (widget.controller.text == 'all' ? Colors.white : Colors.white.withOpacity(0.6))
                  ),
                ),
              ),
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }
}