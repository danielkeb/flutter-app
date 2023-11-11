import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'about.dart';
import 'help.dart';

void main() {
  runApp(const MyApp(
    
  ));
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/trainer6.jpg'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Daniel kebede',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'dkklearningservice.com',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: const Text('Help'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/help');
              },
            ),
          ],
        ),
      );
  }
}


class Hospital {
  final String name;
  final String description;
  final int price;
  final String image;
  //='assets/astu.png'
  Hospital(this.name,this.description, this.price, this.image);

  static List<Hospital> getHospitals(){
    List<Hospital> items=<Hospital>[];
    items.add(Hospital(
    'hailemariyam', 
    'referal hospital',200,
    'adama.png'));


    items.add(Hospital(
      'minilik hospital', 
      'the first Hopital in ethiopia ',
      200,
      'adama.png'));

      items.add(Hospital(
      'tayitu hospital', 
      'the first Hopital in ethiopia ',
      200,
      'adama.png'));
      items.add(Hospital(
      'tekur Anbesa hospital', 
      'the biggest Hospital in ethiopia ',
      200,
      'adama.png'));

      items.add(Hospital(
      'yekatit 12 hospital', 
  ' ababa commuity at yekatit 12  Italy was killed 30 thouthend addis ababa commuity at yekatit 12  thouthend addis ababa commuity at yekatit 12  Italy killed 30 thouthend addis ababa commuity at yekatit 12  thouthend addis d addis ababa commuity at yekatit 12  thouthend addis ababa commuity at yekatit 12  Italy killed 30 thouthend addis ababa commuity at yekatit 12  thouthend addis ababa commuity at yekatit 12  Italy killed 30 thouthend addis ababa commuity at yekatit 12  thouthend addis ababa commuity at yekatit 12  Italy killed 30 thouthend addis ababa commuity at yekatit 12  thouthend addis ababa commuity at yekatit 12  Italy killed 30 thouthend addis ababa commuity at yekatit 12 ',
      200,
      'adama.png'));

      items.add(Hospital(
      'Amanuel hospital', 
      'Especial Need hospital',
      200,
      'adama.png'));

      items.add(Hospital(
      'aklesiya hospital', 
      'the in body complete medical center  ',
      200,
      'adama.png'));

      items.add(Hospital(
      'DR mulu mideium hospital', 
      'complet teeth hospital ',
      200,
      'adama.png'));
     return items;
  }

}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital Card Reservation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(title:'Hospital List'),

        
      routes:  {
        '/home':(context) => Home(title: 'Hospital lst'),
        '/about': (context) =>  AboutPage(),
        '/help': (context) => HelpPage(),
      },
    
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key, required this.title});

  final String title;
  final items = Hospital.getHospitals();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hospital list')),
      body: SafeArea( // Wrap the ListView.builder with SafeArea
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HospitalPage(item: items[index]),
                  ),
                );
              },
              child: HospitalBox(item: items[index]),
            );
          },
        ),
      ),
      drawer: AppDrawer(),
      
    );
  }
}


class HospitalPage extends StatelessWidget {
  HospitalPage({super.key, required this.item});
  final Hospital item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
       // child:SingleChildScrollView(

          //scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset("assets/" + this.item.image),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.item.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Card price: ${item.price}"),
                  RatingBox(),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(

                //scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(5),
                child: Text(
                  this.item.description,
                  // other text properties
                ),
              ),
            ),
          ],
        ),
      ),
      //drawer: AppDrawer(),
   // ),
    );
    
  }
}




class RatingBox extends StatefulWidget {
  const RatingBox({super.key});

  @override
  State<RatingBox> createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  @override
  int _rating=0;
  void _setRatingAsOne(){
    setState(() {
      _rating=1;
    });
  }

   void _setRatingAsTwo(){
    setState(() {
      _rating=2;
    });
  }
   void _setRatingAsthree(){
    setState(() {
      _rating=3;
    });
  }
    void _setRatingAsFour(){
    setState(() {
      _rating=4;
    });
  }
   void _setRatingAsFive(){
    setState(() {
      _rating=5;
    });
  }
  Widget build(BuildContext context) {
    double _size=20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(padding: EdgeInsets.all(0),
        child: IconButton(
         icon: (_rating>=1? Icon(Icons.star,
         size: _size,)
        :Icon(Icons.star_border,
        size: _size,)),color: Colors.red[500],
        onPressed: _setRatingAsOne,
        iconSize: _size,),
        ),

        Container(padding: EdgeInsets.all(0),
        child: IconButton(
         icon: (_rating>=2? Icon(Icons.star,
         size: _size,)
        :Icon(Icons.star_border,
        size: _size,)),color: Colors.red[500],
        onPressed: _setRatingAsTwo,
        iconSize: _size,),
        ),

        Container(padding: EdgeInsets.all(0),
        child: IconButton(
         icon: (_rating>=3? Icon(Icons.star,
         size: _size,)
        :Icon(Icons.star_border,
        size: _size,)),color: Colors.red[500],
        onPressed: _setRatingAsthree,
        iconSize: _size,),
        ),



        Container(padding: EdgeInsets.all(0),
        child: IconButton(
         icon: (_rating>=4? Icon(Icons.star,
         size: _size,)
        :Icon(Icons.star_border,
        size: _size,)),color: Colors.red[500],
        onPressed: _setRatingAsFour,
        iconSize: _size,),
        ),

        Container(padding: EdgeInsets.all(0),
        child: IconButton(
         icon: (_rating>=5? Icon(Icons.star,
         size: _size,)
        :Icon(Icons.star_border,
        size: _size,)),color: Colors.red[500],
        onPressed: _setRatingAsFive,
        iconSize: _size,),
        ),


      ],
    );
  }
}


class HospitalBox extends StatelessWidget {
  const HospitalBox({super.key, required this.item});
  final Hospital item;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/"+this.item.image),
            Expanded(child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(this.item.name),
                  Text("price: ${item.price}"),
                  RatingBox(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
