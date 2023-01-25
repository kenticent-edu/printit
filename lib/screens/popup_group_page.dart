import 'package:flutter/material.dart';

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Sheet Sample')),
        body: const BottomSheetExample(),
      ),
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
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
                      bottomRight: Radius.circular(0)),),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Column(children: [
                          const SizedBox(height: 9),
                          Row(
                            children: [
                              GestureDetector(onTap: () => Navigator.pop(context),
                              child: const Text('Cancel', textAlign: TextAlign.left, style: 
                                TextStyle(color: Color(0xFF007AFF), fontSize: 15),))
                              
                            ],
                          ),

                          const SizedBox(height: 49),
                          const Text('Do you want to place an order now or when a certain number of photos are collected?',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),),
                          const SizedBox(height: 31),
                          MaterialButton(onPressed: () => null,
                          minWidth: double.infinity,
                          color: Colors.white,
                          textColor: Colors.black,
                          height: 48,
                          child: const Text('Create a new group'),),
                          const SizedBox(height: 14),

                          Container(
                            height: 48,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFFF0566), Colors.black],
                            ),
                            ),
                            child: MaterialButton(onPressed: () => null,
                            minWidth: double.infinity,
                            textColor: Colors.white,
                            child: const Text('Wedding photos   7/35'),),
                          ),

                          
                          const SizedBox(height: 227),

                          MaterialButton(onPressed: () => null,
                          minWidth: double.infinity,
                          color: const Color(0xFF007AFF),
                          textColor: Colors.white,
                          height: 48,
                          child: const Text('Proceed immediately'),),
                          
                          ]),
                      ));
            },
          );
        },
    );
  }
}
