import 'package:flutter/material.dart';

void main() => runApp(DemoInfoFest());


class DemoInfoFest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // debugShowCheckedModeBanner: false,
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
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  void _showModalSheet(int index) {
    print(index);
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(papers[index]['image']),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 150,
                height: 150,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: 
                        Text(
                          papers[index]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10),),
                    Center(
                      child: Text(papers[index]['speaker'],textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10),),
                    Center(
                      child: Text(papers[index]['date'],textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  var papers = [
    {'name':'Google Cloud Functions','speaker':'Ing. Hansy Schmitt Camacho','image':'https://scontent.flim5-2.fna.fbcdn.net/v/t1.0-9/47216642_2191775401140272_6792264369422991360_n.png?_nc_cat=103&_nc_ht=scontent.flim5-2.fna&oh=f8481d867eddea7455ae3c901814a4dd&oe=5CB21C30',"date":"Lunes 17 de diciembre"},
    {'name':'Innovación y Nuevas Tecnologías','speaker':'Ing. Juan José Flores Cueto','image':'https://scontent.flim5-3.fna.fbcdn.net/v/t1.0-9/46505939_2184556485195497_286744235862917120_n.png?_nc_cat=105&_nc_ht=scontent.flim5-3.fna&oh=6358ef135b4efbc72c85f6d01efbbef4&oe=5C9FAA27',"date":"Lunes 17 de diciembre"},
    {'name':'Marketing Digital, tendencias 2019','speaker':'Lic. Jherry Guerra','image':'https://scontent.flim5-3.fna.fbcdn.net/v/t1.0-9/47299207_2191920054459140_6561646160593813504_n.png?_nc_cat=105&_nc_ht=scontent.flim5-3.fna&oh=a55b51b927b533b14d326c07e9183d34&oe=5C662698',"date":"Martes 18 de diciembre"},
    {'name':'Introducción al Desarrollo Frontend','speaker':'Ing. Jorge Torres Colan','image':'https://scontent.flim5-1.fna.fbcdn.net/v/t1.0-9/47470181_2191919234459222_2400935852889866240_n.png?_nc_cat=104&_nc_ht=scontent.flim5-1.fna&oh=07e4b4bc4655857f78482c3ef6c3c185&oe=5CAB2255',"date":"Martes 18 de diciembre"},
    {'name':'¿Por qué utilizar Flutter en nuestros proyectos móviles?','speaker':'Adrián Ubillús','image':'https://scontent.flim5-1.fna.fbcdn.net/v/t1.0-9/47306371_2192075191110293_5156550663429160960_n.png?_nc_cat=111&_nc_ht=scontent.flim5-1.fna&oh=9641f231409a43231cd2077bbf042e9a&oe=5C978B6C',"date":"Martes 18 de diciembre"},
    {'name':'Diseño de infraestructura para despliegue de aplicaciones web en la nube de AWS','speaker':'Luis Pacora','image':'https://scontent.flim5-4.fna.fbcdn.net/v/t1.0-9/47380610_2192073994443746_6510251675691778048_n.png?_nc_cat=108&_nc_ht=scontent.flim5-4.fna&oh=18fe7d34182ecb9892703a0296d17092&oe=5CA52283',"date":"Martes 18 de diciembre"},
    {'name':'Hola, PYTHON!','speaker':'CSM® Giohanny Falla Pillman','image':'https://scontent.flim5-2.fna.fbcdn.net/v/t1.0-9/46773631_2187733461544466_3087059897787875328_n.png?_nc_cat=100&_nc_ht=scontent.flim5-2.fna&oh=33271740baff10ea66aeecb4137ae062&oe=5CAB8558',"date":"Miercoles 19 de diciembre"},
    {'name':'Tecnologías y plataformas para control de versiones: Git, GitHub y BitBucket','speaker':'Ing. Gianfranco Manrique Valentín','image':'https://scontent.flim5-2.fna.fbcdn.net/v/t1.0-9/47297195_2191920781125734_2671292473531170816_n.png?_nc_cat=103&_nc_ht=scontent.flim5-2.fna&oh=4b449e9caae0e54a8d35afde7241f30a&oe=5CB07F71',"date":"Viernes 21 de diciembre"},
  ];

  var events = [
    {"name":"Bingo Navideño","date":"Miercoles 19 de diciembre","image":"https://www.castlecourthotel.ie/upload/slide_images/bingo3.jpg"},
    {"name":"Campeonato INFOFEST - Voley y Futbol","date":"Jueves 20 de diciembre","image":"https://scontent.flim10-1.fna.fbcdn.net/v/t1.0-9/48051632_2194221644228981_1018620467126206464_n.jpg?_nc_cat=110&_nc_ht=scontent.flim10-1.fna&oh=9f94ccc2ec59334ee9400975531e43a0&oe=5CAB4690"},
    {"name":"Concurso de programación","date":"Viernes 21 de diciembre","image":"https://scontent.flim5-1.fna.fbcdn.net/v/t1.0-9/47137336_2189867807997698_1829595526236995584_n.png?_nc_cat=110&_nc_ht=scontent.flim5-1.fna&oh=53935c459bc833e853f33e0e9c704162&oe=5CA5D4C0"},
    {"name":"Torneo de videojuegos","date":"Viernes 21 de diciembre","image":"https://i.blogs.es/de368e/dota-2-wallpaper/450_1000.jpg"},
    {"name":"Fiesta de confraternidad","date":"Viernes 21 de diciembre","image":"https://scontent.flim5-1.fna.fbcdn.net/v/t1.0-9/47687958_2198403750477437_2686912397708361728_n.jpg?_nc_cat=104&_nc_ht=scontent.flim5-1.fna&oh=f9e24c8e45033157b2d8ddd2203d1ba2&oe=5C8B7942"},
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
          Papers(papers: papers,showModalSheet:_showModalSheet),
          Events(events: events),
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
                Icons.chat,
              ),
              title: Text(
                "Ponencias",
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

  Papers({Key key, this.papers,this.showModalSheet}) : super(key: key);
  final papers;
  final showModalSheet;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
      itemCount: papers.length,
      itemBuilder: (BuildContext context,int index){
        return GestureDetector(
          onTap: ()=>showModalSheet(index),
          child: Card(
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
          ),
        );
      },
    );
  }
}

class Events extends StatelessWidget {

  Events({Key key, this.events}) : super(key: key);
  final events;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
      itemCount: events.length,
      // scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context,int index){
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.65), BlendMode.srcOver),
                image: NetworkImage(events[index]['image']),
                fit: BoxFit.cover,
              ),
            ),
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Center(
                    child: Text(
                      events[index]['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
                Flexible(
                  child: Center(
                    child: Text(
                      events[index]['date'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}