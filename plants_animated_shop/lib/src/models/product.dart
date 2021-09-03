class Product {
  final String title, imageSrc;
  final double price;

  Product({
    required this.title,
    required this.imageSrc,
    required this.price,
  });
}

List<Product> demoProducts = [
  Product(
    title: 'Cabbage',
    imageSrc: 'assets/images/img_1.png',
    price: 20.00,
  ),
  Product(
    title: 'Broccoli',
    imageSrc: 'assets/images/img_2.png',
    price: 10.00,
  ),
  Product(
    title: 'Carrot',
    imageSrc: 'assets/images/img_3.png',
    price: 18.00,
  ),
  Product(
    title: 'Pakcoy',
    imageSrc: 'assets/images/img_4.png',
    price: 15.00,
  ),
  Product(
    title: 'Test1',
    imageSrc: 'assets/images/img_4.png',
    price: 34.00,
  ),
  Product(
    title: 'Test2',
    imageSrc: 'assets/images/img_4.png',
    price: 21.00,
  ),
  Product(
    title: 'Test3',
    imageSrc: 'assets/images/img_4.png',
    price: 8.00,
  ),
];
