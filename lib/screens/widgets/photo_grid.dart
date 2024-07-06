import 'dart:math';

import 'package:flutter/material.dart';

class PhotoGrid extends StatefulWidget {
  const PhotoGrid({
    Key? key,
    required this.imageUrls,
    required this.onImageClicked,
    required this.onExpandClicked,
    this.maxImages = 2,
    required this.description
  }) : super(key: key);

  final String description;
  final int maxImages;
  final List<String> imageUrls;
  final Function(int) onImageClicked;
  final Function onExpandClicked;

  @override
  State<PhotoGrid> createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {



  @override
  Widget build(BuildContext context) {
    print("image length : ${widget.imageUrls.length}");
    var images = buildImages();
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent:230,
          maxCrossAxisExtent: 180, crossAxisSpacing: 40),
      children: images,
    );
  }

  List<Widget> buildImages() {
    int numImages = widget.imageUrls.length;
    return List<Widget>.generate(min(numImages, widget.maxImages), (index) {
      String imageUrl = widget.imageUrls[index];

      // If its the last image
      if (index == widget.maxImages - 1) {
        // Check how many more images are left
        int remaining = numImages - widget.maxImages;

        // If no more are remaining return a simple image widget
        if (remaining == 0) {
          return GestureDetector(
            child: ImageView(imageUrl),
            onTap: () => widget.onImageClicked(index),
          );
        } else {
          // Create the facebook like effect for the last image with number of remaining  images
          return GestureDetector(
            onTap: () => widget.onExpandClicked(),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImageView(imageUrl),
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.black54,
                      child: Text(
                        '+' + remaining.toString(),
                        style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      } else {
        return GestureDetector(
          child: ImageView(imageUrl),
          onTap: () => widget.onImageClicked(index),
        );
      }
    });
  }

  Widget ImageView(String imagePath) {
    return Container(
      //height: 300.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
