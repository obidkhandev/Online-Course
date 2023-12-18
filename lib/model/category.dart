class Category {
  final String name;
  final int number;
  final String image;

  Category(this.name, this.number, this.image);
}

List<Category> category = categoryData
    .map((item) =>
        Category(item['name'] as String, item['number'] as int, item['image'] as String))
    .toList();

var categoryData = [
  {'name': 'Marketing', 'number': 17, 'image': 'assets/images/marketing.png'},
  {'name': 'UX Design', 'number': 21, 'image': 'assets/images/ux_design.png'},
  {
    'name': 'Photography',
    'number': 12,
    'image': 'assets/images/photography.png'
  },
  {'name': 'Business', 'number': 12, 'image': 'assets/images/business.png'},
];
