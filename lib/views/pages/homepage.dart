import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'assets/iklan1.jpg',
    'assets/iklan2.jpg',
    'assets/iklan3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/kota.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/logo.png', height: 40), // Logo
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.favorite_border,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.notifications_none,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 8.0,
                    right: 8.0,
                    child: Card(
                      color: const Color.fromARGB(255, 182, 14, 2),
                      child: Container(
                        height: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 15, left: 10),
                              child: Text(
                                "Hi, Denny Malik Ibrahim",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                  color: Colors.white,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Your Balance',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Rp 9.747',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  color: Colors.white,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Bonus Balance',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          '0',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 4, bottom: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionButton(Icons.add_circle_outline, "TopUp"),
                  _buildActionButton(Icons.outbound_outlined, "CashOut"),
                  _buildActionButton(Icons.send_outlined, "Send Money"),
                  _buildActionButton(Icons.grid_view_outlined, "See All"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0, left: 12, right: 12, bottom: 20),
              child: GridView.count(
                crossAxisCount: 4, // 4 columns
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
                children: [
                  buildIconItem('Pulsa/Data', Icons.phone_android),
                  buildIconItem('Electricity', Icons.electrical_services),
                  buildIconItem('Cable TV', Icons.tv),
                  buildIconItem('E-Money', Icons.credit_card),
                  buildIconItem('Gereja', Icons.church),
                  buildIconItem('Infaq', Icons.volunteer_activism),
                  buildIconItem('Other', Icons.more_vert),
                  buildIconItem('More', Icons.more),
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: imgList
                  .map((item) => Container(
                        child: Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(item,
                                  fit: BoxFit.cover, width: 1000)),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconItem(String label, IconData icon) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 30),
          onPressed: () {},
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

Widget _buildActionButton(IconData icon, String label) {
  return Column(
    children: [
      IconButton(
        icon: Icon(icon, color: Colors.black38),
        onPressed: () {},
      ),
      Text(
        label,
        style: const TextStyle(color: Colors.black, fontSize: 14),
      ),
    ],
  );
}
