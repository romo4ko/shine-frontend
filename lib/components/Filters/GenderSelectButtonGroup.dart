
import 'package:flutter/material.dart';

class GenderSelectButtonGroup extends StatefulWidget {

  const GenderSelectButtonGroup({super.key});

  @override
  State<GenderSelectButtonGroup> createState() => _GenderSelectButtonGroupState();
}

class _GenderSelectButtonGroupState extends State<GenderSelectButtonGroup> {

  var selected;

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
          SizedBox(
            height: 40,
            width: (MediaQuery.of(context).size.width-40)/3,
            child: ElevatedButton(
              onPressed: () => {
                setState(() => selected = 'men')
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
                backgroundColor: (selected == 'men' ? Color.fromRGBO(20, 20, 20, 0.8) : Colors.transparent),
                foregroundColor: (selected == 'men' ? Color.fromRGBO(20, 20, 20, 0.8) : Colors.transparent),
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
                      color: (selected == 'men' ? Colors.white : Colors.white.withOpacity(0.6))
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            width: (MediaQuery.of(context).size.width-40)/3,
            child: ElevatedButton(
              onPressed: () => {
                setState(() => selected = 'women')
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
                backgroundColor: (selected == 'women' ? Color.fromRGBO(20, 20, 20, 0.8) : Colors.transparent),
                foregroundColor: (selected == 'women' ? Color.fromRGBO(20, 20, 20, 0.8) : Colors.transparent),
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
                      color: (selected == 'women' ? Colors.white : Colors.white.withOpacity(0.6))
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            width: (MediaQuery.of(context).size.width-40)/3,
            child: ElevatedButton(
              onPressed: () => {
                setState(() => selected = 'all')
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
                backgroundColor: (selected == 'all' ? Color.fromRGBO(20, 20, 20, 0.8) : Colors.transparent),
                foregroundColor: (selected == 'all' ? Color.fromRGBO(20, 20, 20, 0.8) : Colors.transparent),
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
                      color: (selected == 'all' ? Colors.white : Colors.white.withOpacity(0.6))
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}