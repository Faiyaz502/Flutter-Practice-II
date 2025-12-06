// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart'; // For ScaffoldMessenger & fallback

// void main() {
//   runApp(const FoodDeliveryApp());
// }

// class FoodDeliveryApp extends StatelessWidget {
//   const FoodDeliveryApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       title: 'Food Delivery',
//       debugShowCheckedModeBanner: false,
//       theme: const CupertinoThemeData(
//         primaryColor: CupertinoColors.systemOrange,
//       ),
//       home: const MainScreen(),
//     );
//   }
// }

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//   final List<Map<String, dynamic>> _cartItems = [];

//   void _addToCart(Map<String, dynamic> item) {
//     setState(() {
//       final existingIndex = _cartItems.indexWhere((i) => i['name'] == item['name']);
//       if (existingIndex >= 0) {
//         _cartItems[existingIndex]['quantity'] = (_cartItems[existingIndex]['quantity'] ?? 1) + 1;
//       } else {
//         _cartItems.add({...item, 'quantity': 1});
//       }
//     });
//   }

//   void _updateCart(List<Map<String, dynamic>> items) {
//     setState(() {
//       _cartItems.clear();
//       _cartItems.addAll(items);
//     });
//   }

//   void _onItemTapped(int index) {
//     if (index == 2) {
//       Navigator.of(context).push(
//         CupertinoPageRoute(
//           builder: (context) => CartPage(
//             cartItems: _cartItems,
//             onUpdateCart: _updateCart,
//           ),
//         ),
//       );
//     } else {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screens = [
//       HomePage(
//         onRestaurantTap: (restaurant) {
//           Navigator.of(context).push(
//             CupertinoPageRoute(
//               builder: (context) => RestaurantDetailPage(
//                 restaurant: restaurant,
//                 onAddToCart: _addToCart,
//               ),
//             ),
//           );
//         },
//       ),
//       const SearchPage(),
//       const SizedBox(), // Cart handled via push
//       const OrdersPage(),
//       const ProfilePage(),
//     ];

//     return CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.house),
//             activeIcon: Icon(CupertinoIcons.house_fill),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.cart),
//             activeIcon: Icon(CupertinoIcons.cart_fill),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.list_bullet),
//             label: 'Orders',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.person),
//             activeIcon: Icon(CupertinoIcons.person_fill),
//             label: 'Profile',
//           ),
//         ],
//       ),
//       tabBuilder: (context, index) {
//         return CupertinoTabView(
//           builder: (context) => SafeArea(child: screens[index]),
//         );
//       },
//     );
//   }
// }

// // ————————————————————————————————————————
// // 🏠 HOME PAGE
// // ————————————————————————————————————————

// class HomePage extends StatelessWidget {
//   final Function(Map<String, dynamic>) onRestaurantTap;
//   const HomePage({Key? key, required this.onRestaurantTap}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverSafeArea(
//           sliver: SliverPadding(
//             padding: const EdgeInsets.all(16),
//             sliver: SliverToBoxAdapter(child: _buildHeader(context)),
//           ),
//         ),
//         SliverPadding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           sliver: SliverToBoxAdapter(child: _buildSearchBar(context)),
//         ),
//         SliverPadding(
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//           sliver: SliverToBoxAdapter(child: _buildCategories()),
//         ),
//         SliverPadding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           sliver: SliverToBoxAdapter(child: _buildPromoBanner()),
//         ),
//         SliverPadding(
//           padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
//           sliver: SliverToBoxAdapter(child: _buildSectionTitle('Popular Restaurants')),
//         ),
//         SliverToBoxAdapter(child: _buildRestaurantList(context)),
//         SliverPadding(
//           padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
//           sliver: SliverToBoxAdapter(child: _buildSectionTitle('Nearby You')),
//         ),
//         SliverList(
//           delegate: SliverChildBuilderDelegate(
//             (context, index) => _buildNearbyRestaurant(index),
//             childCount: 3,
//           ),
//         ),
//         const SliverToBoxAdapter(child: SizedBox(height: 30)),
//       ],
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const Icon(CupertinoIcons.location, color: CupertinoColors.systemOrange, size: 18),
//                 const SizedBox(width: 4),
//                 Text(
//                   'Deliver to',
//                   style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 14),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 2),
//             const Text(
//               'Dhaka, Bangladesh',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         CupertinoButton(
//           onPressed: () {},
//           minSize: 0,
//           padding: EdgeInsets.zero,
//           child: Container(
//             width: 36,
//             height: 36,
//             decoration: BoxDecoration(
//               color: CupertinoColors.systemOrange.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: const Icon(CupertinoIcons.bell, color: CupertinoColors.systemOrange, size: 18),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSearchBar(BuildContext context) {
//     return CupertinoSearchTextField(
//       placeholder: 'Search for restaurants or food...',
//       onTap: () {
//         Navigator.of(context).push(
//           CupertinoPageRoute(builder: (context) => const SearchPage()),
//         );
//       },
//     );
//   }

