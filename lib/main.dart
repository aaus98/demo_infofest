import 'package:flutter/material.dart';

void main() => runApp(DemoInfoFest());


class DemoInfoFest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        accentColor: Colors.blue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  var papers = [
    {'name':'¿Por qué utilizar Flutter en nuestros proyectos móviles?','speaker':'Adrián Ubillús','image':'https://scontent.flim5-1.fna.fbcdn.net/v/t1.0-9/47306371_2192075191110293_5156550663429160960_n.png?_nc_cat=111&_nc_ht=scontent.flim5-1.fna&oh=9641f231409a43231cd2077bbf042e9a&oe=5C978B6C'},
    {'name':'Diseño de infraestructura para despliegue de aplicaciones web en la nube de AWS','speaker':'Luis Pacora','image':'https://scontent.flim5-4.fna.fbcdn.net/v/t1.0-9/47380610_2192073994443746_6510251675691778048_n.png?_nc_cat=108&_nc_ht=scontent.flim5-4.fna&oh=18fe7d34182ecb9892703a0296d17092&oe=5CA52283'},
    {'name':'Tecnologías y plataformas para control de versiones: Git, GitHub y BitBucket','speaker':'Ing. Gianfranco Manrique Valentín','image':'https://scontent.flim5-2.fna.fbcdn.net/v/t1.0-9/47297195_2191920781125734_2671292473531170816_n.png?_nc_cat=103&_nc_ht=scontent.flim5-2.fna&oh=4b449e9caae0e54a8d35afde7241f30a&oe=5CB07F71'},
    {'name':'Marketing Digital, tendencias 2019','speaker':'Lic. Jherry Guerra','image':'https://scontent.flim5-3.fna.fbcdn.net/v/t1.0-9/47299207_2191920054459140_6561646160593813504_n.png?_nc_cat=105&_nc_ht=scontent.flim5-3.fna&oh=a55b51b927b533b14d326c07e9183d34&oe=5C662698'},
    {'name':'Introducción al Desarrollo Frontend','speaker':'Ing. Jorge Torres Colan','image':'https://scontent.flim5-1.fna.fbcdn.net/v/t1.0-9/47470181_2191919234459222_2400935852889866240_n.png?_nc_cat=104&_nc_ht=scontent.flim5-1.fna&oh=07e4b4bc4655857f78482c3ef6c3c185&oe=5CAB2255'},
    {'name':'Google Cloud Functions','speaker':'Ing. Hansy Schmitt Camacho','image':'https://scontent.flim5-2.fna.fbcdn.net/v/t1.0-9/47216642_2191775401140272_6792264369422991360_n.png?_nc_cat=103&_nc_ht=scontent.flim5-2.fna&oh=f8481d867eddea7455ae3c901814a4dd&oe=5CB21C30'},
    {'name':'Hola, PYTHON!','speaker':'CSM® Giohanny Falla Pillman','image':'https://scontent.flim5-2.fna.fbcdn.net/v/t1.0-9/46773631_2187733461544466_3087059897787875328_n.png?_nc_cat=100&_nc_ht=scontent.flim5-2.fna&oh=33271740baff10ea66aeecb4137ae062&oe=5CAB8558'},
    {'name':'Innovación y Nuevas Tecnologías','speaker':'Ing. Juan José Flores Cueto','image':'https://scontent.flim5-3.fna.fbcdn.net/v/t1.0-9/46505939_2184556485195497_286744235862917120_n.png?_nc_cat=105&_nc_ht=scontent.flim5-3.fna&oh=6358ef135b4efbc72c85f6d01efbbef4&oe=5C9FAA27'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INFOFEST 2018',style: TextStyle(color: Colors.lightBlue),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: PageView(
        children: [
          Papers(papers: papers),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                "Inicio",
              )
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              title: Text(
                "Eventos",
              )
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }
}

class Papers extends StatelessWidget {

  Papers({Key key, this.papers}) : super(key: key);
  final papers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: papers.length,
      itemBuilder: (BuildContext context,int index){
        return Card(
          margin: EdgeInsets.only(top: 10,left: 15,right: 15),
          child: Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                child: FadeInImage.assetNetwork(
                  fadeInCurve: Curves.fastOutSlowIn,
                  placeholder: 'assets/images/image_placeholder.png',
                  image: papers[index]['image'],
                  fit: BoxFit.fitWidth,
                ),
                margin: EdgeInsets.only(right: 15),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(papers[index]['name']),
                    Padding(padding: EdgeInsets.only(top: 10),),
                    Text(papers[index]['speaker']),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
