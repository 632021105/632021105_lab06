import 'package:flutter/material.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}


class _MyWidgetState extends State<MyWidget> {
  
  final List<ListItem> _fruits = [
    ListItem('honda', 'Honda'),
    ListItem('toyota', 'Toyota'),
    ListItem('isuzu', 'Isuzu'),
  ];

  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  late ListItem _selectedItem;


   @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItem(_fruits);
    _selectedItem = _dropdownMenuItems[0].value!;
  }

  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(List<ListItem> fruits) {
    List<DropdownMenuItem<ListItem>> items = [];
    // สร้างดรอปดาวน์
      for (ListItem listItem in fruits) {
      items.add(DropdownMenuItem(
        value: listItem,
        child: Text(listItem.name),

        ));
      }
      return items;
}
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Input Widget"),
      ),
      body: SafeArea(
        child: ListView(
          children:[
              DropdownButton(
                dropdownColor: Colors.blue[200],
              value: _selectedItem,
              items: _dropdownMenuItems,
              onChanged: (value) {
              setState(() {
              _selectedItem = value!;
              });
              },
              )


          ],
        )),
    );
  }
  

  
  
  

  
 
}

  class ListItem{
    final String  name;
    final String value;

  ListItem( this.value , this.name);

  }
