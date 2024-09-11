
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shine/components/Common/Buttons/buttons.dart';

import '../../data/api/api_service.dart';

class EmailNotConfirmed extends StatefulWidget {

  const EmailNotConfirmed({
    super.key,
  });

  @override
  State<EmailNotConfirmed> createState() => _EmailNotConfirmedState();
}

class _EmailNotConfirmedState extends State<EmailNotConfirmed> {

  var api = ApiService();

  bool sent = false;

  sendAnotherEmail() {
    api.sendConfirmationEmail().then((data) {
      if (data['status'] != null) {
        setState(() {
          sent = true;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 10),
      width:  MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(20, 20, 20, 0.8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            ! sent ? 'Вы ещё не подтвердили свою почту' : 'Отправлено',
            style: TextStyle(
              fontFamily: 'Inter',
              color: ! sent ? Colors.red : Colors.white,
              fontSize: 16
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: ! sent ? 10 : 0),
          ! sent ? SizedBox(
            height: 30,
            child: ElevatedButton(
              onPressed: () => {
                sendAnotherEmail()
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                backgroundColor: Colors.black.withOpacity(0.4),
                foregroundColor: Colors.black.withOpacity(0.5),
                disabledBackgroundColor: Colors.black.withOpacity(1),
              ),
              child: Text(
                'Отправить ещё одно письмо',
                textAlign: TextAlign.start,
                style: const TextStyle(
                    height: 1,
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),
              ),
            ),
          ) : SizedBox(height: 0,),
        ],
      ),
    );
  }
}