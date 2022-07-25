import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

// state full because needs to keep track of images
// and calling the dispose method
class ControllerPhotoViewPage extends StatefulWidget {
  const ControllerPhotoViewPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ControllerPhotoViewPageState createState() =>
      _ControllerPhotoViewPageState();
}

class _ControllerPhotoViewPageState extends State<ControllerPhotoViewPage> {
  late PhotoViewController photoViewController;

  @override
  void initState() {
    super.initState();
    photoViewController = PhotoViewController();
  }

  @override
  void dispose() {
    super.dispose();
    photoViewController.dispose(); // avoid memory leaks
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controller Photo View'),
      ),
      body: Stack(
        children: <Widget>[
          _buildPhotoView(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _buildScaleInfo(),
              _buildResetScaleButton(),
            ],
          )
        ],
      ),
    );
  }

  PhotoView _buildPhotoView(BuildContext context) {
    return PhotoView(
      controller: photoViewController,
      imageProvider: const NetworkImage(
        'hhttps://raw.githubusercontent.com/VeeNguyen/Portfolio_Website_React/main/src/assets/images/v-logo-2.png',
      ),
      // contains smallest possible size to fit 1 dimension of screen
      minScale: PhotoViewComputedScale.contained * 0.8, // 80%
      // covered smallest possible size to fit whole screen
      maxScale: PhotoViewComputedScale.covered * 2,
      // set background color
      backgroundDecoration: BoxDecoration(color: Colors.tealAccent[200]),
    );
  }

  StreamBuilder<PhotoViewControllerValue> _buildScaleInfo() {
    return StreamBuilder(
      stream: photoViewController.outputStateStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<PhotoViewControllerValue> snapshot,
      ) {
        if (!snapshot.hasData) return Container();

        return Center(
          child: Text(
            'Scale compared to the original: \n${snapshot.data?.scale}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        );
      },
    );
  }

  ElevatedButton _buildResetScaleButton() {
    return ElevatedButton(
      child: const Text('Reset Scale'),
      onPressed: () {
        photoViewController.scale = photoViewController.initial.scale;
      },
    );
  }
}
