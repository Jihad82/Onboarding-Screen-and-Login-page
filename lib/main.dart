import 'package:flutter/material.dart';
import 'log.dart'; // Import the log.dart file containing the login page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      indicators.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: i == _currentPage
              ? Color.fromARGB(255, 255, 255, 255)
              : Color.fromARGB(255, 158, 154, 154),
          borderRadius: BorderRadius.circular(5.0),
        ),
        width: 8.0,
        height: 8.0,
      ));
    }
    return indicators;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          // Page 1
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/onbord3.jpg'),
                Text('Stay connected and informed',
                    style: TextStyle(fontSize: 24.0)),
                Text('With the latest news and updates on campus',
                    style: TextStyle(fontSize: 16.0)),
                SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {
                //     setState(() {
                //       _currentPage = 1;
                //     });
                //     _pageController.animateToPage(
                //       _currentPage,
                //       duration: Duration(milliseconds: 300),
                //       curve: Curves.ease,
                //     );
                //   },
                //   child: Text('Next'),
                // ),
              ],
            ),
          ),
          // Page 2
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/onbord1.jpg'),
                Text('Connect with your classmates',
                    style: TextStyle(fontSize: 24.0)),
                Text('And find out what\'s happening on campus',
                    style: TextStyle(fontSize: 16.0)),
                SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {
                //     setState(() {
                //       _currentPage = 2;
                //     });
                //     _pageController.animateToPage(
                //       _currentPage,
                //       duration: Duration(milliseconds: 300),
                //       curve: Curves.ease,
                //     );
                //   },
                //   child: Text('Next'),
                // ),
              ],
            ),
          ),
          // Page 3
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/onbord2.jpg'),
                Text('Get started today!', style: TextStyle(fontSize: 24.0)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        color: Color.fromARGB(248, 8, 255, 111),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              onPressed: () {
                // Implement skip functionality or remove this button
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle:
                      TextStyle(fontSize: 20) // Change the text color to white
                  ),
              child: Text('Skip'),
            ),
            Row(
              children: _buildPageIndicator(),
            ),
            TextButton(
              onPressed: () {
                if (_currentPage < 2) {
                  setState(() {
                    _currentPage++;
                  });
                  _pageController.animateToPage(
                    _currentPage,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginPage())); // Navigate to LoginPage
                }
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle:
                      TextStyle(fontSize: 20) // Change the text color to white
                  ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
