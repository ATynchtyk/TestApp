import 'package:flutter_tapwyrma_07/suroolor.dart';

class SuroolordunMeesi {
  int index = 0;

  List<Suroolor> suroo = [
    Suroolor(text: 'Кыргызстан Европада жайгашканбы ?', joop: false),
    Suroolor(text: 'Ч Айтматов жазуучубу ?', joop: true),
    Suroolor(text: 'Бишкек районбу ?', joop: false),
    Suroolor(text: 'Узбекистан Кыргызстан менен чектешпи ?', joop: true),
    Suroolor(text: 'Дордой базары Бишкектеби  ?', joop: true),
    Suroolor(text: 'Аскар Акаев оруспу  ?', joop: false),
  ];

  String suroonuAlypkel() {
    if (suroo.length == index) {
      return 'Бутту';
    }
    return suroo[index].text;
  }

  bool userJoopBer() {
    return suroo[index].joop;
  }

  kiyinkiSuroonuAlypkel() {
    index++;
  }

  String reset() {
    index = 0;
    return suroonuAlypkel();
  }
}

final SuroolordunMeesi suroolordunMeesi = SuroolordunMeesi();
