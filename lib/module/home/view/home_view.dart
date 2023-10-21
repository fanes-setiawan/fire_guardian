import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fire_guardian/global_core/color/color.dart' as c;
import 'package:fire_guardian/core.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 18,
            color: c.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Builder(builder: (context) {
                List images = [
                  "https://statik.tempo.co/data/2023/10/20/id_1247286/1247286_720.jpg",
                  "https://soyacincau.com/wp-content/uploads/2018/05/fbhero_googlemapscaricon.jpg",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJGlmiBIO62wPdkcWzxrh33TZTjyyxSvS07w&usqp=CAU",
                  "https://img.cintamobil.com/2021/05/24/Ay6TmsFs/rute-peta-175b.jpg",
                ];

                return Column(
                  children: [
                    CarouselSlider(
                      carouselController: controller.carouselController,
                      options: CarouselOptions(
                        height: 160.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          controller.currentIndex = index;
                          controller.setState(() {});
                        },
                      ),
                      items: images.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: c.grey,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(6.0),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    imageUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: images.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => controller.carouselController
                              .animateToPage(entry.key),
                          child: Container(
                            width: 6.0,
                            height: 6.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? c.white
                                        : c.primary)
                                    .withOpacity(
                                        controller.currentIndex == entry.key
                                            ? 0.9
                                            : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Laporan  :",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: c.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "12/02/2023",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 4.0,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: c.primary,
                          child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: c.primary,
                                backgroundImage: const NetworkImage(
                                  "https://i.ibb.co/k15qWF7/photo-1487412720507-e7ab37603c6f-ixlib-rb-4-0.jpg",
                                ),
                              ),
                              title: Text(
                                "Jessica Doe",
                                style: TextStyle(
                                  color: c.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: c.red,
                                    size: 20.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "jl.nin aja dulu no.02",
                                      style: TextStyle(
                                          color: c.white,
                                          fontSize: 13,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(c.red),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "GO",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: c.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        );
                      },
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
