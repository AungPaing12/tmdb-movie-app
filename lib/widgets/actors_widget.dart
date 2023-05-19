import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/constant/dimens.dart';
import 'actor_info_and_his_moives.dart';


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
        color: kBlackColor,
          child: CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(
              height: 300 ,
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
                    margin: const EdgeInsets.symmetric(horizontal: kSP5x),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kSP20x),
                      child: GestureDetector(
                      onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  ActorsInfoAndHisMovies(actorName: 'Jason Statham',
                          placeOfBirth:  "Shirebrook, "
                              "Derbyshire, England, UK", birthday: '1967-7-26', deadDay: '-', gender: 'Male', popularity: '108.212',
                        biography: "Jason Statham was born in Shirebrook, Derbyshire, to Eileen (Yates), a dancer, and Barry Statham, a street merchant and lounge singer. He was a Diver on the British National Diving Team and finished twelfth in the World Championships in 1992. He has also been a fashion model, black market salesman and finally of course, actor. He received the audition for his debut role as Bacon in Lock, Stock and Two Smoking Barrels (1998) through French Connection, for whom he was modeling. They became a major investor in the film and introduced Jason to Guy Ritchie, who invited him to audition for a part in the film by challenging him to impersonate an illegal street vendor and convince him to purchase fake jewelry.",
                          biography1: " Jason must have been doing something right because after the success of Lock, Stock and Two Smoking Barrels (1998) he teamed up again with Guy Ritchie for Snatch (2000), with co-stars including Brad Pitt, Dennis Farina and Benicio Del Toro. After Snatch (2000) came Turn It Up (2000) with US music star Ja Rule, followed by a supporting actor role in the sci-fi film Ghosts of Mars (2001), Jet Li's The One (2001) and another screen partnership with Vinnie Jones in Mean Machine (2001) under Guy Ritchie's and Matthew Vaughn's SKA Films. Finally in 2002 he was cast as the lead role of Frank Martin in The Transporter (2002). Jason was also in the summer 2003 blockbuster remake of The Italian Job (1969), The Italian Job (2003), playing Handsome Rob.",
                          biography2: "Throughout the 2000s, Statham became a star of juicy action B-films, most significantly Crank (2006) and Crank: High Voltage (2009), and also War (2007), opposite Jet Li, and The Bank Job (2008) and Death Race (2008), among others. In the 2010s, his reputation for cheeky and tough leading performances led to his casting as Lee Christmas in The Expendables (2010) and its sequels, the comedy Spy (2015), and as (apparently) reformed villain Deckard Shaw in Fast & Furious 6 (2013), Furious 7 (2015), The Fate of the Furious (2017), and Fast & Furious Presents: Hobbs & Shaw (2019). Apart from these blockbusters, he continued headlining B-films such as Homefront (2013).",
                          actorImageURL: images[index])));
                      },
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
                  ),
                  Positioned(
                      left: kSp90x,
                      bottom: kSP20x,
                      child: Text(actorsName[index],style: const TextStyle(fontSize: kFontSize18x,fontWeight: FontWeight.w800,color: kWhiteColor),)),
                  Positioned.fill(
                    top: kSp150x,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6)
                          ],
                          begin: Alignment.topCenter,
                          end:  Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}

class JasonStathamInfoAndHisMovies extends StatelessWidget {
  const JasonStathamInfoAndHisMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
       child: GestureDetector(
       onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ActorsInfoAndHisMovies(actorName: 'Jason Statham',
        placeOfBirth:  "Shirebrook, "
       "Derbyshire, England, UK", birthday: '1967-7-26', deadDay: '-', gender: 'Male', popularity: '108.212', biography: "Jason Statham was born in Shirebrook, Derbyshire, to Eileen (Yates), a dancer, and Barry Statham, a street merchant and lounge singer. He was a Diver on the British National Diving Team and finished twelfth in the World Championships in 1992. He has also been a fashion model, black market salesman and finally of course, actor. He received the audition for his debut role as Bacon in Lock, Stock and Two Smoking Barrels (1998) through French Connection, for whom he was modeling. They became a major investor in the film and introduced Jason to Guy Ritchie, who invited him to audition for a part in the film by challenging him to impersonate an illegal street vendor and convince him to purchase fake jewelry.",
       biography1: " Jason must have been doing something right because after the success of Lock, Stock and Two Smoking Barrels (1998) he teamed up again with Guy Ritchie for Snatch (2000), with co-stars including Brad Pitt, Dennis Farina and Benicio Del Toro. After Snatch (2000) came Turn It Up (2000) with US music star Ja Rule, followed by a supporting actor role in the sci-fi film Ghosts of Mars (2001), Jet Li's The One (2001) and another screen partnership with Vinnie Jones in Mean Machine (2001) under Guy Ritchie's and Matthew Vaughn's SKA Films. Finally in 2002 he was cast as the lead role of Frank Martin in The Transporter (2002). Jason was also in the summer 2003 blockbuster remake of The Italian Job (1969), The Italian Job (2003), playing Handsome Rob.", biography2: "Throughout the 2000s, Statham became a star of juicy action B-films, most significantly Crank (2006) and Crank: High Voltage (2009), and also War (2007), opposite Jet Li, and The Bank Job (2008) and Death Race (2008), among others. In the 2010s, his reputation for cheeky and tough leading performances led to his casting as Lee Christmas in The Expendables (2010) and its sequels, the comedy Spy (2015), and as (apparently) reformed villain Deckard Shaw in Fast & Furious 6 (2013), Furious 7 (2015), The Fate of the Furious (2017), and Fast & Furious Presents: Hobbs & Shaw (2019). Apart from these blockbusters, he continued headlining B-films such as Homefront (2013).",
        actorImageURL:  'https://www.onthisday.com/images/people/jason-statham-medium.jpg')));
    },
           child: CachedNetworkImage(
           imageUrl:'https://www.onthisday.com/images/people/jason-statham-medium.jpg',
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('images/tmdb_place_holder.png'))),
             errorWidget: (context, url, error) =>
               const Center(child: Icon(Icons.error)),
    ),
    ),
    ),
    );
  }
}
