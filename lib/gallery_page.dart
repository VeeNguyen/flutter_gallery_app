import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class Gallery extends StatelessWidget {
  final imageList = [
    'https://raw.githubusercontent.com/VeeNguyen/Portfolio_Website_React/main/src/assets/images/logopreload.png',
    'https://raw.githubusercontent.com/VeeNguyen/Portfolio_Website_React/main/src/assets/images/v-logo.png',
    'https://raw.githubusercontent.com/VeeNguyen/Portfolio_Website_React/main/src/assets/images/v-logo-2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: PhotoViewGallery.builder(
        itemCount: imageList.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
              imageList[index],
            ),
            // contains smallest possible size to fit 1 dimension of screen
            minScale: PhotoViewComputedScale.contained * 0.8, // 80%
            // covered smallest possible size to fit whole screen
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: const BouncingScrollPhysics(),
      ),
    );
  }
}
