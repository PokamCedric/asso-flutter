import 'package:african_windows/app_bloc.dart';
import 'package:african_windows/apps/job/bloc/job_bloc.dart';
import 'package:african_windows/apps/job/data/filters.dart';
import 'package:african_windows/apps/job/models_views/model_filter.dart';
import 'package:african_windows/core/models_views/model_dropdown_filter.dart';
import 'package:african_windows/core/widgets/datatable/datatable_with_pagination.dart';
import 'package:african_windows/core/blocs/datatable/datatable_bloc.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';
import 'package:african_windows/core/widgets/filter/filter.dart'; // Import the adapted Filter widget
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobListingPage extends StatefulWidget {
  const JobListingPage({super.key});

  @override
  _JobListingPageState createState() => _JobListingPageState();
}

class _JobListingPageState extends State<JobListingPage> {
  final List<DropdownFilterModel> filters = getDropdownFilterModels();
  final Map<String, String> _selectedFilters = {};

  @override
  void initState() {
    super.initState();
    for (var filter in filters) {
      if (filter.items.isNotEmpty) {
        filter.items.insert(0, 'Unselected');
        _selectedFilters[filter.propertyName] = filter.items.first;
      }
    }
    // Trigger the initial load with default filters
    AppBloc.jobListingsBloc.add(FilterJobsEvent(FilterModel.fromJson(_selectedFilters)));
  }

  void _onFilterChanged(Map<String, String> newFilters) {
    setState(() {
      _selectedFilters.clear();
      _selectedFilters.addAll(newFilters);
    });
    // Trigger BLoC to fetch new data based on filters
    AppBloc.jobListingsBloc.add(FilterJobsEvent(FilterModel.fromJson(_selectedFilters)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobListingsBloc, JobListingsState>(
      builder: (jobContext, jobState) {
        if (jobState.status == JobListingsStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return BlocBuilder<DataTableBloc, DataTableState>(
          builder: (dataTableContext, dataTableState) {
            return ResponsiveLayout(
              title: 'Job Listing',
              mainContent: DataTableWithPagination(
                data: jobState.filteredJobs.map((job) => job.toJson()).toList(),
                rowsPerPage: dataTableState.rowsPerPage,
                currentPage: dataTableState.currentPage,
                availableRowsPerPage: const [5, 10, 25, 50],
                onPageChanged: (newPage) =>
                    AppBloc.dataTableBloc.add(ChangePageEvent(newPage)),
                onRowsPerPageChanged: (newRowsPerPage) =>
                    AppBloc.dataTableBloc.add(ChangeRowsPerPageEvent(newRowsPerPage!)),
              ),
              filterContent: _filterLayout(jobState.filteredJobs.length),
            );
          },
        );
      },
    );
  }

  Widget _filterLayout(int dataLength) {
    return Filter(
      totalItems: dataLength,
      filters: filters,
      selectedFilters: _selectedFilters,
      onFilterChanged: _onFilterChanged,
      filtersPerLine: 2,
    );
  }
}
