import 'package:flutter/material.dart';

class TopImageCorousel extends StatefulWidget {
  List<String> photos;
  TopImageCorousel({required this.photos});

  @override
  _TopImageCorouselState createState() => _TopImageCorouselState();
}

class _TopImageCorouselState extends State<TopImageCorousel> {
  int photoIndex = 0;

  

  void _previosImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex =
          photoIndex < (widget.photos.length - 1) ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.photos[photoIndex]), fit: BoxFit.contain),
          ),
        ),
        GestureDetector(
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),
          onTap: _nextImage,
        ),
        GestureDetector(
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.transparent,
          ),
          onTap: _previosImage,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2.5 - 35.0,
          left: MediaQuery.of(context).size.width / 2 - 30.0,
          child: Row(
            children: [
              SelectedPhotoIndicator(
                numberOfDots: widget.photos.length,
                photoIndex: photoIndex,
              ),
            ],
          ),
        )
      ],
    );
  }
}
class SelectedPhotoIndicator extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhotoIndicator(
      {required this.photoIndex, required this.numberOfDots});

  Widget _inactivePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.yellow,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.0,
                blurRadius: 2.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; i++) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
