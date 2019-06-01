import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'constants.dart';

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*
    DataParser dataParser = DataParser(context);
    Future<List> list = dataParser.getData();
    print(list);*/

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Flutter Gram',
            date: 'A working Instagram clone using Firebase & Firestore',
            assetName:
                'https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwix0ejnh8jiAhWA_XMBHbVHAQcQjRx6BAgBEAU&url=http%3A%2F%2Fparanoidandroid.co%2Fwallpapers&psig=AOvVaw15PLTLJ48PYyU5SE_bXdjL&ust=1559470854321231',
            offset: pageOffset,
          ),
          SlidingCard(
            name: 'Wavy Metrics',
            date:
                'Wavy Metrics is an easy and quick way for Wavers to keep up with company results.',
            assetName:
                'https://www.google.com/url?sa=i&source=imgres&cd=&cad=rja&uact=8&ved=2ahUKEwjylcXlh8jiAhW77HMBHZU2AmwQjRx6BAgBEAU&url=https%3A%2F%2Funsplash.com%2Fphotos%2FSewc0TdvV-o&psig=AOvVaw32Xa1YEyV3782jjnHT-CVD&ust=1559470857548190',
            offset: pageOffset,
          ),
          SlidingCard(
            name: 'Flutter Jobs',
            date: "flutter job board app for Android/IOS using",
            assetName:
                'https://images.pexels.com/photos/1212487/pexels-photo-1212487.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            offset: pageOffset,
          ),
          SlidingCard(
            name: 'E-commerce suit in Flutter',
            date: 'An e-commerce suit built in Flutter for android and iOS',
            assetName: 'https://itsallwidgets.com/screenshots/app-134.png',
            offset: pageOffset,
          ),
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.network(
                assetName,
                height: MediaQuery.of(context).size.height * 0.2,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.none,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent(
                name: name,
                date: date,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatefulWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent(
      {Key key,
      @required this.name,
      @required this.date,
      @required this.offset})
      : super(key: key);

  @override
  _CardContentState createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {
  bool isSelected = false;
  int ratingCount = 3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * widget.offset, 0),
            child: Text(widget.name, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * widget.offset, 0),
            child: Text(
              widget.date,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Spacer(),
          Row(
            children: <Widget>[
              Transform.translate(
                offset: Offset(48 * widget.offset, 0),
                child: RaisedButton(
                  color: Color(0xFF162A49),
                  child: Transform.translate(
                    offset: Offset(24 * widget.offset, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: isSelected ? Colors.yellow : Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                          height: 0,
                        ),
                        Text(
                          ratingCount.toString(),
                          style: kRatingTextStyle,
                        )
                      ],
                    ),
                  ),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  onPressed: () {
                    setState(() {
                      if (isSelected) {
                        ratingCount--;
                        isSelected = false;
                      } else {
                        ratingCount++;
                        isSelected = true;
                      }
                    });
                  },
                ),
              ),
              Spacer(),
              SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}
