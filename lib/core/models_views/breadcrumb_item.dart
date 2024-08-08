class BreadcrumbItem {
  final String name;
  final String? route;
  final bool active;

  const BreadcrumbItem({required this.name, this.route, this.active = false});
}
