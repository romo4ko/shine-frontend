
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BotSettings extends StatefulWidget {

  final String? selected;

  const BotSettings({
    super.key,
    this.selected,
  });

  @override
  State<BotSettings> createState() => _BotSettingsState();
}

class _BotSettingsState extends State<BotSettings> {

  var selected;

  @override
  void initState() {
    selected = widget.selected ?? 'mixed';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
          width:  MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(20, 20, 20, 0.8),
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Настройка бота предсказаний',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () => {
                            setState(() => selected = 'funny')
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            backgroundColor: Colors.black.withOpacity(0.4),
                            foregroundColor: Colors.black.withOpacity(0.5),
                            disabledBackgroundColor: Colors.black.withOpacity(1),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.6),
                                      width: 1,
                                    ),
                                    color: selected == 'funny' ? Colors.white : Colors.transparent
                                ),
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Грубые и смешные",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      height: 1,
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () => {
                            setState(() => selected = 'needful')
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            backgroundColor: Colors.black.withOpacity(0.4),
                            foregroundColor: Colors.black.withOpacity(0.5),
                            disabledBackgroundColor: Colors.black.withOpacity(1),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.6),
                                      width: 1,
                                    ),
                                    color: selected == 'needful' ? Colors.white : Colors.transparent
                                ),
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Нежные и нужные",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      height: 1,
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () => {
                            setState(() => selected = 'mixed')
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            backgroundColor: Colors.black.withOpacity(0.4),
                            foregroundColor: Colors.black.withOpacity(0.5),
                            disabledBackgroundColor: Colors.black.withOpacity(1),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.6),
                                      width: 1,
                                    ),
                                    color: selected == 'mixed' ? Colors.white : Colors.transparent
                                ),
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Смешанные",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      height: 1,
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: SvgPicture.asset(
                      'assets/icons/bot-settings-star.svg',
                      height: 120,
                      width: 120,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Все предсказания индивидуальны",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        height: 1,
                        fontFamily: 'kistyac',
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.8)
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/drawed-arrow.svg',
                    height: 25,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "и прописаны для вас",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'kistyac',
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.8)
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}