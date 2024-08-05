
import 'package:african_windows/core/models/model.dart';

abstract class IdentifierModel<T> extends Model {
  final T id;

  IdentifierModel({required this.id});
}
