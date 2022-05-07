import 'package:flutter/material.dart';
import 'package:flutter_tapwyrma_07/suroolordun_meesi.dart';
import 'package:flutter_tapwyrma_07/text_button_widget.dart';

class TestApp extends StatefulWidget {
  TestApp({Key key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  List<Widget> iconkalar = <Widget>[];

  int count = 0;

  String surooText = 'Suroo Jok';

  Icon tuuraIconka = Icon(
    Icons.check,
    color: Colors.green,
    size: 40.0,
  );
  Icon tuuraEmesIconka = Icon(
    Icons.close,
    color: Colors.red,
    size: 40.0,
  );

  @override
  void initState() {
    super.initState();
    surooText = SuroolordunMeesi().suroonuAlypkel();

    // iconkalar.add(tuuraIconka);
    // iconkalar.add(tuuraEmesIconka);
  }

  void userJoopBer(bool userdinJoobu) {
    bool _chynygyJoop = suroolordunMeesi.userJoopBer();

    if (userdinJoobu == _chynygyJoop) {
      //tuura
      iconkalar.add(tuuraIconka);
    }
    //tuura emes
    else {
      iconkalar.add(tuuraEmesIconka);
    }

    suroolordunMeesi.kiyinkiSuroonuAlypkel();
    surooText = suroolordunMeesi.suroonuAlypkel();

    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Тапшырма-07',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 18.0, left: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  surooText,
                  style: TextStyle(fontSize: 32.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            surooText == 'Бутту'
                ? TextButtonWidget(
                    buttonBgColor: Color(0xff4CAF52),
                    buttonText: 'Кайрадан Башта',
                    knopka: () {
                      setState(() {
                        iconkalar = <Widget>[];
                        surooText = suroolordunMeesi.reset();
                      });
                    },
                  )
                : TextButtonWidget(
                    buttonBgColor: Color(0xff4CAF52),
                    buttonText: 'Туура',
                    knopka: () => userJoopBer(true),
                  ),
            surooText == 'Бутту'
                ? SizedBox()
                : TextButtonWidget(
                    buttonBgColor: Color(0xffF54335),
                    buttonText: 'Туура Эмес',
                    knopka: () => userJoopBer(false),
                  ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: iconkalar,
            ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }

// Bul extract metod menen korsotuldu
  // _buildExpandedButton(
  //     buttonBgColor: Color(0xff4CAF52), buttonText: 'Туура'),
  // _buildExpandedButton(
  //     buttonBgColor: Color(0xffF54335), buttonText: 'Туура Эмес'),
// misal
  // Expanded _buildExpandedButton({Color buttonBgColor, String buttonText}) {
  //   return Expanded(
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
  //       child: TextButton(
  //         onPressed: () {},
  //         child: Text(
  //           buttonText,
  //           style: TextStyle(color: Colors.white, fontSize: 32.0),
  //         ),
  //         style: ButtonStyle(
  //             backgroundColor: MaterialStateProperty.all(buttonBgColor)),
  //       ),
  //     ),
  //   );
  // }

}
