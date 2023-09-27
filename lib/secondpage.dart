import 'package:flutter/material.dart';
import 'package:test_app/lastpage.dart';
import 'package:test_app/utils/colors/color.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        leading: Padding(
          padding: const EdgeInsets.all(20),
          child: IconButton(
            onPressed: () {
              // Handle back arrow icon tap
              Navigator.of(context).pop(); // Add this to navigate back
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.bgColor,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: AppColors.bgColor.withOpacity(0.2),
                shape: BoxShape.circle, // Make the container circular
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    // Handle shopping cart icon tap
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: AppColors.bgColor, // Color of the icon
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: PageView.builder(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        itemCount: 2, // Define the number of pages
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page; // Update the current page index
          });
        },
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /
                      2.2, // Half of the screen height
                  decoration: const BoxDecoration(
                    color: AppColors
                        .mainColor, // Background color for the top half
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(20), // Left-bottom corner radius
                      bottomRight:
                          Radius.circular(20), // Right-bottom corner radius
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2, // Takes two-thirds of the available space
                        child: Image.asset(
                          './assets/images/ice.png',
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly, // Center vertically
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceEvenly, // Center vertically
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SmallCard(
                                icon: Icons.shopping_cart_outlined,
                                onTapCallback: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        // Replace this with the page you want to navigate to
                                        return const LastPage();
                                      },
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                  height: 20), // Add spacing between the cards
                              SmallCard(
                                icon: Icons.add,
                                onTapCallback: () {},
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20, bottom: 20),
                            child: Expanded(
                              flex: 1, // Takes one-third of the available space
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.end, // Center vertically
                                crossAxisAlignment: CrossAxisAlignment
                                    .end, // Center horizontally
                                children: [
                                  const Text(
                                    '\$ 13.99 ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10), // Add spacing
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        const Icon(
                                          Icons.star,
                                          color: Colors.white,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Blue moon',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'This is a description with up to 30 words. It can be longer or shorter as needed.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle the button press
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: AppColors.mainColor,
                                backgroundColor: Colors.white,
                                fixedSize: const Size(120, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      5), // Set the border radius to 0 for rectangles
                                ),
                              ),
                              child: const Text('View Ingredients'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Handle the button press
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: AppColors.mainColor,
                                fixedSize: const Size(120, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      5), // Same border radius as the first button
                                ),
                              ),
                              child: const Text('Order'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                buildPageIndicator(),
              ],
            ),
          );
        },
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

class SmallCard extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTapCallback;

  const SmallCard({
    Key? key,
    required this.icon,
    required this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.bgColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