//   Widget _buildCategories() {
//     final categories = [
//       {'icon': CupertinoIcons.burger, 'name': 'Burger', 'color': CupertinoColors.systemOrange},
//       {'icon': CupertinoIcons.pizza, 'name': 'Pizza', 'color': CupertinoColors.systemRed},
//       {'icon': CupertinoIcons.fork_knife, 'name': 'Asian', 'color': CupertinoColors.systemGreen},
//       {'icon': CupertinoIcons.cake, 'name': 'Dessert', 'color': CupertinoColors.systemPink},
//       {'icon': CupertinoIcons.coffee, 'name': 'Coffee', 'color': CupertinoColors.systemBrown},
//     ];

//     return SizedBox(
//       height: 110,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           final cat = categories[index];
//           return Container(
//             width: 72,
//             margin: const EdgeInsets.only(right: 16),
//             child: Column(
//               children: [
//                 Container(
//                   width: 64,
//                   height: 64,
//                   decoration: BoxDecoration(
//                     color: (cat['color'] as Color).withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Icon(
//                     cat['icon'] as IconData,
//                     color: cat['color'] as Color,
//                     size: 28,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   cat['name'] as String,
//                   style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildPromoBanner() {
//     return Container(
//       height: 140,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFFFFA500), Color(0xFFFF4500)],
//         ),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.4),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Text(
//                     '30% OFF',
//                     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Special Deal\nFor Today',
//                   style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 CupertinoButton.filled(
//                   onPressed: () {},
//                   child: const Text('Order Now'),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             right: 16,
//             bottom: 12,
//             child: Transform.scale(
//               scale: 2.5,
//               child: const Icon(CupertinoIcons.tag, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
//         ),
//         CupertinoButton(
//           onPressed: () {},
//           minSize: 0,
//           padding: EdgeInsets.zero,
//           child: Text(
//             'See All',
//             style: TextStyle(color: CupertinoColors.systemOrange, fontWeight: FontWeight.w600),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildRestaurantList(BuildContext context) {
//     final restaurants = [
//       {
//         'name': 'Burger House',
//         'cuisine': 'Burgers, Fast Food',
//         'rating': 4.8,
//         'time': '20-30 min',
//         'delivery': 'Free',
//         'image': CupertinoIcons.burger,
//       },
//       {
//         'name': 'Pizza Palace',
//         'cuisine': 'Italian, Pizza',
//         'rating': 4.6,
//         'time': '25-35 min',
//         'delivery': '\$2',
//         'image': CupertinoIcons.pizza,
//       },
//     ];

