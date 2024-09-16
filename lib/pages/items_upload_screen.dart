import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ItemsUploadScreen extends StatefulWidget {
//  const ItemsUploadScreen({super.key});

  @override
  State<ItemsUploadScreen> createState() => _ItemsUploadScreenState();
}

class _ItemsUploadScreenState extends State<ItemsUploadScreen> {

  Uint8List? imageFileUint8List;
  bool isUploading = false;
  TextEditingController sellerNameTextEditingController = TextEditingController();
  TextEditingController sellerPhoneTextEditingController = TextEditingController();
  TextEditingController itemNameTextEditingController = TextEditingController();
  TextEditingController itemDescriptionTextEditingController = TextEditingController();
  TextEditingController itemPriceTextEditingController = TextEditingController();


  // upload form screen
  Widget uploadFormScreen() {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(        
        backgroundColor: Colors.black,
        title: const Text(
          "Upload New Item",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {

            Navigator.pop(context);
          }, 
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              onPressed: () {
                
              }, 
              icon: const Icon(
                Icons.cloud_upload,
                color: Colors.white,
              ),
            ),
          ),
        ],        
      ),
      body: ListView(
        children: [
          isUploading == true 
            ? const LinearProgressIndicator(
              color: Colors.purpleAccent,
              )
            : Container(),
          
          // image 
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: imageFileUint8List != null 
              ?
                Image.memory(
                  imageFileUint8List!
                )
              :
                const Icon(
                  Icons.image_not_supported,
                  color: Colors.white,
                ),
            ),
          ),

          const Divider(
            color: Colors.white70,
            thickness: 2,
          ),

          // seller name
          ListTile(
            leading: const Icon(
              Icons.person_pin_rounded,
              color: Colors.white,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(
                  color: Colors.grey,
                ),
                controller: sellerNameTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Seller Name",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          // seller phone
          ListTile(
            leading: const Icon(
              Icons.phone_android_rounded,
              color: Colors.white,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(
                  color: Colors.grey,
                ),
                controller: sellerPhoneTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Seller Phone",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),          

          // item name
          ListTile(
            leading: const Icon(
              Icons.title,
              color: Colors.white,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(
                  color: Colors.grey,
                ),
                controller: itemNameTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Item Name",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),          

          // item description
          ListTile(
            leading: const Icon(
              Icons.description,
              color: Colors.white,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(
                  color: Colors.grey,
                ),
                controller: itemDescriptionTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Item Description",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),          

          // item price
          ListTile(
            leading: const Icon(
              Icons.price_change,
              color: Colors.white,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(
                  color: Colors.grey,
                ),
                controller: itemPriceTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Item Price",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),          


        ],
      ),
    );
  }

  // default screen
  Widget defaultScreen() {

     return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Upload New Item",
          style: TextStyle(
            color: Colors.white,

          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {

            Navigator.pop(context);
          }, 
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_photo_alternate,
              color: Colors.white,
              size: 200,
            ),

            ElevatedButton(
              onPressed: () {

                showDialogBox();
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54,
              ),
              child: const Text(
                "Add New Item",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),

          ],
        ),
      ),
     );
  }

  showDialogBox() {

    return showDialog(
      context: context,
      builder: (c) {

        return  SimpleDialog(
          backgroundColor: Colors.black,
          title: const  Text(
            "Item Image",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [

            SimpleDialogOption(             
              onPressed: () {

                captureImageWithPhoneCamera();
              },
              child: const Text(
                "Capeture Image with Camera",
                style:  TextStyle(
                  color: Colors.grey,
                ),
              ),

            ),

            SimpleDialogOption(
              onPressed: () {

                chooseImageFromPhoneGallery();
              },
              child: const Text(
                "Choose Image from Gallery",
                style:  TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),

            SimpleDialogOption(
              onPressed: () {

               Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style:  TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),


          ],
        );
      }
    );
  }

  captureImageWithPhoneCamera() async {

    Navigator.pop(context);
    
    try {

      final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedImage != null) {

        String imagePath = pickedImage.path;
        imageFileUint8List = await pickedImage.readAsBytes();

        // remove background from image
        // make image transparent

        setState(() {
          imageFileUint8List;
        });
      }
    } catch(errorMsg) {

      print(errorMsg.toString());

      setState(() {
        imageFileUint8List = null;        
      });

    }
  }

  chooseImageFromPhoneGallery() async {

    Navigator.pop(context);

    try {

      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {

        String imagePath = pickedImage.path;
        imageFileUint8List = await pickedImage.readAsBytes();

        // remove background from image
        // make image transparent

        setState(() {
          imageFileUint8List;
        });
      }
    } catch(errorMsg) {

      print(errorMsg.toString());

      setState(() {
        imageFileUint8List = null;        
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    // return uploadFormScreen();
    return imageFileUint8List == null
      ? defaultScreen()
      : uploadFormScreen();
  }
}