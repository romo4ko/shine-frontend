
import 'package:flutter/material.dart';
import 'package:shine/data/config/app_config.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

class PaymentService {

  var clientApplicationKey = AppConfig.config['Payments']!['clientApplicationKey'];
  var amount;
  var shopId = AppConfig.config['Payments']!['shopId'];
  var subtitle = 'Вы оформляете премиум подписку для доступа к дополнительным функциям в приложении.';
  var tokenizationModuleInputData;

  setTokenizationModuleInputData(String rate, int price) async {
    amount = Amount(value: price.toString(), currency: Currency.rub);

    tokenizationModuleInputData = TokenizationModuleInputData(
        clientApplicationKey: clientApplicationKey,
        title: 'Срок подписки: ${rate}',
        subtitle: subtitle,
        amount: amount,
        shopId: shopId,
        savePaymentMethod: SavePaymentMethod.off
    );

    var result = await YookassaPaymentsFlutter.tokenization(tokenizationModuleInputData);

    if (result is SuccessTokenizationResult) {
      var token = result.token;
      var paymentMethodType = result.paymentMethodType;

      print(token);
    }
  }

}

