import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:second_hand_shop/model/Product.dart';

import '../model/dropdown_category.dart';
import '../repository/category_repository.dart';
import '../repository/product_repositories.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  // Load camera and gallery images and store it to the File object.
  File? img;
  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick Image $e');
    }
  }

  // Add product
  _addProduct(Product products) async {
    bool isAdded = await ProductRepository().addProduct(img, products);
    if (isAdded) {
      _displayMessage(isAdded);
    } else {
      _displayMessage(isAdded);
    }
  }

  // Display message
  _displayMessage(bool isAdded) {
    if (isAdded) {
      MotionToast.success(description: const Text("Product added successfully"))
          .show(context);
    } else {
      MotionToast.error(description: const Text("Error adding product"))
          .show(context);
    }
  }

  var gap = const SizedBox(height: 10);
  var nameController = TextEditingController(text: "");
  var descriptionController = TextEditingController(text: "");
  var priceController = TextEditingController(text: "");
  // var addressController = TextEditingController(text: "");
  var usedForController = TextEditingController(text: "");
  var deliveryController = TextEditingController(text: "true");
  var conditionController = TextEditingController(text: "");
  var negotiationController = TextEditingController(text: "true");
  var availabilityController = TextEditingController(text: "true");
  final _formKey = GlobalKey<FormState>();

  String? _dropdownvalue;
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _displayImage(),
                    gap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _loadImage(ImageSource.camera);
                            },
                            icon: const Icon(Icons.camera_enhance),
                            label: const Text('Open Camera'),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _loadImage(ImageSource.gallery);
                            },
                            icon: const Icon(Icons.browse_gallery_sharp),
                            label: const Text('Open Gallery'),
                          ),
                        ),
                      ],
                    ),
                    gap,
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Product Name',
                        hintText: 'Enter Product Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Product Description',
                        hintText: 'Enter Product Description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    gap,
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: priceController,
                      decoration: const InputDecoration(
                        labelText: 'Product Price',
                        hintText: 'Enter Product Price',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    gap,
                    //DropdownButton
                    FutureBuilder<List<DropdownCategory?>>(
                      future: CategoryRepository().loadCategory(),
                      builder: (context, snapshot) {
                        // _dropdownvalue = snapshot.data![0]!.id!;
                        if (snapshot.hasData) {
                          return DropdownButtonFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.category),
                              hintText: 'Select Category',
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                _value = newValue!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null) {
                                return 'Please select category';
                              }
                              return null;
                            },
                            // Initial Value
                            value: _dropdownvalue,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: snapshot.data!.map(
                              (DropdownCategory? items) {
                                return DropdownMenuItem<String>(
                                  value: items!.id!,
                                  child: Text(items.name!),
                                );
                              },
                            ).toList(),
                          );
                        } else if (snapshot.hasError) {
                          return const Text("Error");
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                    gap,
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: usedForController,
                      decoration: const InputDecoration(
                        labelText: 'Used for ',
                        hintText: 'Used for',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    gap,
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: conditionController,
                      decoration: const InputDecoration(
                        labelText: 'Condion',
                        hintText: 'Condion',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    gap,
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: negotiationController,
                      decoration: const InputDecoration(
                        labelText: 'negotiation',
                        hintText: 'negotiation',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    gap,
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: availabilityController,
                      decoration: const InputDecoration(
                        labelText: 'availability',
                        hintText: 'availability',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Product products = Product(
                              name: nameController.text,
                              description: descriptionController.text,
                              price: double.parse(priceController.text),
                              category: _value,
                              usedFor: usedForController.text,
                              // address: addressController.text,
                              delivery: false,
                              condition: conditionController.text,
                              negotiation: false,
                              availability: false,
                            );
                            _addProduct(products);
                          }
                        },
                        label: const Text('Add Product'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayImage() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          width: 2,
        ),
      ),
      child: ClipRRect(
        // For rounded upper right corner and left corner in imageview
        borderRadius: BorderRadius.circular(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: img == null
                    ? SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.network(
                          'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                        ),
                      )
                    : Image.file(img!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
