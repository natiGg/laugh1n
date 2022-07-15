import 'package:hive/hive.dart';

part 'theme_model.g.dart';

@HiveType(typeId: 1)
class themesetting {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int version;
}
