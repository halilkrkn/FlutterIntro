import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestures Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int tabsCount = 0;
  int doubleTabsCount = 0;
  int longPressCount = 0;
  double xPosition = 500.0;
  double yPosition = 300.0;
  double boxSize = 0.0;
  double fullBoxSize = 150.0;

//*Animasyonları tutan bir Controller Sınıfı.
  AnimationController aniController;
  Animation<double> animation;

  //Uygulama Açıldığı zaman Animasyon çalışması için.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aniController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(
        parent: aniController,
        curve: Curves.bounceOut// Animasyonun nasıl olduğunu Seçtik.
        );
    animation.addListener(() {
      setState(() {
        boxSize = fullBoxSize * animation.value;
      });
      centerBox(context);
    });
    //Animasyonu çalıştırma operasyonu
    aniController.forward();
  }

  @override
  void dispose() {
    
    //* Bellekten atma    
    aniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if(xPosition == 0.0){
    //     centerBox(context);
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Gestures Demo"),
      ),
      body: GestureDetector(
        //*Teker Teker fareye tıklandığında
        onTap: () {
          //*İşlemlerin güncellenmesi için
          setState(() {
            tabsCount++;
          });
        },
        //* Art Art fareye tıklandığında
        onDoubleTap: () {
          setState(() {
            doubleTabsCount++;
          });
        },
        //*Uzun bir süre fareye tıklanıp kaldığında
        onLongPress: () {
          setState(() {
            longPressCount++;
          });
        },
        //*Dikey olarak Sürükleme
        onVerticalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            double delta = value.delta.dy;
            yPosition += delta;
          });
        },
        //*Yatay olarak Sürükleme
        onHorizontalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            double delta = value.delta.dx;
            xPosition += delta;
          });
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              left: xPosition,
              top: yPosition,
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Material(
          child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Text(
            "            Tab: $tabsCount,         Double Tab: $doubleTabsCount,        Long Press: $longPressCount"),
      )),
    );
  }

  void centerBox(BuildContext context) {
    //*Oluşturduğumuz kutuyu ekranın ortasına yerleştirmek
    xPosition = MediaQuery.of(context).size.width / 2.0 - boxSize / 2.0;
    xPosition = MediaQuery.of(context).size.width / 2.0 - boxSize / 2.0 - 30.0;

    setState(() {
      this.xPosition = xPosition;
      this.yPosition = yPosition;
    });
  }
}
