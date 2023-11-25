import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    super.key,
    required this.image,
    required this.price,
    required this.menu,
    required this.store,
  });

  final String image;
  final String price;
  final String menu;
  final String store;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(2, 1),
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    ),
                  ),
                  // color: Colors.black,
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text("P109.00"),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Text("Pork Sisig", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black), textAlign: TextAlign.left,),
                SizedBox(height: 5,),
                Text("Kitchen Garage"),
              ],
            ),
          ),

          Expanded(
            flex: 1,
              child: Container(

          )),
        ],
      ),

      // child: ClipRRect(
      //   borderRadius: BorderRadius.all(const Radius.circular(5.0)),
      //   child: Stack(
      //     children: <Widget>[
      //       //   Image.asset(
      //       //     "images/kakan.png",
      //       //     fit: BoxFit.cover,
      //       //     width: 1000,
      //       //   ),
      //       Image.network(item, fit: BoxFit.cover, width: 1000.0),
      //       Positioned(
      //         bottom: 0.0,
      //         left: 0.0,
      //         right: 0.0,
      //         child: Container(
      //           decoration: const BoxDecoration(
      //             gradient: LinearGradient(
      //               colors: [
      //                 Color.fromARGB(200, 0, 0, 0),
      //                 Color.fromARGB(0, 0, 0, 0)
      //               ],
      //               begin: Alignment.bottomCenter,
      //               end: Alignment.topCenter,
      //             ),
      //           ),
      //           padding: const EdgeInsets.symmetric(
      //               vertical: 10.0, horizontal: 20.0),
      //           child: Text(
      //             'No. ${imgList.indexOf(item)} image',
      //             style: const TextStyle(
      //               color: Colors.white,
      //               fontSize: 20.0,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
