import 'package:coba/models/produk.dart';
import 'package:coba/views/produk_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> _products = [
    Product(
        nama: "Batik Madura",
        price: 10000,
        quantity: 20,
        image: "assets/images/batik.jpg"),
    Product(
        nama: "Sepatu Kaca",
        price: 20000,
        quantity: 15,
        image: "assets/images/kaca.jpg"),
    Product(
        nama: "Topi Bulan",
        price: 30000,
        quantity: 10,
        image: "assets/images/bulan.jpg"),
    Product(
        nama: "Jeruk Bali",
        price: 15000,
        quantity: 2,
        image: "assets/images/jeruk.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("AppBar"),
          centerTitle: true,
          leading: const Icon(Icons.home),
          actions: const [Icon(Icons.logout)],
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              height: _size.height * 0.15,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _products.length,
                  itemBuilder: ((context, index) => GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    MyProduct(product: _products[index])))),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          width: _size.width * 0.3,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Hero(
                                tag: _products[index].image,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              _products[index].image))),
                                ),
                              ),
                              Text(
                                _products[index].nama,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ))),
            )
          ],
        ));
  }
}
