import 'package:african_windows/models/model_filter.dart';
import 'package:equatable/equatable.dart';

// Événement de base pour les événements liés aux listes de Happi
abstract class HappiListingsEvent extends Equatable {
  const HappiListingsEvent();

  @override
  List<Object> get props => [];
}

// Événement pour charger les données de Happi
class LoadHappiEvent extends HappiListingsEvent {}

// Événement pour filtrer les données de Happi
class FilterHappiEvent extends HappiListingsEvent {
  final FilterModel filter;

  const FilterHappiEvent(this.filter);

  @override
  List<Object> get props => [filter];
}
