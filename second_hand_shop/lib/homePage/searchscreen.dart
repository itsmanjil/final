import 'package:flutter/material.dart';

import '../sizeanddecoration/constants.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? searchString;
  String? _choosedString;
  List _list = [];
  List? _morefilerlist;
  List category = [
    "No Category Selected",
    "AutoMobiles",
    "Books and Learning",
    "Computer and Pheripherals",
    "Electronics",
    "Mobile and Accessories",
    "Musical Instrument",
    "Home, Furnishing & Appliances"
  ];
  Widget _dropdownCategory() {
    return DropdownButton(
      hint: const Text("Select Category"),
      value: _choosedString,
      onChanged: (value) {
        setState(() {
          _choosedString = value as String?;
          searchmorelist(_choosedString!);
        });
      },
      items: category.map((val) {
        return DropdownMenuItem(
          value: val,
          child: Text(val),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      LightColor.background,
                      LightColor.background,
                      LightColor.background,
                      LightColor.background,
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  )),
                ),
                Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                        child: Container(
                          width: size.width * 0.7,
                          height: 40,
                          decoration: BoxDecoration(
                            color: LightColor.primaryColor.withOpacity(0.02),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: LightColor.primaryColor,
                              width: 1.5,
                            ),
                          ),
                          child: TextField(
                            autofocus: false,
                            decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "Search By address",
                                prefixIcon: Icon(Icons.search),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 5,
                                )),
                            onChanged: (val) {
                              setState(() {
                                searchString = val.toLowerCase();
                                searchProduct(searchString!);
                              });
                            },
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    _dropdownCategory(),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 500,
                      height: 500,
                      child: (searchString == null || searchString == '')
                          ? const Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text("What are you looking for?"))
                          : ListView.builder(
                              itemCount: _list.length,
                              itemBuilder: (context, index) {
                                var prd = _list[index];
                                if (_choosedString == null) {
                                  return (_list.isEmpty)
                                      ? const Center(
                                          child: Text(
                                              "No Such Product result found"))
                                      : GestureDetector(
                                          onTap: () {},
                                          child: SizedBox(
                                            width: size.width,
                                            height: 90,
                                            child: Card(
                                              child: ListTile(
                                                title: Text(
                                                  prd["product_name"],
                                                ),
                                                subtitle:
                                                    Text("Rs.${prd['price']}"),
                                                leading: Image.network(
                                                  prd["image_url"].toString(),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                }
                                return GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: size.width,
                                    height: 90,
                                    child: Card(
                                      child: ListTile(
                                        title: Text(
                                          prd["product_name"]!,
                                        ),
                                        subtitle: Text("Rs.${prd["price"]}"),
                                        leading: Image.network(
                                          prd["image_url"].toString(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void searchProduct(String searchvalue) {
    if (_morefilerlist == null) {
      // setState(() {
      //   List list = widget.list
      //       .where((element) => (element["product_name"]!
      //           .toString()
      //           .toLowerCase()
      //           .contains(searchvalue)))
      //       .toList();
      //   _list = list;
      //   print("from sp morelist null $_list");
      // });
    } else {
      setState(() {
        _list = _morefilerlist!
            .where((element) => (element["product_name"]!
                .toString()
                .toLowerCase()
                .contains(searchvalue)))
            .toList();
        print(_list);
      });
    }
  }

  void searchmorelist(String catname) {
    if (catname == "No Category Selected") {
      setState(() {
        _morefilerlist = null;
        print("from search more  no cat selected$_morefilerlist");
      });
      // } else {
      //   _morefilerlist = widget.list
      //       .where((element) => (element["category_details"]["slug"]!
      //           .toString()
      //           .contains(catname)))
      //       .toList();
      //   print("value added to morelist $_morefilerlist");
    }
  }
}