//     return SizedBox(
//       height: 240,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.only(left: 16),
//         itemCount: restaurants.length,
//         itemBuilder: (context, index) {
//           final r = restaurants[index];
//           return GestureDetector(
//             onTap: () => onRestaurantTap(r),
//             child: Container(
//               width: 270,
//               margin: const EdgeInsets.only(right: 16),
//               decoration: BoxDecoration(
//                 color: CupertinoColors.systemBackground,
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: CupertinoColors.separator, width: 0.5),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 130,
//                     decoration: BoxDecoration(
//                       color: CupertinoColors.systemOrange.withOpacity(0.1),
//                       borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//                     ),
//                     child: Center(
//                       child: Icon(
//                         r['image'] as IconData,
//                         size: 56,
//                         color: CupertinoColors.systemOrange,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(14),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           r['name'] as String,
//                           style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           r['cuisine'] as String,
//                           style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 13),
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             const Icon(CupertinoIcons.star_fill, color: CupertinoColors.systemYellow, size: 16),
//                             const SizedBox(width: 4),
//                             Text('${r['rating']}'),
//                             const SizedBox(width: 14),
//                             const Icon(CupertinoIcons.clock, color: CupertinoColors.systemGrey, size: 16),
//                             const SizedBox(width: 4),
//                             Text(r['time'] as String),
//                             const Spacer(),
//                             Text(
//                               r['delivery'] as String,
//                               style: const TextStyle(color: CupertinoColors.systemOrange, fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildNearbyRestaurant(int index) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: CupertinoColors.systemBackground,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: CupertinoColors.separator, width: 0.5),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(
//               color: CupertinoColors.systemOrange.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Icon(CupertinoIcons.shop, color: CupertinoColors.systemOrange, size: 32),
//           ),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Restaurant ${index + 1}',
//                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 3),
//                 Text(
//                   'Various cuisines',
//                   style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 13),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     const Icon(CupertinoIcons.star_fill, color: CupertinoColors.systemYellow, size: 16),
//                     const SizedBox(width: 4),
//                     const Text('4.5'),
//                     const SizedBox(width: 12),
//                     Icon(CupertinoIcons.location, color: CupertinoColors.systemGrey2, size: 16),
//                     const SizedBox(width: 4),
//                     Text('${index + 1}.${index + 2} km'),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ————————————————————————————————————————
// // 🔍 SEARCH PAGE
// // ————————————————————————————————————————

// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(middle: Text('Search')),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             CupertinoSearchTextField(
//               placeholder: 'Search for food or restaurants...',
//             ),
//             const SizedBox(height: 24),
//             Expanded(
//               child: Center(
//                 child: Text(
//                   'Start searching for your favorite food',
//                   style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ————————————————————————————————————————
// // 🍔 RESTAURANT DETAIL
// // ————————————————————————————————————————

// class RestaurantDetailPage extends StatelessWidget {
//   final Map<String, dynamic> restaurant;
//   final Function(Map<String, dynamic>) onAddToCart;

//   const RestaurantDetailPage({
//     Key? key,
//     required this.restaurant,
//     required this.onAddToCart,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final menuItems = [
//       {'name': 'Classic Burger', 'price': 8.99, 'description': 'Beef patty with lettuce, tomato, cheese'},
//       {'name': 'Cheeseburger', 'price': 9.99, 'description': 'Double cheese with special sauce'},
//       {'name': 'Chicken Burger', 'price': 7.99, 'description': 'Crispy chicken with mayo'},
//     ];

