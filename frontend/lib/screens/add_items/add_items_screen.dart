import 'package:flutter/material.dart';
import 'package:frontend/widgets/add_item_appbar.dart';
import 'package:frontend/widgets/add_photo.dart';
import 'package:frontend/screens/home/home_screen.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _photoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AddItemAppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name*',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Container(
                child: const Text(
                  'Price*',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: '₱ 0.00',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                 
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Container(
                child: const Text(
                  'Restaurant',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextFormField(
                controller: _photoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Container(
                child: const Text(
                  'Photo',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              PhotoSelector(),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFE3DB),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      minimumSize: Size(180, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          fontFamily: 'Monsterrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFE724C)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                     
                      if (_formKey.currentState!.validate()) {
                        
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFE724C), // Background color
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      minimumSize: Size(180, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Save',
                        style: TextStyle(
                          fontFamily: 'Monsterrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
