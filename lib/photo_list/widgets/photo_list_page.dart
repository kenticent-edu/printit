import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:printit/photo_list/widgets/paper_type_radio_button.dart';
import 'package:printit/screens/popup_group_page.dart';
import '../models/photo.dart';

class PhotoListPage extends StatefulWidget {
  const PhotoListPage({super.key});

  @override
  State<PhotoListPage> createState() => _PhotoListPageState();
}

class _PhotoListPageState extends State<PhotoListPage> {
  final List<Photo> _photos = [];
  final _picker = ImagePicker();
  int _selectedIndex = 0;
  bool _photoIsChosen = false;

  Future<void> _addPhoto() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    _photoIsChosen = true;
    if (image != null) {
      setState(() {
        _photos.add(Photo(image.path));
      });
    }
  }

  void _incrementQuantity(int index) {
    setState(() {
      _photos[index].quantity++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        _addPhoto();
      }
      _selectedIndex = index;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_photos[index].quantity == 1) {
        _photos.removeAt(index);
      } else {
        _photos[index].quantity--;
      }
    });
  }

  void _changeFormat(int index, String newFormat) {
    setState(() {
      _photos[index].format = newFormat;
    });
  }

  Widget _buildNextButton(context) {
    return (_photoIsChosen != false)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () => showBottomGroupsPage(context),
                minWidth: 167,
                height: 48,
                color: const Color(0xFF007AFF),
                textColor: Colors.white,
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )
        : Row();
  }

  void _changePaperType(int index, PaperType newPaperType) {
    setState(() {
      _photos[index].paperType = newPaperType;
    });
  }

  void _changeIsBlackAndWhite(int index, bool newIsBlackAndWhite) {
    setState(() {
      _photos[index].isBlackAndWhite = newIsBlackAndWhite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo List'),
      ),
      body: ListView.builder(
        itemCount: _photos.length,
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
                      File(_photos[index].path),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text('Format'),
                            DropdownButton<String>(
                              value: _photos[index].format,
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
                              groupValue: _photos[index].paperType,
                              onChanged: (PaperType? value) {
                                _changePaperType(index, value!);
                              },
                            ),
                            const SizedBox(width: 5.0),
                            PaperTypeRadioButton(
                              title: 'Matte',
                              value: PaperType.matte,
                              groupValue: _photos[index].paperType,
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
                          value: _photos[index].isBlackAndWhite,
                          onChanged: (bool? value) {
                            _changeIsBlackAndWhite(index, value!);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon((_photos[index].quantity == 1)
                                  ? Icons.remove_shopping_cart
                                  : Icons.remove),
                              onPressed: () => _decrementQuantity(index),
                            ),
                            Text("Quantity: ${_photos[index].quantity}"),
                            IconButton(
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
      floatingActionButton: _buildNextButton(context),
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: BottomNavigationBar(
                  backgroundColor: const Color(0xFF424242),
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.white,
                  selectedFontSize: 0,
                  onTap: _onItemTapped,
                  iconSize: 32,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.grid_view_rounded), label: "grid"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add_circle_outline),
                        label: "add_photo"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "profile"),
                  ]))),
    );
  }
}
