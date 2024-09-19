import 'package:flutter/material.dart';
import 'package:shopping_app/data_fatching/fatch.dart';
import 'package:shopping_app/model/jjson_to_dart';
import 'package:shopping_app/pages/buymorepage.dart';
import 'package:shopping_app/pages/detailspage.dart';
import 'package:shopping_app/pages/for_sms/sms.dart';
import 'package:shopping_app/variable/top_search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imageList = ['assets/product.jpg'];

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();

    return Scaffold(
      //appbar
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Zesty",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Buy",
                  style:
                      TextStyle(color: const Color.fromARGB(255, 227, 19, 4)),
                )
              ],
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Sms()));
                },
                child: Icon(Icons.sms))
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  labelText: "search",
                ),
              ),
            ),
            //image for attraction
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "only for you",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const Text("70% off"),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.red),
                              ),
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  "buy >",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Image.asset('assets/phone_1.png'),
                      )
                    ],
                  ),
                ),
              ),
            ),

            //product list
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular  product",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Buymorepage()));
                    },
                    child: Text("view more"),
                  )
                ],
              ),
            ),
            //catagory
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                    itemCount: a.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          focusColor: Colors.red,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Buymorepage()));
                          },
                          child: Container(
                            height: 5,
                            width: 110,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              a[index],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      );
                    }),
              ),
            ),

            //product view
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 1800,
                child: FutureBuilder<List<Product>>(
                    future: fatchdata(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Handle error state
                        return Text(
                            "Error loading products: ${snapshot.error}");
                      } else if (!snapshot.hasData ||
                          snapshot.data == null ||
                          snapshot.data!.isEmpty) {
                        // Handle the case where there's no data or the data is null/empty
                        return Text("No products available");
                      } else {
                        final Product = snapshot.data!;
                        return GridView.builder(
                            itemCount: Product.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 270,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              final Products = Product[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) => Detailspage())));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              77, 212, 87, 87)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Card(
                                        child: SizedBox(
                                            height: 200,
                                            width: 200,
                                            child: Text("")),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            Products.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text("add")
                                        ],
                                      ),
                                      Text(
                                        "\$ ${Products.price.toString()}",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    }),
              ),
            ),

            Center(child: TextButton(onPressed: () {}, child: Text("see More")))
          ],
        ),
      ),
    );
  }
}
