
import 'package:african_windows/models/model.dart';

abstract class IdentifierModel<T> extends Model {
  final int id;

  IdentifierModel(this.id);
}
