import 'package:equatable/equatable.dart';

abstract class ThemeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialThemeState extends ThemeState {}

class ThemeUpdating extends ThemeState {}

class ThemeUpdated extends ThemeState {}
