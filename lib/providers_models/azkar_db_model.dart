
import 'azkar_db_helper.dart';

class AzkarModelDb {
  String text1;
  String text2;
  int time;
  int azkarId;

  AzkarModelDb({this.text1, this.text2, this.azkarId,this.time});

  AzkarModelDb.fromMap(Map map) {
    this.azkarId = map[AzkarDBHelper.taskIdColumn];
    this.text1 = map[AzkarDBHelper.taskName];
  }

  Map<String, dynamic> toMap() {
    return {
      AzkarDBHelper.taskName: this.text1,
      AzkarDBHelper.taskName: this.text2,
    };
  }
}
