import 'package:african_windows/models/model_dropdown_filter.dart';
import 'package:african_windows/pages/card_layout.dart';
import 'package:african_windows/shared/widgets/filter/custom_dropdown.dart';
import 'package:african_windows/shared/constants/defaults.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  final List<DropdownFilterModel> filters;
  final int totalItems;
  final int filtersPerLine;
  final ValueChanged<Map<String, dynamic>> onFilterChanged;

  const Filter({
    super.key,
    required this.filters,
    required this.onFilterChanged,
    required this.totalItems,
    this.filtersPerLine = 1,
  });

  @override
  State<Filter> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<Filter> {
  bool _isExpanded = true;
  final double _containerPadding = 10.0;
  final Map<String, String> _selectedFilters = {};

  @override
  void initState() {
    super.initState();
    // Initialize _selectedFilters with the first item of each filter's items list
    for (var filter in widget.filters) {
      if (filter.items.isNotEmpty) {
        _selectedFilters[filter.propertyName] = filter.items.first;
      }
    }
  }

  BoxDecoration filterBoxDecoration({Color color = Colors.grey}) => BoxDecoration(
    border: Border.all(color: color),
    borderRadius: BorderRadius.zero,
  );

  @override
  Widget build(BuildContext context) {
    return CardLayout(
      paddingFactor: 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SEARCH AGAIN',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Icon(_isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
          divider(Theme.of(context).primaryColor),
          Padding(
            padding: EdgeInsets.all(_containerPadding),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState:
                  _isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: buildFilters(context),
              secondChild: Container(), // Empty container when collapsed
            ),
          ),
        ],
      ),
    );
  }

  Column buildFilters(BuildContext context) {
    List<Widget> filterWidgets = [];
    List<Widget> rowChildren = [];

    for (int i = 0; i < widget.filters.length; i++) {
      var filter = widget.filters[i];

      rowChildren.add(
        Expanded(
          child: CustomDropdown(
            label: filter.propertyName,
            items: filter.items,
            value: _selectedFilters[filter.propertyName]!,
            filterBoxDecoration: filterBoxDecoration(),
            onChanged: (value) {
              setState(() {
                _selectedFilters[filter.propertyName] = value!;
              });
              widget.onFilterChanged(_selectedFilters);
            },
          ),
        )
      );

      // Add row of filters to column if row is full or it's the last item
      if (rowChildren.length == widget.filtersPerLine || i == widget.filters.length - 1) {
        filterWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rowChildren,
            ),
          ),
        );
        rowChildren = [];
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
                  // style: Theme.of(context).textTheme.labelLarge,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    border: AppDefaults.outlineInputBorder,
                    focusedBorder: AppDefaults.focusedOutlineInputBorder,
                  ),
                ),
        const SizedBox(height: 20.0),
        ...filterWidgets,
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor, // Background color
              foregroundColor: Theme.of(context).indicatorColor, // Text color
            ),
            onPressed: () {
              widget.onFilterChanged(_selectedFilters);
            },
            child: Text('${widget.totalItems} found'),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _selectedFilters.clear();
              // Reinitialize with the first item of each filter's items list
              for (var filter in widget.filters) {
                if (filter.items.isNotEmpty) {
                  _selectedFilters[filter.propertyName] = filter.items.first;
                }
              }
            });
            widget.onFilterChanged(_selectedFilters);
          },
          child: const Text('Reset'),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Row divider(Color color) {
    return Row(children: <Widget>[
      Expanded(
        child: Divider(
          color: color,
          height: 10,
        ),
      ),
    ]);
  }
}
