import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(body: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Created by Mufungo Geeks

  //NB: Make sure you don't use static numbers when defining font size
  //    height and width, so as to accomodate for diferent screen sizes.
  //    WATCH THIS TO SEE HOW - https://www.youtube.com/watch?v=SC0TZMl_YC8

  //NB: Its advisable to put widget in their own classes for readability
  //    and usability in different classes. However, for the purpose of
  //    demonstration, this works just fine.

  final textfield = TextEditingController();

  onNumberTapped(number) {
    setState(() {
      textfield.text += number;
    });
  }

  onCancelText() {
    if (textfield.text.isNotEmpty) {
      var newvalue = textfield.text.substring(0, textfield.text.length - 1);
      setState(() {
        textfield.text = newvalue;
      });
    }
  }

  Widget inputField() {
    return Container(
      color: Colors.white,
      height: 100,
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        controller: textfield,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }

  Widget gridView() {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 100),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        children: [
          keyField("1", ""),
          keyField("2", "A B C"),
          keyField("3", "D E F"),
          keyField("4", "G H I"),
          keyField("5", "J K L"),
          keyField("6", "M N O"),
          keyField("7", "P Q R S"),
          keyField("8", "T U V"),
          keyField("9", "W X Y Z"),
          starField(),
          keyField("0", "+"),
          hashField(),
          blankField(),
          dialField(),
          backSpace()
        ],
      ),
    );
  }

  Widget keyField(numb, dsc) {
    return InkWell(
      onTap: () => onNumberTapped(numb),
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(60)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              numb,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Text(
              dsc,
              style:
                  const TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }

  Widget starField() {
    return InkWell(
      onTap: () => onNumberTapped("*"),
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(60)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "*",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget hashField() {
    return InkWell(
      onTap: () => onNumberTapped("#"),
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(60)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "#",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget backSpace() {
    if (textfield.text.isNotEmpty) {
      return InkWell(
        onTap: () => onCancelText(),
        child: Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.backspace_outlined,
                size: 30,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(height: 0);
    }
  }

  Widget dialField() {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.green[500], borderRadius: BorderRadius.circular(60)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.phone,
            size: 40,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget blankField() {
    return InkWell(
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(60)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(children: [inputField(), gridView()]),
      ),
    );
  }
}
