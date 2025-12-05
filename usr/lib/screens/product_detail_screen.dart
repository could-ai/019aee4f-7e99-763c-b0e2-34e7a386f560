import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              height: 300,
              // Basic error handling for images
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 300,
                  color: Colors.grey[200],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50.0, color: Colors.grey),
                  ),
                );
              },
              // Loading indicator for images
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  height: 300,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          onPressed: () {
            // Add to cart functionality to be implemented
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${product.name} added to cart!"),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart),
          label: const Text("Add to Cart"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            textStyle: const TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
