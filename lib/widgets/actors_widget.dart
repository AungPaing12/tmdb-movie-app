import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Actors extends StatefulWidget {
  const Actors({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageDemoState();
  }
}

class _PrefetchImageDemoState extends State<Actors> {
  final List<String> images = [
    'https://www.onthisday.com/images/people/jason-statham-medium.jpg',
    'https://media.gq-magazine.co.uk/photos/5d13ad12976fa30cf6f3b2a2/1:1/w_1280,h_1280,c_limit/HP.jpg',
    'https://media.gq.com/photos/5e6128d2398289000862596e/1:1/w_805,h_805,c_limit/tom-hardy-lead-840-social.jpg'
    'https://images.indianexpress.com/2021/07/robert-downey-jr-1200.jpeg',
    'https://images.mubicdn.net/images/cast_member/2184/cache-2992-1547409411/image-w856.jpg'

  ];

  final List<String> actorsName = [
    'Jason Statham',
    'The Rock',
    'Tom Hardy',
    'Tom Cruise',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(
              height: 250 ,
              scrollDirection: Axis.horizontal,
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            itemBuilder: (context, index, realIdx) {
              return Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl:
                        images[index],
                        fit: BoxFit.cover,

                        placeholder: (context, url) => Center(child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset('images/tmdb_place_holder.png'))),
                        errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 90,
                      bottom: 20,
                      child: Text(actorsName[index],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.white),))
                ],
              );
            },
          )),
    );
  }
}