import 'package:Vio_Telehealth/models/user.dart';

class TimeTableHelper{
  static List<String> weekDaysList = [
    "Saturday",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];

  static int getAvailableDays(Map<String, List<TimeSlot>> calender) {
    int result=0;
    calender.values.forEach((v) => {
      if(v!=null && v.length>0)
        result++});
    return result;
  }

}