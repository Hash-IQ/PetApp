import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ZoomPage extends StatefulWidget {
  final String image;

  const ZoomPage({
    Key key,
    @required this.image,
  }) : super(key: key);
  @override
  _ZoomPageState createState() => _ZoomPageState();
}

class _ZoomPageState extends State<ZoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: Center(
          child: PhotoView(
              imageProvider: CachedNetworkImageProvider(widget.image))),
    );
  }
}
