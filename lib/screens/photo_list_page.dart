import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:printit/widgets/paper_type_radio_button.dart';
import 'dart:io';

class PhotoListPage extends StatefulWidget {
  const PhotoListPage({super.key});

  @override
  State<PhotoListPage> createState() => _PhotoListPageState();
}

class _PhotoListPageState extends State<PhotoListPage> {
  final List<String> _photoPaths = [];
  final List<int> _photoQuantities = [];
  final List<String> _photoFormats = [];
  final List<PaperType> _paperTypes = [];
  final List<bool> _isBlackAndWhite = [];
  final _picker = ImagePicker();

  Future<void> _addPhoto() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _photoPaths.add(image.path);
        _photoQuantities.add(1);
        _photoFormats.add("9x13");
        _paperTypes.add(PaperType.glossy);
        _isBlackAndWhite.add(false);
      });
    }
  }

  void _incrementQuantity(int index) {
    setState(() {
      _photoQuantities[index]++;
    });
  }

  void _decrementQuantity(int index) {
    if (_photoQuantities[index] != 0) {
      setState(() {
        _photoQuantities[index]--;
      });
    }
  }

  void _changeFormat(int index, String newFormat) {
    setState(() {
      _photoFormats[index] = newFormat;
    });
  }

  void _changePaperType(int index, PaperType newPaperType) {
    setState(() {
      _paperTypes[index] = newPaperType;
    });
  }

  void _changeIsBlackAndWhite(int index, bool newIsBlackAndWhite) {
    setState(() {
      _isBlackAndWhite[index] = newIsBlackAndWhite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo List'),
      ),
      body: ListView.builder(
        itemCount: _photoPaths.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Image.file(
                      File(_photoPaths[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text('Format'),
                            DropdownButton<String>(
                              value: _photoFormats[index],
                              onChanged: (String? newFormat) {
                                _changeFormat(index, newFormat!);
                              },
                              items: <String>[
                                "9x13",
                                "10x10",
                                "10x15",
                                "15x20",
                                "20x30"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6.0),
                        Row(
                          children: <Widget>[
                            PaperTypeRadioButton(
                              title: 'Glossy',
                              value: PaperType.glossy,
                              groupValue: _paperTypes[index],
                              onChanged: (PaperType? value) {
                                _changePaperType(index, value!);
                              },
                            ),
                            const SizedBox(width: 5.0),
                            PaperTypeRadioButton(
                              title: 'Matte',
                              value: PaperType.matte,
                              groupValue: _paperTypes[index],
                              onChanged: (PaperType? value) {
                                _changePaperType(index, value!);
                              },
                            ),
                          ],
                        ),
                        CheckboxListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.all(0.0),
                          title: const Text('Black and White'),
                          value: _isBlackAndWhite[index],
                          onChanged: (bool? value) {
                            _changeIsBlackAndWhite(index, value!);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              padding: const EdgeInsets.all(0.0),
                              icon: const Icon(Icons.remove),
                              onPressed: () => _decrementQuantity(index),
                            ),
                            Text("Quantity: ${_photoQuantities[index]}"),
                            IconButton(
                              padding: const EdgeInsets.all(0.0),
                              icon: const Icon(Icons.add),
                              onPressed: () => _incrementQuantity(index),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPhoto,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}