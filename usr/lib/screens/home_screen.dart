import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Product> _products = const [
    Product(
      id: 1,
      name: "Basketball",
      description: "A high-quality basketball for indoor and outdoor use. Official size and weight.",
      price: 29.99,
      imageUrl: "https://i.postimg.cc/9MLNCSLw/pexels-photo-163491.jpg",
    ),
    Product(
      id: 2,
      name: "Running Shoes",
      description: "Lightweight and comfortable running shoes with excellent cushioning.",
      price: 89.99,
      imageUrl: "https://i.postimg.cc/T10606k8/pexels-photo-2529148.jpg",
    ),
    Product(
      id: 3,
      name: "Soccer Ball",
      description: "Durable soccer ball, size 5. Perfect for training and matches.",
      price: 24.99,
      imageUrl: "https://i.postimg.cc/13TzP5x0/pexels-photo-3074920.jpg",
    ),
    Product(
      id: 4,
      name: "Tennis Racket",
      description: "A professional-grade tennis racket for power and control.",
      price: 120.00,
      imageUrl: "https://i.postimg.cc/x82Bb60B/pexels-photo-1432034.jpg",
    ),
    Product(
      id: 5,
      name: "Yoga Mat",
      description: "Eco-friendly, non-slip yoga mat for all types of yoga and pilates.",
      price: 39.99,
      imageUrl: "https://i.postimg.cc/W3s2XkS9/pexels-photo-4138033.jpg",
    ),
    Product(
      id: 6,
      name: "Dumbbells Set",
      description: "A set of adjustable dumbbells, perfect for home workouts.",
      price: 150.50,
      imageUrl: "https://i.postimg.cc/PqYq7G4S/pexels-photo-1552242.jpg",
    ),
     Product(
      id: 7,
      name: "Cycling Helmet",
      description: "A lightweight and ventilated helmet for road cycling and mountain biking.",
      price: 75.00,
      imageUrl: "https://i.postimg.cc/tJp11TjV/pexels-photo-100582.jpg",
    ),
    Product(
      id: 8,
      name: "Boxing Gloves",
      description: "16oz boxing gloves for training and sparring. Made from durable synthetic leather.",
      price: 45.99,
      imageUrl: "https://i.postimg.cc/L8YgD0YJ/pexels-photo-3412333.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SportShop"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart screen
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: _products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (ctx, i) => ProductCard(product: _products[i]),
      ),
    );
  }
}
