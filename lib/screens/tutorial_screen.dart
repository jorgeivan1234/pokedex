import 'package:flutter/material.dart';
import '../widget/widget.dart';

class SlideInfo{
  final String title;
  final String caption;
  final String imageUR;

  SlideInfo(
    this.title, 
    this.caption, 
    this.imageUR
  );

}

final slides = <SlideInfo> [
    SlideInfo('', '', ''),
    SlideInfo('', '', ''),    
    SlideInfo('', '', ''),
];

class TutorialScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {

  final PageController pageViewController= PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener((){
      final page = pageViewController.page ?? 0;
      if(!endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,      
        appBar: AppBar(
          backgroundColor: Colors.red,        
          title: const Text('Tutorial'),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
          centerTitle: true,
        ),

        drawer: const DrawerScreen(),
      
        body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            children: [
              
            ],
          ),
        ],
      ),
    );
  }
}