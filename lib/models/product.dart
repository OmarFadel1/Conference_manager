class product {
  final String id;
  final List<String> categories;
  final String title;
  final double price;
  final String imageUrl;

  const product(
      {required this.id,
      required this.categories,
      required this.title,
      required this.price,
      required this.imageUrl});
}
