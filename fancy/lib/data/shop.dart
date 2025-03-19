import 'package:fancy/model/shop.dart';

class ProductData {
  static final List<Product> _products = [
    Product(
      id: '30',
      name: 'Casual Summer Dress',
      category: 'Dresses',
      price: 7200,
      description:
          'Lightweight and breathable summer dress with a floral print, perfect for casual outings and warm weather.',
      imageUrl: 'assets/summer_dress.jpg',
      rating: 4.8,
      reviewCount: 245,
      inStock: true,
      features: [
        'Soft and breathable fabric',
        'Flattering A-line silhouette',
        'Available in multiple floral prints',
        'Sizes XS to XL available',
        'Perfect for summer and spring wear',
      ],
      specifications: {
        'Material': 'Cotton blend',
        'Pattern': 'Floral',
        'Sizes': 'XS, S, M, L, XL',
        'Care': 'Machine washable, cold water',
        'Colors': 'Blue, Pink, Yellow, White',
      },
      relatedProducts: ['31', '32'],
    ),
    Product(
      id: '31',
      name: 'High-Waisted Jeans',
      category: 'Bottoms',
      price: 8500,
      description:
          'Classic high-waisted jeans with a flattering slim fit, designed for everyday comfort and style.',
      imageUrl: 'assets/highwaist_jeans.jpg',
      rating: 4.7,
      reviewCount: 310,
      inStock: true,
      features: [
        'Stretchable denim material',
        'Slim and flattering fit',
        'High-rise waistband for extra comfort',
        'Available in multiple washes',
        'Sizes 24 to 34 available',
      ],
      specifications: {
        'Material': 'Denim (Cotton & Elastane blend)',
        'Fit': 'Slim fit, high-rise',
        'Sizes': '24, 26, 28, 30, 32, 34',
        'Care': 'Machine washable, tumble dry low',
        'Colors': 'Light Blue, Dark Blue, Black',
      },
      relatedProducts: ['30', '32'],
    ),
    Product(
      id: '32',
      name: 'Oversized Knitted Sweater',
      category: 'Tops',
      price: 6500,
      description:
          'Cozy oversized knitted sweater, perfect for chilly days and layering over any outfit.',
      imageUrl: 'assets/knitted_sweater.jpg',
      rating: 4.9,
      reviewCount: 198,
      inStock: true,
      features: [
        'Soft and warm knitted fabric',
        'Relaxed oversized fit',
        'Versatile styling for all occasions',
        'Available in neutral colors',
        'Sizes S to XXL available',
      ],
      specifications: {
        'Material': 'Acrylic and Wool blend',
        'Fit': 'Oversized',
        'Sizes': 'S, M, L, XL, XXL',
        'Care': 'Hand wash recommended, lay flat to dry',
        'Colors': 'Beige, Gray, Brown, White',
      },
      relatedProducts: ['30', '31'],
    ),
  ];

  // Get all products
  static List<Product> getAllProducts() {
    return _products;
  }

  // Get products by category
  static List<Product> getProductsByCategory(String category) {
    return _products.where((product) => product.category == category).toList();
  }

  // Get product by ID
  static Product? getProductById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null; // Product not found
    }
  }

  // Search products
  static List<Product> searchProducts(String query) {
    if (query.isEmpty) {
      return _products;
    }

    final lowerQuery = query.toLowerCase();
    return _products.where((product) {
      return product.name.toLowerCase().contains(lowerQuery) ||
          product.description.toLowerCase().contains(lowerQuery) ||
          product.category.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  // Get featured products (for example, ones with ratings > 4.7)
  static List<Product> getFeaturedProducts() {
    return _products.where((product) => product.rating > 4.7).toList();
  }

  // Get categories
  static List<String> getCategories() {
    final categories =
        _products.map((product) => product.category).toSet().toList();
    return categories;
  }
}
