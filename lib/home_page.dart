import 'package:flutter/material.dart';
import 'package:flutter_hackathon/sliding_cards.dart';
import 'package:flutter_hackathon/tabs.dart';

import 'exhibition_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedTabIndex = 1;

  changeTab(int tabIndex) {
    setState(() {
      selectedTabIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Tabs(
                  selectedTabIndex: selectedTabIndex,
                  changeTabListener: (index) {
                    changeTab(index);
                  }),
              SizedBox(height: 8),
              if (selectedTabIndex == 0)
                SlidingCardsView()
              else
                Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(30),
                                    ),
                                    child: Container(
                                      width: 150,
                                      child: Image.asset(
                                        'assets/efe-kurnaz.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  flex: 4,
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Flutter showcase",
                                              style: TextStyle(fontSize: 16)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: Text(
                                            'It all about flutter show case',
                                            style: TextStyle(
                                                color: Colors.grey.shade400,
                                                fontSize: 13),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: 10),
                )
            ],
          ),
        ),
        ExhibitionBottomSheet(),
      ],
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        'Shenzhen',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