//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text(restaurant['name'] as String),
//         leading: CupertinoButton(
//           padding: EdgeInsets.zero,
//           child: const Icon(CupertinoIcons.back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       child: CustomScrollView(
//         slivers: [
//           SliverFillBoxAdapter(
//             height: 200,
//             child: Container(
//               color: CupertinoColors.systemOrange,
//               child: Center(
//                 child: Icon(
//                   restaurant['image'] as IconData,
//                   size: 80,
//                   color: CupertinoColors.white,
//                 ),
//               ),
//             ),
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.all(16),
//             sliver: SliverList(
//               delegate: SliverChildListDelegate([
//                 Text(
//                   restaurant['cuisine'] as String,
//                   style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 16),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text('Menu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 16),
//                 ...List.generate(menuItems.length, (i) {
//                   final item = menuItems[i];
//                   return Container(
//                     margin: const EdgeInsets.only(bottom: 12),
//                     padding: const EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       color: CupertinoColors.systemBackground,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: CupertinoColors.separator, width: 0.5),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 64,
//                           height: 64,
//                           decoration: BoxDecoration(
//                             color: CupertinoColors.systemOrange.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: const Icon(CupertinoIcons.burger, color: CupertinoColors.systemOrange),
//                         ),
//                         const SizedBox(width: 14),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(item['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
//                               const SizedBox(height: 4),
//                               Text(
//                                 item['description'] as String,
//                                 style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 13),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 '\$${item['price']}',
//                                 style: TextStyle(color: CupertinoColors.systemOrange, fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                         CupertinoButton.filled(
//                           onPressed: () {
//                             onAddToCart(item);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('${item['name']} added to cart'),
//                                 backgroundColor: CupertinoColors.systemGreen,
//                                 duration: const Duration(seconds: 1),
//                               ),
//                             );
//                           },
//                           child: const Text('Add'),
//                         ),
//                       ],
//                     ),
//                   );
//                 }),
//               ]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ————————————————————————————————————————
// // 🛒 CART PAGE
// // ————————————————————————————————————————

// class CartPage extends StatefulWidget {
//   final List<Map<String, dynamic>> cartItems;
//   final Function(List<Map<String, dynamic>>) onUpdateCart;
//   const CartPage({Key? key, required this.cartItems, required this.onUpdateCart}) : super(key: key);

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   late List<Map<String, dynamic>> items;

//   @override
//   void initState() {
//     super.initState();
//     items = List.from(widget.cartItems);
//   }

//   double get subtotal => items.fold(0.0, (sum, item) => sum + (item['price'] as double) * (item['quantity'] as int));
//   double get deliveryFee => 2.99;
//   double get total => subtotal + deliveryFee;

