import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
    this.title, 
    this.caption, 
    this.imageUrl
  );
}  

final slides = <SlideInfo> [
    SlideInfo('Busca la comida', 'Proident consectetur excepteur mollit occaecat eiusmod amet anim.', 'assets/Images/1.png'),
    SlideInfo('entrega rapida', 'Mollit sit culpa exercitation duis aliqua aute cillum do culpa voluptate adipisicing ea velit sunt.', 'assets/Images/2.png'),
    SlideInfo('Disfruta la comida', 'Culpa consequat minim duis reprehenderit ex ut ullamco anim nulla qui officia proident.', 'assets/Images/3.png')
];






class AppTutorialScreen extends StatefulWidget {

  static const name = 'tutoria_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController(); 
  bool endReached = false;
  @override
  void initState() {
    super.initState();

    pageViewController.addListener((){

      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children: slides.map(
              (slimeData) => _Slide(
                title: slimeData.title, 
                caption: slimeData.caption, 
                imageUrl: slimeData.imageUrl
              ),
            ).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: Text('salir'),
              onPressed: () => context.pop(),
            )
          ),

          endReached ? 
            Positioned(
              right: 20,
              top: 50,
              child: FadeInRight(
                from: 15,
                delay: Duration(seconds: 1),
                child: FilledButton(
                  onPressed: () => context.pop(), 
                child: Text('Comenzar')
                ),
              ),
            ): SizedBox(),
        ],
      ),
    );
  }
}


class _Slide extends StatelessWidget {
  
  final String title;
  final String caption;
  final String imageUrl;
  
  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl) ),
            const SizedBox(height: 20),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle,)
          ],
        ),
      ),
    );
  }
}