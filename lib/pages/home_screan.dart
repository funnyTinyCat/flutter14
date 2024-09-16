import 'package:ar_furniture_app/pages/items_upload_screen.dart';
import 'package:flutter/material.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "IKEA Clone",
          style: TextStyle(
            fontSize: 22,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),  
        ),
        actions: [
          IconButton(

            onPressed: () {

              Navigator.push(context, MaterialPageRoute(
                builder: (c) => ItemsUploadScreen()
                ),
              );
            },  
            icon: const Icon(
              Icons.add,
              color: Colors.white,
                    
            ),
          ),
        ],
      ),
    );
  }
}