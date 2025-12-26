import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/widgets/product_card.dart';
import 'package:shop_app/pages/product_details_page.dart';

class HomePageProductTab extends StatefulWidget {
  const HomePageProductTab({super.key});

  @override
  State<HomePageProductTab> createState() => _HomePageProductTabState();
}

class _HomePageProductTabState extends State<HomePageProductTab> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Bata',
    'Jordan',
  ];
  late String selectedFilter;
  late List<Map<String, Object>> filteredProducts;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
    filteredProducts = products;
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery is used to make the app or website responsive
    // as it gives many features like size of device, etc
    // final screenSize = MediaQuery.sizeOf(context);

    final border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    // SafeArea widget ignores top & bottom notch
    // and place widgets in the area between top & bottom notch
    return SafeArea(
      child: Column(
        children: [
          // header section (title & search bar)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              // Expanded widget tells flutter to take space how much available
              // useful for widget which always take full width (e.g. TextField)
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          // filters below header section
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // filters functionality
                        selectedFilter = filter;
                        if (filter == 'All') {
                          filteredProducts = products;
                        } else {
                          filteredProducts = products
                              .where(
                                (product) => product['title']
                                    .toString()
                                    .contains(filter),
                              )
                              .toList();
                        }
                      });
                    },
                    // chip widget provides a compact element holding an icon and text
                    // used for showing tags, filters, etc
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // product cards section
          Expanded(
            // Difference b/w LayoutBuilder & MediaQuery
            // LayoutBuilder
            // =====> can adapt to the parent widget's size and constraints
            // MediaQuery
            // =====> takes entire device size
            // =====> doesn't care about constraints on the widgets

            // LayoutBuilder is used to build a widget tree
            // that can adapt to the parent widget's size and constraints
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 1080) {
                  // for websites & webApps
                  return GridView.builder(
                    itemCount: filteredProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.75,
                        ),
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigator is used to navigate from one screen to another
                          // push helps in adding another screen to stack
                          // pop helps in removing the top-most screen
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  );
                } else {
                  // for mobile screens
                  return ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigator is used to navigate from one screen to another
                          // push helps in adding another screen to stack
                          // pop helps in removing the top-most screen
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
