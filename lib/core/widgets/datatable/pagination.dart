import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:flutter/material.dart';

class Pagination extends StatelessWidget {
  final int totalHits;
  final int rowsPerPage;
  final int currentPage;
  final List<int> availableRowsPerPage;
  final ValueChanged<int?> onRowsPerPageChanged;
  final ValueChanged<int> onPageChanged;

  const Pagination({
    required this.totalHits,
    required this.rowsPerPage,
    required this.currentPage,
    required this.availableRowsPerPage,
    required this.onRowsPerPageChanged,
    required this.onPageChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final totalPages = (totalHits / rowsPerPage).ceil();

    return CardLayout(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Page $currentPage of $totalPages'),
          Row(
            children: [
              const Text('Hits per page: '),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    ),
                child: DropdownButton<int>(
                  value: rowsPerPage,
                  alignment: AlignmentDirectional.centerStart,
                  underline: const SizedBox(), // Remove the underline
                  padding: const EdgeInsets.only(left: 50.0),
                  dropdownColor: Theme.of(context).cardColor, // Set the background color of the dropdown list
                  items: availableRowsPerPage.map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      alignment: AlignmentDirectional.center,
                      child: Text('$value',style: Theme.of(context).textTheme.bodyLarge,),
                    );
                  }).toList(),
                  onChanged: onRowsPerPageChanged,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            height: 50,
            child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      width: 10,
                      decoration: roundedBox(context, true),
                      child: IconButton(
                          icon: Icon(Icons.chevron_left, color: currentPage > 1 ? Theme.of(context).primaryColor : Theme.of(context).canvasColor),
                          onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null
                          ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 10 ,
                      decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      border: Border.symmetric(horizontal: BorderSide(color: Theme.of(context).scaffoldBackgroundColor,))),

                      child: Text('$currentPage',)
                      ),
                    Container(width: 10,
                      decoration: roundedBox(context, false),
                      child: IconButton(
                        icon: Icon(Icons.chevron_right, color: currentPage < totalPages ? Theme.of(context).primaryColor : Theme.of(context).canvasColor),
                        onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
                      )
                    )
                  ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration roundedBox(BuildContext context, bool isLeft) {
    final  double left = isLeft? 20.0 : 0;
    final  double right = isLeft? 0 : 20.0;
    return BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Theme.of(context).scaffoldBackgroundColor),
                      borderRadius:
                      BorderRadius.only(
                        topLeft: Radius.circular(left),
                        topRight: Radius.circular(right),
                        bottomLeft: Radius.circular(left),
                        bottomRight: Radius.circular(right),
                      ),
                    );
  }
}
