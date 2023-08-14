import 'package:flutter/material.dart';

class BottomNavigationBar_ShoppingScreen extends StatefulWidget {
  @override
  _BottomNavigationBar_ShoppingScreenState createState() =>
      _BottomNavigationBar_ShoppingScreenState();
}

class _BottomNavigationBar_ShoppingScreenState
    extends State<BottomNavigationBar_ShoppingScreen> {
  int _selectedIndex = 0;
  String _selectedGender = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Show modal screen based on selected index
    switch (index) {
      case 0:
        _showGenderModal(context);
        break;
      case 1:
        _showAgeModal();
        break;
      case 2:
        _showSortModal();
        break;
      case 3:
        _showFilterModal();
        break;
    }
  }

  void _showGenderModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 110,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Container(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'BOY',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      Radio(
                        value: 'BOY',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'GIRL',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      Radio(
                        value: 'GIRL',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Apply'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  void _showAgeModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200, // Adjust the height as needed
          child: const Center(
            child: Text('Age Modal'),
          ),
        );
      },
    );
  }

  void _showSortModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 260,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.rocket_launch,
                      size: 16.0, color: Colors.grey),
                  label: const Text(
                    'New Arrivals',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 30,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.star, size: 16.0, color: Colors.grey),
                  label: const Text(
                    'Best Seller',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 30,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.local_offer,
                      size: 16.0, color: Colors.grey),
                  label: const Text(
                    'Highest Discount',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 30,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_upward,
                      size: 16.0, color: Colors.grey),
                  label: const Text(
                    'Price: Low To High',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 30,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_downward,
                      size: 16.0, color: Colors.grey),
                  label: const Text(
                    'Price: High To Low',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 30,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.sort_by_alpha,
                      size: 16.0, color: Colors.grey),
                  label: const Text(
                    'Name: A To Z',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 30,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.sort_by_alpha,
                      size: 20.0, color: Colors.grey),
                  label: const Text(
                    'Name: Z To A',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 30,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.star, size: 16.0, color: Colors.grey),
                  label: const Text(
                    'Top Rated',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200, // Adjust the height as needed
          child: const Center(
            child: Text('Filter Modal'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final barHeight = screenHeight * 0.06;

    return SizedBox(
      height: barHeight,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BottomNavBarItem(
                icon: null,
                text: 'GENDER',
                isSelected: _selectedIndex == 0,
                onTap: () => _onItemTapped(0),
              ),
            ),
            Container(
              height: double.infinity,
              width: 1.0,
              color: Colors.grey,
            ),
            Expanded(
              child: BottomNavBarItem(
                icon: null,
                text: 'AGE',
                isSelected: _selectedIndex == 1,
                onTap: () => _onItemTapped(1),
              ),
            ),
            Container(
              height: double.infinity,
              width: 1.0,
              color: Colors.grey,
            ),
            Expanded(
              child: BottomNavBarItem(
                icon: Icons.sort,
                text: 'SORT',
                isSelected: _selectedIndex == 2,
                onTap: () => _onItemTapped(2),
              ),
            ),
            Container(
              height: double.infinity,
              width: 1.0,
              color: Colors.grey,
            ),
            Expanded(
              child: BottomNavBarItem(
                icon: Icons.filter_list,
                text: 'FILTER',
                isSelected: _selectedIndex == 3,
                onTap: () => _onItemTapped(3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  final IconData? icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavBarItem({
    Key? key,
    this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
                // const SizedBox(width: 2),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? Colors.black
                        : const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 2.0,
            ),
            child: Text(
              'Select',
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Colors.grey : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
