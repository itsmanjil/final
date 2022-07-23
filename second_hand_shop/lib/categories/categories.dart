import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Widget _buildInfo(BuildContext context) {
    return Positioned(
      //top: 230,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/register.png'), fit: BoxFit.cover),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 0,
              child: ListTile(
                title: const Text('AutoMobiles'),
                leading: const Icon(Icons.motorcycle_rounded),
                onTap: () {
                  // Navigator.pushNamed(context,categorydata, arguments: ScreenArguments(
                  //     ccat: 'AutoMobiles',
                  //     list: widget.list
                  // )
                  // );
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: const Text('Books & Learning'),
                leading: const Icon(Icons.book_rounded),
                onTap: () {
                  // Navigator.pushNamed(context, categorydata,
                  //     arguments: ScreenArguments(
                  //         ccat: 'AutoMobiles', list: widget.list));
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: const Text('Computer & Peripherals'),
                leading: const Icon(Icons.computer_rounded),
                onTap: () {
                  // Navigator.pushNamed(context, categorydata,
                  //     arguments: ScreenArguments(
                  //         ccat: 'AutoMobiles', list: widget.list));
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: const Text('Electronics'),
                leading: const Icon(Icons.electrical_services_rounded),
                onTap: () {
                  // Navigator.pushNamed(context, categorydata,
                  //     arguments: ScreenArguments(
                  //         ccat: 'AutoMobiles', list: widget.list));
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: const Text('Home, Furnishing & Appliances'),
                leading: const Icon(Icons.home_max_rounded),
                onTap: () {
                  // Navigator.pushNamed(context, categorydata,
                  //     arguments: ScreenArguments(
                  //         ccat: 'AutoMobiles', list: widget.list));
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: const Text('Mobile & Accessories'),
                leading: const Icon(Icons.mobile_screen_share_rounded),
                onTap: () {
                  // Navigator.pushNamed(context, categorydata,
                  //     arguments: ScreenArguments(
                  //         ccat: 'AutoMobiles', list: widget.list));
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: const Text('Musical Instrument'),
                leading: const Icon(Icons.music_note_outlined),
                onTap: () {
                  // Navigator.pushNamed(context, categorydata,
                  //     arguments: ScreenArguments(
                  //         ccat: 'AutoMobiles', list: widget.list));
                },
              ),
            ),
            const Divider(
              color: Colors.transparent,
              thickness: 5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _buildInfo(context),
          ],
        ),
      ),
    );
  }
}
