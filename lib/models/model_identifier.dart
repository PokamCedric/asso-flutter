
import 'package:african_windows/models/model.dart';

abstract class IdentifierModel<T> extends Model {
  final T id;

  IdentifierModel(this.id);
}
