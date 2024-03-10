import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_app/secondpage.dart';
import 'package:test_app/utils/colors/color.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

List<String> imagePaths = [
  "./assets/images/ice.png",
  "./assets/images/ice0.png",
  "./assets/images/ice1.png",
  "./assets/images/ice2.png",
  "./assets/images/ice3.png",
  "./assets/images/ice4.png",
];

class _FirstPageState extends State<FirstPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _selectedFilterIndex = 0;
  final int _selectedGridIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
              // Handle menu icon tap
            },
            icon: const Icon(
              Icons.menu,
              color: AppColors.mainColor,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: IconButton(
              onPressed: () {
                // Handle shopping cart icon tap
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.mainColor,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.mainColor,
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.mainColor,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FilterButton('All', isSelected: _selectedFilterIndex == 0,
                    onPressed: () {
                  setState(() {
                    _selectedFilterIndex = 0;
                  });
                }),
                FilterButton('New', isSelected: _selectedFilterIndex == 1,
                    onPressed: () {
                  setState(() {
                    _selectedFilterIndex = 1;
                  });
                }),
                FilterButton('Category', isSelected: _selectedFilterIndex == 2,
                    onPressed: () {
                  setState(() {
                    _selectedFilterIndex = 2;
                  });
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 8, left: 8),
            child: SizedBox(
              height: 400,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: 2,
                      itemBuilder: (context, pageIndex) {
                        return SizedBox(
                          height: 300, // Set the desired height here
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              childAspectRatio: 0.9,
                            ),
                            itemCount: imagePaths.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(6),
                                child: GridItem(
                                  isSelected: index == _selectedGridIndex,
                                  imagePath: imagePaths[index],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  buildPageIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.mainColor, // Color for selected items
        unselectedItemColor: AppColors.mainColor
            .withOpacity(0.5), // Color for unselected items with opacity
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_giftcard,
            ),
            label: 'Gifts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Me',
          ),
        ],
      ),
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        2,
        (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: 10,
            height: 10,
            child: Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _currentPage == index
                        ? AppColors.mainColor
                        : Colors.black,
                    width: 0.3,
                  ),
                  color: _currentPage == index
                      ? AppColors.mainColor
                      : Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FilterButton extends StatefulWidget {
  final String label;
  final bool isSelected;

  const FilterButton(this.label,
      {Key? key, required this.isSelected, required Null Function() onPressed})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle filter button tap
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8.0), // Adjust the radius as needed
        ),
        backgroundColor: widget.isSelected
            ? AppColors.mainColor
            : AppColors.bgColor, // Orange background when selected
        side: const BorderSide(
          color: AppColors.mainColor, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: Text(
        widget.label,
        style: TextStyle(
          color: widget.isSelected
              ? AppColors.bgColor
              : AppColors.mainColor, // White text when selected
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final bool isSelected;
  final String imagePath;

  const GridItem({Key? key, this.isSelected = false, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final String price = (random.nextDouble() * 10).toStringAsFixed(2);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SecondPage(),
          ),
        );
      },
      child: SizedBox(
        height: 450,
        child: Card(
          color: isSelected ? AppColors.mainColor : Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.favorite_border,
                  color: isSelected ? Colors.white : AppColors.mainColor,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(imagePath),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  "\$$price",
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
