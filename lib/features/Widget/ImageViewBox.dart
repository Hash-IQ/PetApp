import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'zoom_page.dart';

class ImageViewSlide extends StatelessWidget {
  const ImageViewSlide({
    Key key,
    @required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ZoomPage(image: image,)));
      },
      child: InteractiveViewer(
        panEnabled: false,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Center(
            child:
                CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
          //fit: BoxFit.fill,
        ),
      ),
    );
  }
}
