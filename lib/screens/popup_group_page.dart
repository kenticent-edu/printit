import 'package:flutter/material.dart';
import 'package:printit/login/widgets/app_buttons.dart';

void showBottomGroupsPage(context) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
          height: 600,
          decoration: const BoxDecoration(
            color: Color(0xFF161718),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(children: [
              const SizedBox(height: 9),
              Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(color: Color(0xFF007AFF), fontSize: 15),
                      ))
                ],
              ),
              const SizedBox(height: 49),
              const Text(
                'Do you want to place an order now or when a certain number of photos are collected?',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
              const SizedBox(height: 31),
              AppButtons.createNewGroupButton,
              const SizedBox(height: 14),
              AppButtons.firstGroupButton,
              const SizedBox(height: 227),
              AppButtons.proceedButton
            ]),
          ));
    },
  );
}
