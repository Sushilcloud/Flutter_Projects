class Product {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavorite;
  final String description;


  const Product({
    required this.name,
    required this.category,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    this.isFavorite=false,
    required this.description,
  });
}

final List<Product> products = [
  const Product(name: 'Shoes', category: 'Footwear',
      price: 69,oldPrice: 79, imageUrl: 'assets/images/shoes2.jpg',
      description: 'This is a description of product 1'),

  const Product(name: 'Laptop', category: 'Electronics',
      price: 49, oldPrice:189,imageUrl: 'assets/images/laptop.jpg',
      description: 'This is a description of product 2'),

  const Product(name: 'Jorden Shoes', category: 'Footwear',
      price: 29,oldPrice: 205, imageUrl: 'assets/images/shoe.jpg',
      description: 'This is a description of product 3',isFavorite: true),

  const Product(name: 'Puma Shoes', category: 'Footwear',
      price: 129,oldPrice: 285, imageUrl: 'assets/images/shoe2.jpg',
      description: 'This is a description of product 3',isFavorite: true),








  ];