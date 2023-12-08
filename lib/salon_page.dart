import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'salon2.dart';

class salonss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: new LinearGradient(colors: [Colors.black87, Colors.pink])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text(
            'Saloonati',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notification_important),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 2, bottom: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.grey,
                                border: Border.all(
                                  width: .5,
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Tulkarm',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.grey,
                                border: Border.all(
                                  width: .5,
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Nabluse',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.grey,
                                border: Border.all(
                                  width: .5,
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Ramallah',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.grey,
                                border: Border.all(
                                  width: .5,
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Jenin',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.grey,
                                border: Border.all(
                                  width: .5,
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Biethlehem',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.grey,
                                border: Border.all(
                                  width: .5,
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Jerusalem',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.grey,
                                border: Border.all(
                                  width: .5,
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Qalqilieh',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ))),
                  )
                ],
              ),
            ),
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: 330,
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: .5, color: Colors.white),
                                    ),
                                  ),
                                  label: Text(
                                    "Walaa Florita Salon",
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.more_vert,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(builder: (context)=>salonsdetails(
                                //
                                //     ))
                                // );
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          'https://scontent.fjrs26-1.fna.fbcdn.net/v/t39.30808-6/276296802_2859470284350977_6069028483818969657_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=-hhn5z5tM08AX-5opm5&_nc_ht=scontent.fjrs26-1.fna&oh=00_AT_YYnXcOpLHbMHa1Y2gY0DIyTI6oJN4lvoTlNMIJD66lw&oe=633B8E0D',
                                        )),
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 3.0, left: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                Text(
                                  'Tulkarem',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: 330,
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: .5, color: Colors.white),
                                    ),
                                  ),
                                  label: Text(
                                    "Hanan Salon",
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(builder: (context)=>salonsdetails(
                                    //
                                    //     ))
                                    // );
                                  },
                                  icon: Icon(
                                    Icons.more_vert,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(builder: (context)=>salonsdetails
                                //       (
                                //
                                //     ))
                                // );
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          'https://haya-online.com/media/cache/wp_article_main_cover_photo/uploads/cms/standalone-content/thumbnail/62aad6038bd10353452898.jpeg',
                                        )),
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 3.0, left: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                Text(
                                  'Nabluse',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: 330,
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: .5, color: Colors.white),
                                    ),
                                  ),
                                  label: Text(
                                    "La Bella Beauty Center",
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(builder: (context)=>salonsdetails(
                                    //     ))
                                    // );
                                  },
                                  icon: Icon(
                                    Icons.more_vert,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(builder: (context)=>salonsdetails())
                                // );
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYKcw0lIy1Cr6jsSrmOk6uLqNtGLUpwWNpQA&usqp=CAU',
                                        )),
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 3.0, left: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                Text(
                                  'Jenin',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: 330,
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: .5, color: Colors.white),
                                    ),
                                  ),
                                  label: Text(
                                    "Capillo Beauty Center",
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.more_vert,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(builder: (context)=>salonsdetails())
                                // );
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          'https://i.pinimg.com/236x/3d/2e/1f/3d2e1f03fc65ffa19c082ca3be422489.jpg',
                                        )),
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 3.0, left: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                Text(
                                  'Ramallah',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: 330,
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: .5, color: Colors.white),
                                    ),
                                  ),
                                  label: Text(
                                    "Makeup By Hala",
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.more_vert,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(builder: (context)=>salonsdetails(
                                //
                                //     ))
                                // );
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          'https://image.winudf.com/v2/image/Y29tLnZpZGVvLm1ha2V1cF9zY3JlZW5fMl8xNTMxODUzNTQ2XzA2Ng/screen-2.jpg?fakeurl=1&type=.webp',
                                        )),
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 3.0, left: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                Text(
                                  'Ramallah',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(2000.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

final List<String> imgList = [
  'https://images.unsplash.com/photo-1580421383874-7e60f05f64b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
  'https://mostaql.hsoubcdn.com/uploads/thumbnails/835649/5fb1c7c34bc0a/Beauty-Centre-1.jpg',
  'https://kevsbest.com/wp-content/uploads/2019/06/Best-Beauty-Services-in-New-York-City.jpg',
  'https://selevabeautycenter.com/wp-content/uploads/2018/08/tvm-home.jpg',
  'https://blog.evntoo.com/wp-content/uploads/2021/08/%D8%A7%D9%81%D8%B6%D9%84-%D9%85%D9%8A%D9%83%D8%A8-%D8%A7%D8%B1%D8%AA%D8%B3%D8%AA.jpg',
  'https://i.pinimg.com/originals/b2/df/d1/b2dfd147a76b650b61f989f8bde3b475.jpg',
  'https://www.eqrae.com/wp-content/uploads/2021/12/A-5.jpg',
  'https://www.aljazeera.net/wp-content/uploads/2020/08/beauty-4993472_1280.jpg?resize=770%2C513',
  'https://i0.wp.com/ejabatalmustaqbal.com/wp-content/uploads/2022/06/%D9%86%D9%82%D8%B4-%D8%AD%D9%86%D8%A7%D8%A1-%D8%A8%D8%B3%D9%8A%D8%B7-%D9%84%D9%84%D8%A7%D8%B5%D8%A7%D8%A8%D8%B9-2022.jpeg?fit=600%2C600&ssl=1',
  'https://imagesawe.s3.amazonaws.com/companies/images/2019/10/suhail_bob_beauty_salon.png',
];
