import 'package:flutter/material.dart';
import 'package:test_app/utils/colors/color.dart';

class LastPage extends StatefulWidget {
  const LastPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  int _currentPage = 0;

  final List<Item> items = [
    Item(
      title: 'Blue ice Blue ice Blue ice',
      quantity: 2,
      price: 10.99,
      imagePath: './assets/images/ice.png',
    ),
    Item(
      title: 'Yellow ice Blue ice Blue ice cold Blue ice',
      quantity: 1,
      price: 5.99,
      imagePath: './assets/images/ice.png',
    ),
    Item(
      title: 'Blue ice Blue ice Blue ice',
      quantity: 2,
      price: 10.99,
      imagePath: './assets/images/ice.png',
    ),
    Item(
      title: 'Yellow ice Blue ice Blue ice cold Blue ice',
      quantity: 1,
      price: 5.99,
      imagePath: './assets/images/ice.png',
    ),
    Item(
      title: 'Blue ice Blue ice Blue ice',
      quantity: 2,
      price: 10.99,
      imagePath: './assets/images/ice.png',
    ),
    Item(
      title: 'Yellow ice Blue ice Blue ice cold Blue ice',
      quantity: 1,
      price: 5.99,
      imagePath: './assets/images/ice.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bgColor,
        leading: Padding(
          padding: const EdgeInsets.all(20),
          child: IconButton(
            onPressed: () {
              // Handle back arrow icon tap
              Navigator.of(context).pop(); // Add this to navigate back
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.mainColor,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              'My Cart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Stack(
                    children: [
                      Card(
                        elevation: 2, // Add shadow
                        color: Colors.white, // White card color
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Image.asset(item.imagePath,
                                        width: 80, height: 80), // Item image
                                    const SizedBox(width: 16.0),
                                    SizedBox(
                                      width: 190,
                                      child: Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors
                                          .mainColor, // Border with mainColor
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Rounded corners
                                  ),
                                  child: Text(
                                      'Quantity: ${item.quantity}'), // Item quantity
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors
                                          .mainColor, // Border with mainColor
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Rounded corners
                                  ),
                                  child: Text(
                                      '\$${item.price.toStringAsFixed(2)}'), // Item price
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8.0, // Adjust top position as needed
                        right: 8.0, // Adjust right position as needed
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: AppColors.mainColor,
                          ),
                          onPressed: () {
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle "Buy Now" button tap
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.bgColor, // Set button color to mainColor
                  ),
                  child: const Text(
                    'Deliver to',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.mainColor, // Set text color to mainColor
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Buy Now" button tap
                  },
                  child: const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 1, // Add shadow
              color: AppColors.bgColor, // Main color for the card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$ 23.34',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color:
                                AppColors.mainColor, // Set text color to white
                          ),
                        ),
                        Text(
                          'view details',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color:
                                AppColors.mainColor, // Set text color to white
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle "Buy Now" button tap
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors
                            .mainColor, // Set button color to mainColor
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String title;
  final int quantity;
  final double price;
  final String imagePath;

  Item({
    required this.title,
    required this.quantity,
    required this.price,
    required this.imagePath,
  });
}
