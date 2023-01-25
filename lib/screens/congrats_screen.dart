import 'package:flutter/material.dart';
import 'package:printit/utils/constants/text_styles.dart';
import 'package:printit/utils/constants/printit_colors.dart';

import '../photo_list/widgets/photo_list_page.dart';


class CongratulationScreen extends StatelessWidget {
  final String? congratsText;
  const CongratulationScreen({super.key, required this.congratsText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Column(
        children: [
          Container(padding: const EdgeInsets.only(top: 170)),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height:69, 
                  width: 295, 
                  child: Text(
                    'Congratulations',
                    style: AppTextStyles.whiteTextButtonUserInfoFormCongratsStyle)),
                SizedBox(
                  height: 69, 
                  width: 295,
                  child: Text(
                    congratsText!, 
                    style: AppTextStyles.whiteAddButtonAndLoginTitleStyle))
              ]),
          ),
          Center(child: SizedBox(
            height: 250,
            width: 250, 
            child: Image.asset('assets/images/celebration.png'))),
          SizedBox(
            height: 48,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context) => const PhotoListPage()),
                  (Route<dynamic> route) => false);
              },
              child: const Text(
                'Back to main menu',
                style: AppTextStyles.whiteAddButtonAndLoginTitleStyle
                )),)
        ]));
  }

}