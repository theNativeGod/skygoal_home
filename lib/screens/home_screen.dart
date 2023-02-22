import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  header(context),
                  body(context),
                ],
              ),
              bottomNavBar(context),
            ],
          ),
        ),
      ),
    );
  }

  header(BuildContext context) {
    return Container(
      height: 225,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 42.0,
          right: 37.0,
          left: 37.0,
        ),
        child: Stack(children: [
          Align(
            alignment: Alignment.topRight,
            child: Stack(
              children: [
                const Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20.0,
                ),
                Positioned(
                  right: 1,
                  child: Container(
                    height: 8.0,
                    width: 8.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          headerText(),
          searchBar(context),
        ]),
      ),
    );
  }

  headerText() {
    return Positioned(
      top: 8.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Find Your Own Way',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Search in 600 colleges around!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  searchBar(BuildContext context) {
    return Positioned(
      bottom: 37.0,
      child: SizedBox(
        height: 53,
        width: 317,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 53.0,
              width: 240.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const SizedBox(
                    width: 180,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search for colleges, schools..',
                        hintStyle: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Container(),
            // ),
            Container(
              height: 53.0,
              width: 55.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Icon(
                Icons.mic,
                size: 30.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  body(BuildContext context) {
    final images = ['image1', 'image2', 'image3'];
    final topics = ['Top Colleges', 'Top Schools', 'Exams'];
    final quantity = ['+126', '+106', '16'];
    final quantityText = ['Colleges', 'Schools', 'Exams'];
    final descriptions = [
      'Search through thousands of accredited colleges and universities online to find the right one for you.  Apply in 3 min, and connect with your future.',
      'Searching for the best school for you just got easier! With our Advanced School Search, you can easily filter out the schools that are fit for you.',
      'Find an end to end information about the exams that are happening in India',
    ];
    return Container(
      padding: EdgeInsets.only(
        //top: 50.0,
        top: MediaQuery.of(context).size.height * .01,
        left: MediaQuery.of(context).size.height * .037,
        right: MediaQuery.of(context).size.height * .037,
      ),
      height: MediaQuery.of(context).size.height * .63,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            height: 158,
            width: 300,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .02),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage('assets/images/${images[index]}.png'),
                fit: BoxFit.fill,
              ),
            ),
            padding: const EdgeInsets.only(top: 19.0, left: 21.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      topics[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        right: 120,
                      ),
                      child: Text(
                        descriptions[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 3,
                  bottom: 12,
                  child: Row(
                    children: [
                      Text(quantity[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          )),
                      Text(quantityText[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                          )),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  bottomNavBar(context) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * .012,
        ),
        color: Theme.of(context).primaryColor,
        height: 71.0,
        width: MediaQuery.of(context).size.width,
        child: TabBar(
          labelStyle: const TextStyle(
            fontSize: 10,
          ),
          labelPadding: const EdgeInsets.only(top: 10.0),
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.white,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.0, color: Colors.white),
            insets: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          tabs: [
            const Tab(
              icon: Icon(Icons.home_filled, size: 20.0),
              text: 'Search',
            ),
            Tab(
                icon: SizedBox(
                  height: 18,
                  width: 18,
                  child: Image.asset(
                    'assets/images/saved1.png',
                  ),
                ),
                text: 'saved'),
            Tab(
                icon: SizedBox(
                  height: 18,
                  width: 18,
                  child: Image.asset(
                    'assets/images/discovery.png',
                  ),
                ),
                text: 'saved'),
            const Tab(icon: Icon(Icons.person, size: 20.0), text: 'account'),
          ],
        ),
      ),
    );
  }
}
