import 'package:devsteam1/components/styled_card.dart';
import 'package:devsteam1/screens/info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselWithState extends StatefulWidget {
  final List<ImageData> images;

  const CarouselWithState({Key key, this.images}) : super(key: key);
  @override
  _CarouselWithStateState createState() => _CarouselWithStateState();
}

class _CarouselWithStateState extends State<CarouselWithState> {
  PageController controller;
  TransformController transformController = TransformController();
  double selectedPage = 0;

  void _scrollListener() {
    setState(() {
      selectedPage = controller.page;
    });
  }

  @override
  void initState() {
    controller = PageController(viewportFraction: 0.4);
    controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget createCard(ImageData imageData, index) {
    return Transform(
      alignment: Alignment.center,
      transform: transformController.calculateTransform(selectedPage, index),
      child: Opacity(
        opacity: index - selectedPage > 3 ? 0 : 1,
        child: StyledCard(
          imageData: imageData,
        ),
      ),
    );
  }

  List<Widget> createCarousel(List<ImageData> images) {
    int index = 0;
    List<Widget> list = [];
    for (ImageData image in images) {
      list.add(this.createCard(image, index));
      index++;
    }
    return list.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Center(
            child: Stack(
          children: this.createCarousel(widget.images),
        )),
        Center(
          widthFactor: double.infinity,
          child: Container(
            height: 250,
            child: PageView.custom(
              scrollDirection: Axis.horizontal,
              controller: controller,
              physics: AlwaysScrollableScrollPhysics(),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container();
                },
                childCount: widget.images.length,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: 250,
            height: 250,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InfoScreen(
                            fullImageUrl:
                                this.widget.images[selectedPage.round()].full,
                            authorName:
                                this.widget.images[selectedPage.round()].name,
                          )),
                );
              },
            ),
          ),
        )
      ],
    ));
  }
}

class TransformController {
  calculateTransform(double offset, int pageId) {
    double translationOffset = (pageId - offset) * 48;
    double scale = 1 - (pageId - offset) * 0.2;

    if (pageId - offset < 0) {
      translationOffset = (pageId - offset) * 250;
    }
    return Matrix4.identity()
      ..scale(scale)
      ..translate(translationOffset, 0, 0);
  }
}
