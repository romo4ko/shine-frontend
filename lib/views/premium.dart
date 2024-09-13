import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shine/components/Common/CustomProgressIndicator.dart';
import 'dart:async';

import 'package:shine/data/api/api_service.dart';
import 'package:shine/data/config/app_config.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {

  var api = ApiService();

  bool loading = true;
  List<dynamic>? prices;
  Timer? _timer;
  int seconds = 0;
  int? discount = null;
  Map<String, dynamic> time = {
    'days': 0,
    'hours': 0,
    'seconds': 0
  };
  Map<String, dynamic>? selected;

  getPrices() {
    api.getPrices().then((data) {
      setState(() {
        print(data);
        prices = data['data'];
        selected = prices![1];
        if (data['meta'] != null) {
          seconds = data['meta']['seconds_left'];
          discount = data['meta']['discount'];
          startTimer();
        }
        loading = false;
      });
    });
  }

  @override
  void initState() {
    getPrices();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec, (Timer timer) {
        if (seconds == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            seconds--;
          });
        }
      },
    );
  }

  int getSeconds() {
    return seconds%60;
  }

  int getMinutes() {
    return (seconds~/60) % 60;
  }

  int getHours() {
    return (seconds~/60~/60) % 24;
  }

  int getDays() {
    return (seconds~/60~/60~/24);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
                minWidth: MediaQuery.of(context).size.width),
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/backgrounds/premium-bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset('assets/icons/premium-main.svg',
                      height: 170, width: 170),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "С И Я Н И Е",
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'Dejavu',
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const Text(
                      "premium",
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                    ),
                    loading ? SizedBox() : Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        "приобретай премиум ${discount != null ? 'со скидкой' : ''}и получай больше возможностей сиять",
                        style: TextStyle(
                            height: 1,
                            fontFamily: 'kistyac',
                            fontSize: 22,
                            color: Colors.white.withOpacity(0.8)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                loading || discount == null ? SizedBox(height: 20) : Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(14, 14, 14, 0.8)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Text(
                          "Скидка -${discount}%",
                          style: TextStyle(
                              height: 1,
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "${getDays()} дней ${getHours()} часов ${getMinutes()} минут ${getSeconds()} секунд",
                          style: const TextStyle(
                              height: 1,
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                loading ? CustomProgressIndicator() : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: prices!.map((item) {
                      return getSaleContainer(item);
                    }).toList(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    children: [
                      PremiumOption(
                          title: 'Бот с предсказаниями',
                          description:
                              'Возможность видеть больше предсказаний в день'),
                      PremiumOption(
                          title: 'Просмотр лайков',
                          description: 'Узнай, кому ты нравишься сегодня'),
                      PremiumOption(
                          title: 'Суперзвезда',
                          description: 'Обрати на себя внимание, звёздочка'),
                      PremiumOption(
                          title: 'Вернуть обратно',
                          description:
                              'Отменить дизлайк, вдруг это твоя судьба?')
                    ],
                  ),
                ),
                Container(
                  width: 250,
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: const Text(
                    "Нажимая кнопку, вы соглашаетесь с Условиями подписки",
                    style: TextStyle(
                        height: 1,
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        print(selected);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        backgroundColor: Colors.white.withOpacity(0.3),
                        foregroundColor: Colors.white.withOpacity(0.3),
                        disabledBackgroundColor: Colors.white.withOpacity(0.5),
                      ),
                      child: loading ? CustomProgressIndicator() : Text(
                        'Подписка за ${selected?['cost'] ?? selected?['price']}₽ / ${(selected?['name']).toString().toLowerCase()}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            height: 1,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget getSaleContainer(Map<String, dynamic> price) {

    return GestureDetector(
      onTap: () => {
        setState(() {
          selected = price;
        })
      },
      child: Container(
        height: 105,
        width: 105,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: price['code'] == selected?['code'] ? Colors.white : Colors.transparent,
                width: 1
            ),
            color: const Color.fromRGBO(14, 14, 14, 0.8)),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              price['name'],
              style: const TextStyle(
                  height: 1,
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: Colors.white),
            ),
            Text(
              "${ price['cost'] != null ? price['cost'] : price['price']}₽",
              style: const TextStyle(
                  height: 1,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.white),
            ),
            price['cost'] != null ? Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  "${price['price']}₽",
                  style: TextStyle(
                    height: 1,
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                Container(
                  height: 1,
                  width: 40,
                  color: Colors.white.withOpacity(0.5),
                )
              ],
            ) : SizedBox(),
          ],
        ),
      ),
    );
  }
}

class PremiumOption extends StatelessWidget {
  final String title;
  final String? route;
  final String description;

  const PremiumOption(
      {super.key, required this.title, this.route, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () => {Navigator.pushNamed(context, this.route ?? '/')},
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromRGBO(14, 14, 14, 0.8)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat'),
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Montserrat'),
                  ),
                ],
              ),
              SvgPicture.asset('assets/icons/arrow-right.svg', height: 14),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumSale extends StatelessWidget {
  final String title;
  final int? price;
  final int? cost;
  final bool active;

  const PremiumSale(
      {super.key,
      required this.title,
      required this.price,
      required this.cost,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: 105,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white, width: active ? 1 : 0),
          color: const Color.fromRGBO(14, 14, 14, 0.8)),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                height: 1,
                fontFamily: 'Montserrat',
                fontSize: 14,
                color: Colors.white),
          ),
          Text(
            '$cost₽',
            style: const TextStyle(
                height: 1,
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.white),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                '$price₽',
                style: TextStyle(
                  height: 1,
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              Container(
                height: 1,
                width: 40,
                color: Colors.white.withOpacity(0.5),
              )
            ],
          ),
        ],
      ),
    );
  }
}
