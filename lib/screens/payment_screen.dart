import 'package:flutter/material.dart';
import 'package:printit/screens/congrats_screen.dart';
import 'package:printit/utils/constants/text_styles.dart';
import 'package:printit/utils/constants/printit_colors.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: const Color.fromRGBO(22, 23, 24, 1),
            child: Column(children: [
              SizedBox(
                  child: Container(
                padding: const EdgeInsets.only(right: 306, top: 40),
                child: MaterialButton(
                  onPressed: () {Navigator.pop(context);},
                  child: const Text('Cancel',
                      style: AppTextStyles.cancelButtonStyle),
                ),
              )),
              const Center(child: SizedBox(height: 57, width: 100)),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColorsGradients.darkGrayFillFormAndHeader,
                      shape: BoxShape.rectangle,
                    ),
                    child: const TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Test@email.com',
                        fillColor: AppColorsGradients.whiteInTextsAndButtons,
                        border: InputBorder.none,
                      ),
                    ),
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 10, right: 200),
                  child: SizedBox(
                      child: Text('Phone number',
                          style: AppTextStyles.regionPhoneNameStyle))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColorsGradients.darkGrayFillFormAndHeader,
                      shape: BoxShape.rectangle,
                    ),
                    child: const TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '380 (95) 123-4567',
                        fillColor: AppColorsGradients.whiteInTextsAndButtons,
                        border: InputBorder.none,
                      ),
                    ),
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 10, right: 234),
                  child: SizedBox(
                      child: Text('Full name',
                          style: AppTextStyles.regionPhoneNameStyle))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(0.2)),
                      color: AppColorsGradients.darkGrayFillFormAndHeader,
                      shape: BoxShape.rectangle,
                    ),
                    child: const TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Vasyl Opanasenko',
                        fillColor: AppColorsGradients.whiteInTextsAndButtons,
                        border: InputBorder.none,
                      ),
                    ),
                  )),
                SizedBox(
                  height: 48,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const CongratulationScreen(
                      congratsText: 'Your order confirmed!')),);},
                    child: const Text(
                      'Total: 165,\nPayment upon receipt',
                      style: AppTextStyles.whiteAddButtonAndLoginTitleStyle
                      )),)
            ])));
  }
}
