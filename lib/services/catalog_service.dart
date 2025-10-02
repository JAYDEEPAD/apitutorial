import 'package:apitutorial/Models/Fruit.dart';

class CatalogService {
  const CatalogService();

  List<Fruit> fetchFruits() {
    return const [
      Fruit(
        id: 'apl',
        name: 'Apple',
        description: 'Crisp and sweet red apples rich in fiber.',
        price: 1.20,
        imageUrl: 'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?w=800',
      ),
      Fruit(
        id: 'ban',
        name: 'Banana',
        description: 'Ripe bananas full of potassium and energy.',
        price: 0.50,
        imageUrl: 'https://images.unsplash.com/photo-1571772805064-207c8435df79?w=800',
      ),
      Fruit(
        id: 'org',
        name: 'Orange',
        description: 'Juicy oranges packed with vitamin C.',
        price: 0.90,
        imageUrl: 'https://images.unsplash.com/photo-1547516508-4e95f0cbf63b?w=800',
      ),
      Fruit(
        id: 'str',
        name: 'Strawberry',
        description: 'Fresh strawberries, perfect for desserts.',
        price: 2.50,
        imageUrl: 'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=800',
      ),
      Fruit(
        id: 'pnp',
        name: 'Pineapple',
        description: 'Tropical pineapple, tangy and sweet.',
        price: 3.90,
        imageUrl: 'https://images.unsplash.com/photo-1502741338009-cac2772e18bc?w=800',
      ),
    ];
  }
}
