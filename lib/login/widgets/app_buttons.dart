import 'package:flutter/material.dart';

class AppButtons {

  static MaterialButton createNewGroupButton = MaterialButton(
                      onPressed: () => null,
                      minWidth: double.infinity,
                      color: Colors.white,
                      textColor: Colors.black,
                      height: 48,
                      child: const Text('Create a new group'),
                    );


  static Container firstGroupButton = Container(
                      height: 48,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFFF0566), Colors.black],
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () => null,
                        minWidth: double.infinity,
                        textColor: Colors.white,
                        child: const Text('Wedding photos   7/35'),
                      ),
                    );

  static MaterialButton proceedButton = MaterialButton(
                      onPressed: () => null,
                      minWidth: double.infinity,
                      color: const Color(0xFF007AFF),
                      textColor: Colors.white,
                      height: 48,
                      child: const Text('Proceed immediately'),
                    );
    
}