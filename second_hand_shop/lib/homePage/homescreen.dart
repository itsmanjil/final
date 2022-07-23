import 'package:flutter/material.dart';
import 'package:second_hand_shop/homePage/productdetails.dart';
import 'package:second_hand_shop/repository/product_repositories.dart';
import 'package:second_hand_shop/response/product_category.dart';

import '../../response/get_product_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Homepage",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.green[100],
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.send, color: Colors.black),
              onPressed: () {})
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 202, 199, 206),
                  image: DecorationImage(
                    image: AssetImage("assets/Logo.png"),
                  )),
              accountName: Text(
                "SPORTS FEVER",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "sports.fever31@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const AboutListTile(
              // <-- SEE HERE
              icon: Icon(
                Icons.info,
              ),
              applicationIcon: Icon(
                Icons.local_play,
              ),
              applicationName: 'ShopWisely',
              applicationVersion: '1.0.25',
              applicationLegalese: '© 2020 NK',
              aboutBoxChildren: [Text('Made By NK')],
              child: Text('About app'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<ProductResponse?>(
          future: ProductRepository().getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<ProductCategory> lstProductCategory = snapshot.data!.data!;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 350,
                      childAspectRatio: 1,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 20),
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return _ProductCard(lstProductCategory[index], context);
                  },
                );
              } else {
                return const Center(
                  child: Text("No data"),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _ProductCard(
    lstProductCategory,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsView(productCategory: lstProductCategory)));
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.900,
              width: MediaQuery.of(context).size.width * 0.60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.red,
                image: DecorationImage(
                  image: NetworkImage(
                    lstProductCategory.image!
                        .replaceAll('localhost', '10.0.2.2'),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(0.1),
                    child: ListTile(
                        title: Text(lstProductCategory.name!,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 243, 239, 235),
                                fontSize: 25)),
                        subtitle: Text(lstProductCategory.price!.toString(),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 250, 255, 250)))),
                  ),
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: const [],
                //     ),
                //     ElevatedButton(
                //       onPressed: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => ProductDetailsView(
                //                     productCategory: lstProductCategory)));
                //       },
                //       child: const Icon(
                //         Icons.add_shopping_cart,
                //         color: Color.fromARGB(255, 203, 19, 19),
                //         size: 22,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
