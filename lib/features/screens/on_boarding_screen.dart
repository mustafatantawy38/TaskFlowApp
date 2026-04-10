import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => onboardingcontent(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          curve: Curves.ease,
                          duration: Duration(milliseconds: 300),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/icons8-arrow-24.svg',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({this.isActive = false, super.key});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.blue.withValues(green: 0.4),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;
  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demo_data = [
  Onboard(
    image: 'assets/images/onboarding1.jpg',
    title: 'Organize Your Tasks Easily',
    description:
        'Stay on top of your daily tasks with a simple and intuitive task management system designed to keep you focused and productive.',
  ),
  Onboard(
    image: 'assets/images/onboarding2.jpg',
    title: 'Never Miss a Deadline',
    description:
        'Set due dates, priorities, and reminders to make sure every task is completed on time without stress.',
  ),
  Onboard(
    image: 'assets/images/onboarding3.jpg',
    title: 'Track Your Progress',
    description:
        'Monitor your completed tasks and stay motivated by seeing your productivity grow every day.',
  ),
];

class onboardingcontent extends StatelessWidget {
  const onboardingcontent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Image.asset(image, height: 250),
        SizedBox(height: 50),
        Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight(100),
            color: Colors.black,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