//   void _updateQuantity(int index, int delta) {
//     setState(() {
//       final item = items[index];
//       if (delta == -1 && item['quantity'] > 1) {
//         item['quantity']--;
//       } else if (delta == -1) {
//         items.removeAt(index);
//       } else if (delta == 1) {
//         item['quantity']++;
//       }
//       widget.onUpdateCart(items);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: const Text('Cart'),
//         trailing: CupertinoButton(
//           padding: EdgeInsets.zero,
//           minSize: 0,
//           child: const Icon(CupertinoIcons.trash),
//           onPressed: () {
//             if (items.isNotEmpty) {
//               items.clear();
//               widget.onUpdateCart(items);
//             }
//           },
//         ),
//       ),
//       child: items.isEmpty
//           ? Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(CupertinoIcons.cart, size: 80, color: CupertinoColors.systemGrey),
//                   const SizedBox(height: 16),
//                   const Text('Your cart is empty', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//                   const SizedBox(height: 8),
//                   Text('Add items to see them here', style: TextStyle(color: CupertinoColors.systemGrey)),
//                 ],
//               ),
//             )
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: items.length,
//                     itemBuilder: (context, index) {
//                       final item = items[index];
//                       return Container(
//                         margin: const EdgeInsets.only(bottom: 12),
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: CupertinoColors.systemBackground,
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(color: CupertinoColors.separator, width: 0.5),
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 60,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 color: CupertinoColors.systemOrange.withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: const Icon(CupertinoIcons.burger, color: CupertinoColors.systemOrange),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(item['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     '\$${item['price']}',
//                                     style: TextStyle(color: CupertinoColors.systemOrange, fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 CupertinoButton(
//                                   onPressed: () => _updateQuantity(index, -1),
//                                   child: Container(
//                                     width: 28,
//                                     height: 28,
//                                     decoration: BoxDecoration(
//                                       color: CupertinoColors.systemGrey5,
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: const Icon(CupertinoIcons.minus, size: 16),
//                                   ),
//                                 ),
//                                 Text(
//                                   '${item['quantity']}',
//                                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                                 ),
//                                 CupertinoButton(
//                                   onPressed: () => _updateQuantity(index, 1),
//                                   child: Container(
//                                     width: 28,
//                                     height: 28,
//                                     decoration: BoxDecoration(
//                                       color: CupertinoColors.systemOrange,
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: const Icon(CupertinoIcons.add, color: CupertinoColors.white, size: 16),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: CupertinoColors.systemBackground,
//                     border: Border(top: BorderSide(color: CupertinoColors.separator, width: 0.5)),
//                   ),
//                   child: Column(
//                     children: [
//                       _buildPriceRow('Subtotal', subtotal),
//                       const SizedBox(height: 8),
//                       _buildPriceRow('Delivery Fee', deliveryFee),
//                       const Divider(height: 20),
//                       _buildPriceRow('Total', total, isTotal: true),
//                       const SizedBox(height: 16),
//                       SizedBox(
//                         width: double.infinity,
//                         child: CupertinoButton.filled(
//                           onPressed: () {
//                             Navigator.of(context).push(
//                               CupertinoPageRoute(
//                                 builder: (context) => CheckoutPage(cartItems: items, total: total),
//                               ),
//                             );
//                           },
//                           child: const Text('Proceed to Checkout'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }

//   Widget _buildPriceRow(String label, double amount, {bool isTotal = false}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: isTotal ? 18 : 16,
//             fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//         Text(
//           '\$${amount.toStringAsFixed(2)}',
//           style: TextStyle(
//             fontSize: isTotal ? 20 : 16,
//             fontWeight: FontWeight.bold,
//             color: isTotal ? CupertinoColors.systemOrange : CupertinoColors.label,
//           ),
//         ),
//       ],
//     );
//   }
// }

// // ————————————————————————————————————————
// // 💳 CHECKOUT PAGE
// // ————————————————————————————————————————

// class CheckoutPage extends StatefulWidget {
//   final List<Map<String, dynamic>> cartItems;
//   final double total;
//   const CheckoutPage({Key? key, required this.cartItems, required this.total}) : super(key: key);

//   @override
//   State<CheckoutPage> createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   int selectedPayment = 0;

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(middle: Text('Checkout')),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildSection(
//               'Delivery Address',
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: CupertinoColors.systemOrange.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Icon(CupertinoIcons.location, color: CupertinoColors.systemOrange),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
//                         SizedBox(height: 4),
//                         Text('Dhanmondi, Dhaka 1209, Bangladesh'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             _buildSection(
//               'Payment Method',
//               Column(
//                 children: [
//                   _buildPaymentOption(0, CupertinoIcons.creditcard, 'Credit Card', '**** 4242'),
//                   const SizedBox(height: 12),
//                   _buildPaymentOption(1, CupertinoIcons.wallet, 'Digital Wallet', 'bKash'),
//                   const SizedBox(height: 12),
//                   _buildPaymentOption(2, CupertinoIcons.money_dollar, 'Cash on Delivery', 'Pay on delivery'),
//                 ],
//               ),
//             ),
//             _buildSection(
//               'Order Summary',
//               Column(
//                 children: [
//                   ...widget.cartItems.map((item) => Padding(
//                         padding: const EdgeInsets.only(bottom: 12),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('${item['quantity']}x ${item['name']}'),
//                             Text(
//                               '\$${((item['price'] as double) * (item['quantity'] as int)).toStringAsFixed(2)}',
//                               style: const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       )),
//                   const Divider(),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text('Delivery Fee'),
//                       Text('\$${(widget.total - widget.cartItems.fold<double>(0, (sum, item) => sum + (item['price'] as double) * (item['quantity'] as int))).toStringAsFixed(2)}'),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                       Text(
//                         '\$${widget.total.toStringAsFixed(2)}',
//                         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: CupertinoColors.systemOrange),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//       childBottom: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SizedBox(
//             width: double.infinity,
//             child: CupertinoButton.filled(
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                   CupertinoPageRoute(builder: (context) => const OrderTrackingPage()),
//                 );
//               },
//               child: const Text('Place Order'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSection(String title, Widget content) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: CupertinoColors.systemBackground,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: CupertinoColors.separator, width: 0.5),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 12),
//           content,
//         ],
//       ),
//     );
//   }

//   Widget _buildPaymentOption(int index, IconData icon, String title, String subtitle) {
//     final isSelected = selectedPayment == index;
//     return GestureDetector(
//       onTap: () => setState(() => selectedPayment = index),
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: isSelected ? CupertinoColors.systemOrange.withOpacity(0.1) : CupertinoColors.systemGrey5,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(
//             color: isSelected ? CupertinoColors.systemOrange : CupertinoColors.clear,
//             width: 2,
//           ),
//         ),
//         child: Row(
//           children: [
//             Icon(icon, color: isSelected ? CupertinoColors.systemOrange : CupertinoColors.systemGrey),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//                   Text(subtitle, style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 13)),
//                 ],
//               ),
//             ),
//             if (isSelected) const Icon(CupertinoIcons.check_mark, color: CupertinoColors.systemOrange),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ————————————————————————————————————————
// // 🚚 ORDER TRACKING
// // ————————————————————————————————————————

// class OrderTrackingPage extends StatelessWidget {
//   const OrderTrackingPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(middle: Text('Track Order')),
//       child: CustomScrollView(
//         slivers: [
//           SliverFillBoxAdapter(
//             height: 240,
//             child: Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFFFFA500), Color(0xFFFF4500)],
//                 ),
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Order #12345', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 8),
//                     const Text('Estimated delivery: 25 mins', style: TextStyle(color: Colors.white)),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       width: 300,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _buildStatus(CupertinoIcons.check_mark, 'Confirmed', true),
//                           _buildStatus(CupertinoIcons.clock, 'Preparing', true),
//                           _buildStatus(CupertinoIcons.truck, 'On way', false),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   _buildDriverCard(),
//                   const SizedBox(height: 16),
//                   _buildOrderSummary(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       childBottom: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             children: [
//               Expanded(
//                 child: CupertinoButton(
//                   onPressed: () {},
//                   color: CupertinoColors.systemGrey5,
//                   child: const Text('Call Restaurant'),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: CupertinoButton.filled(
//                   onPressed: () {},
//                   child: const Text('Call Driver'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildStatus(IconData icon, String label, bool isActive) {
//     return Column(
//       children: [
//         Container(
//           width: 40,
//           height: 40,
//           decoration: BoxDecoration(
//             color: isActive ? Colors.white : Colors.white.withOpacity(0.3),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(icon, color: isActive ? CupertinoColors.systemOrange : Colors.white, size: 20),
//         ),
//         const SizedBox(height: 8),
//         Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
//       ],
//     );
//   }

//   Widget _buildDriverCard() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: CupertinoColors.systemBackground,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: CupertinoColors.separator, width: 0.5),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               color: CupertinoColors.systemOrange.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Icon(CupertinoIcons.person, color: CupertinoColors.systemOrange),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text('Karim Ahmed', style: TextStyle(fontWeight: FontWeight.bold)),
//                 SizedBox(height: 4),
//                 Text('4.9 ★ • Motorcycle'),
//               ],
//             ),
//           ),
//           const Icon(CupertinoIcons.phone, color: CupertinoColors.systemOrange),
//         ],
//       ),
//     );
//   }

//   Widget _buildOrderSummary() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: CupertinoColors.systemBackground,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: CupertinoColors.separator, width: 0.5),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('Order Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//           const SizedBox(height: 12),
//           _buildRow('2x Classic Burger', '\$17.98'),
//           _buildRow('1x Chicken Burger', '\$7.99'),
//           const Divider(height: 20),
//           _buildRow('Subtotal', '\$25.97'),
//           _buildRow('Delivery Fee', '\$2.99'),
//           const SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//               Text('\$28.96', style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.systemOrange, fontSize: 18)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label),
//           Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
//         ],
//       ),
//     );
//   }
// }

// // ————————————————————————————————————————
// // 📜 ORDERS PAGE
// // ————————————————————————————————————————

// class OrdersPage extends StatelessWidget {
//   const OrdersPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(middle: Text('Orders')),
//       child: CustomScrollView(
//         slivers: [
//           const SliverSafeArea(
//             sliver: SliverPadding(
//               padding: EdgeInsets.all(16),
//               sliver: SliverToBoxAdapter(
//                 child: Text('My Orders', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 final isCurrent = index == 0;
//                 return Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//                   padding: const EdgeInsets.all(14),
//                   decoration: BoxDecoration(
//                     color: CupertinoColors.systemBackground,
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: CupertinoColors.separator, width: 0.5),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Order #${12345 - index}', style: const TextStyle(fontWeight: FontWeight.bold)),
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                             decoration: BoxDecoration(
//                               color: isCurrent
//                                   ? CupertinoColors.systemOrange.withOpacity(0.2)
//                                   : CupertinoColors.systemGreen.withOpacity(0.2),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Text(
//                               isCurrent ? 'In Progress' : 'Delivered',
//                               style: TextStyle(
//                                 color: isCurrent ? CupertinoColors.systemOrange : CupertinoColors.systemGreen,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Text('Burger House', style: TextStyle(color: CupertinoColors.systemGrey)),
//                       const SizedBox(height: 4),
//                       Text('2 items • \$28.96', style: TextStyle(color: CupertinoColors.systemGrey)),
//                       if (isCurrent)
//                         CupertinoButton.filled(
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           onPressed: () {
//                             Navigator.of(context).push(
//                               CupertinoPageRoute(builder: (context) => const OrderTrackingPage()),
//                             );
//                           },
//                           child: const Text('Track Order'),
//                         ),
//                     ],
//                   ),
//                 );
//               },
//               childCount: 5,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ————————————————————————————————————————
// // 👤 PROFILE PAGE
// // ————————————————————————————————————————

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(middle: Text('Profile')),
//       child: CustomScrollView(
//         slivers: [
//           SliverSafeArea(
//             sliver: SliverPadding(
//               padding: const EdgeInsets.all(16),
//               sliver: SliverToBoxAdapter(
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 90,
//                       height: 90,
//                       decoration: BoxDecoration(
//                         color: CupertinoColors.systemOrange.withOpacity(0.2),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(CupertinoIcons.person, size: 48, color: CupertinoColors.systemOrange),
//                     ),
//                     const SizedBox(height: 14),
//                     const Text('John Doe', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 4),
//                     Text('john.doe@email.com', style: TextStyle(color: CupertinoColors.systemGrey)),
//                     const SizedBox(height: 2),
//                     Text('+880 1234-567890', style: TextStyle(color: CupertinoColors.systemGrey)),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate([
//               _buildMenuItem(CupertinoIcons.person, 'Edit Profile', () {}),
//               _buildMenuItem(CupertinoIcons.location, 'Addresses', () {}),
//               _buildMenuItem(CupertinoIcons.creditcard, 'Payment Methods', () {}),
//               _buildMenuItem(CupertinoIcons.bell, 'Notifications', () {}),
//               _buildMenuItem(CupertinoIcons.question, 'Help & Support', () {}),
//               _buildMenuItem(CupertinoIcons.info, 'About', () {}),
//               _buildMenuItem(CupertinoIcons.power, 'Logout', () {}, isDestructive: true),
//               const SizedBox(height: 30),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
//     return CupertinoListTile(
//       leading: Icon(icon, color: isDestructive ? CupertinoColors.systemRed : CupertinoColors.systemOrange),
//       title: Text(
//         title,
//         style: TextStyle(
//           fontWeight: FontWeight.w600,
//           color: isDestructive ? CupertinoColors.systemRed : CupertinoColors.label,
//         ),
//       ),
//       trailing: const Icon(CupertinoIcons.forward, color: CupertinoColors.systemGrey2),
//       onTap: onTap,
//     );
//   }
// }