
import 'package:flutter/material.dart';

class MyUtils {
  static DateTime getDateTime(int dt) =>
      DateTime.fromMillisecondsSinceEpoch(dt * 1000);



  static List<String> getPlaceNames() => [
        "Tashkent",
        "Andijan",
        "Olmazor",
        "London",
        "Asaka",
        "Chust",
        "Fergana",
        "Samarkand",
        "Bukhara",
        "Moscow",
      ];

  static List<String> weekName = [
    'Today',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];


  static String pmOrAm(String date){
    String type = '';
    if(date.contains('13')){
      type = 'PM';
    }else if(date.contains('14')){
      type = 'PM';
    }else if(date.contains('15')){
      type = 'PM';
    }else if(date.contains('16')){
      type = 'PM';
    }else if(date.contains('17')){
      type = 'PM';
    }else if(date.contains('18')){
      type = 'PM';
    }else if(date.contains('19')){
      type = 'PM';
    }else if(date.contains('20')){
      type = 'PM';
    }else if(date.contains('21')){
      type = 'PM';
    }else if(date.contains('22')){
      type = 'PM';
    }else if(date.contains('23')){
      type = 'PM';
    }else if(date.contains('00')){
      type = 'AM';
    }else if(date.contains('01')){
      type = 'AM';
    }else if(date.contains('02')){
      type = 'AM';
    }else if(date.contains('03')){
      type = 'AM';
    }else if(date.contains('04')){
      type = 'AM';
    }else if(date.contains('05')){
      type = 'AM';
    }else if(date.contains('06')){
      type = 'AM';
    }else if(date.contains('07')){
      type = 'AM';
    }else if(date.contains('08')){
      type = 'AM';
    }else if(date.contains('09')){
      type = 'AM';
    }else if(date.contains('10')){
      type = 'AM';
    }else if(date.contains('11')){
      type = 'AM';
    }else if(date.contains('12')){
      type = 'AM';
    }
    return type;
  }
}

height(context) => MediaQuery.of(context).size.height;
width(context) => MediaQuery.of(context).size.width;