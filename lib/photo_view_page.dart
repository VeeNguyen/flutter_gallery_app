import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatelessWidget {
  const PhotoViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Photos'),
      ),
      body: PhotoView(
        imageProvider: const NetworkImage(
          'https://raw.githubusercontent.com/VeeNguyen/Portfolio_Website_React/main/src/assets/images/v-logo-2.png',
        ),
        // contains smallest possible size to fit 1 dimension of screen
        minScale: PhotoViewComputedScale.contained * 0.8, // 80%
        // covered smallest possible size to fit whole screen
        maxScale: PhotoViewComputedScale.covered * 2,
        // set background color
        backgroundDecoration: BoxDecoration(color: Colors.tealAccent[200]), 
      ),
    
    );
  }
}
