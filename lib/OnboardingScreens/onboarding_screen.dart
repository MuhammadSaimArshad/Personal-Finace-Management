import 'package:flutter/material.dart';
import 'package:personal_finace_management/auth/login_screen.dart';
import 'package:personal_finace_management/auth/signup_screen.dart';

class OnBoradingScreen extends StatefulWidget {
  const OnBoradingScreen({super.key});

  @override
  _OnBoradingScreenState createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  void moveToNextPage() {
    int nextPage = _pageController.page!.toInt() + 1;
    if (nextPage < _pages.length) {
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  final List<Widget> _pages = [
    IntroPage(
      image: 'images/first.png',
      title: 'you ought to know where your money goes',
      description:
          '  get an overview of how you are \n     performing and motivate your self to \n          achive even more.',
    ),
    IntroPage(
      image: 'images/second.png',
      title: 'Gain total \n control of your money',
      description:
          'Track your transaction easily,with \n catagories and financial report',
    ),
    IntroPage(
      image: 'images/thred.png',
      title: 'Plain ahead and manage \n your money better',
      description:
          '  Setup your budget for each catagory.\n Track catagories you spend the most money on',
    ),
  ];

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _pages[index];
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    if (_currentPage == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ));
                    } else {
                      moveToNextPage();
                    }
                  },
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.8,
                    decoration: const BoxDecoration(
                      color: Color(0xff0EBE7F),
                    ),
                    child: Center(
                        child: Text(
                      _currentPage == 2 ? "SignUp" : "Next",
                      style: const TextStyle(color: Colors.white),
                    )),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    if (_currentPage == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    } else {
                      moveToNextPage();
                    }
                  },
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            color: const Color(0xff0EBE7F),
                            width: width * 0.005)),
                    child: Center(
                        child: Text(
                      _currentPage == 2 ? "Login" : "Skip",
                      style: const TextStyle(color: Color(0xff0EBE7F)),
                    )),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _pages.length; i++) {
      indicators.add(
        _currentPage == i ? _indicator(true) : _indicator(false),
      );
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 12.0,
      width: isActive ? 15.0 : 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color(0xff0EBE7F) : Colors.grey,
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const IntroPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 200.0,
        ),
        const SizedBox(height: 20.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          description,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
