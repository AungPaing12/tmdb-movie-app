import 'package:hive_flutter/hive_flutter.dart';
import '../../../constant/hive_constant.dart';
import '../cast_vo/cast_vo.dart';
part 'cast_hive_vo.g.dart';
@HiveType(typeId: kCastHiveTypeID)

class CastHiveVO {

  @HiveField(0)
  List<CastVO>? castList;


  CastHiveVO(this.castList);
}