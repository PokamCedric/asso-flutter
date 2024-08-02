import 'package:african_windows/core/models_views/model_dropdown_filter.dart';


List<DropdownFilterModel> getDropdownFilterModels()
  =>  [
    DropdownFilterModel(
      'Field',
      'field',
      [
      'Food security, agriculture',
      'Peace-building and crisis prevention',
      'Infrastructure, ICT'
    ]),
    DropdownFilterModel(
      'Type of function',
      'type',
      [
      'Integrated Expert'
    ]),
    DropdownFilterModel(
      'Country',
      'country',
      [
      'Kenya',
      'Sri Lanka',
      'Benin',
      'Madagascar'
    ]),
  ];

