import 'package:flutter/material.dart';

/*
const age =27; //stala
const twiceTheAge = age * 2; //stala

String getFullName(String firstName, String lastName){
  return '$firstName $lastName';
}

String getFullName2(String firstName, String lastName) => '$firstName $lastName'; //pointer do funkcji

void printMyName(){

}
*/
void main() {
    //final - zmienna ktora nie moze byc zmieniona (const jest bardziej optymalne)
  runApp(const MyApp());
}

class Dog {
  final String name;
  Dog(this.name);

  factory Dog.fluffball(){ //factory constructor
    return Dog('Fluffball');
  }
}

void test8()
{
  final fluffball = Dog.fluffball();
  print(fluffball.name);
}

void test(){
  String? name = null;// jest uzywane w jezyku swift (zmienna jest nullable)
  print(name);
  name = 'Marek';
  print(name);
  name = null; 

  List<String?>? names = ['Foo','Bar','Baz2',null]; //lista jest nullable
  names = null; //tak tez moze byc

  const String? firstName = null;
  const String? middleName = null;
  const String? lastName = 'Baz';

  //cherry-picking non-null values
  //jesli wyrazenie po lewej jest null to wybierz prawe
  const firstNonNullValue = firstName ?? middleName ?? lastName;

}

void test2(){
  final names = ['Foo','Bar','Baz']; //0 based (zaczyna sie od 0) - lista
  print(names[0]); //Foo
  final dlugosc = names.length;
  print(dlugosc); //3
  //sets
  var names2 = {'Foo','Bar','Baz'}; //jesli dam jeszcze raz Foo to nie bedzie go w secie (bedzie error)
  names2.add('Foo');
  print(names2);

  //maps
  var names3 = { //keys must be unique
    'first': 'Foo',
    'second': 'Bar',
    'third': 'Baz'
  };
  print(names3);
  names3['third'] = "Lubie placki";
  print(names3);
}

void test3(String? firstName, String? middleName, String? lastName){
  String? name = firstName;
  name ??= middleName; //jesli name jest null to przypisz mu middleName
  name ??= lastName; //jesli name jest null to przypisz mu lastName
  print(name);
}

void test4(List<String>? names)
{
  // final int length;
  // if(names!=null){
  //   length = names.length;
  // }
  // else{
  //   length = 0;
  // }
  final length = names?.length ?? 0; //operator warunkowy
  names?.add('Baz'); //musi byc z ? bo nasza lista moze byc null  

}

enum PersonProperties {
  firstName, lastName, age
}

enum AnimalType {cat, dog, bunny}

void test5()
{
  print(PersonProperties.firstName);
  print(PersonProperties.firstName.name);
}

class Person
{
  final String name;

  Person(this.name); //constructor (basic)

  void run(){
    print("Running");
  }

  void printName()
  {
    print(name); //avoid this because it's not good practice
  }

  void breathe(){
    print("Breathing");
  }
}

abstract class LivingThing
{
  void breathe(){
    print("Living thing is breathing");
  }

  void move()
  {
    print("Living thing is moving");
  }
}

class Cat extends LivingThing
{
  void meow(){
    print("Meow");
  }
}

void test6(AnimalType type)
{
  print(type);

  switch(type){
    case AnimalType.cat:
      print('Meow');
      break;
    case AnimalType.dog:
      print('Woof');
      break;
    case AnimalType.bunny:
      print('Squeak');
      break;
  }

  print("Function is finished");
}

void test7()
{
  final person = Person('Zbyszek'); //tworzymy obiekt klasy
  person.run();
  print(person.name);
  person.printName();

  final fluffers = Cat();
  fluffers.breathe();
  fluffers.move();
  fluffers.meow();

  //final thing = LivingThing(); //not working because it's abstract class
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //print(getFullName('Marek', 'Kowalski'));
    //test6(AnimalType.cat);
    test8();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
