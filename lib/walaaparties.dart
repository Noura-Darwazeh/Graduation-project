import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class walaaparties extends StatefulWidget{
  @override
  _walaapartiesState createState() => _walaapartiesState();
}
class _walaapartiesState extends State<walaaparties>{
  int activeindex=0;
  final  List<String> imgList = [
    'https://www.sayidaty.net/sites/default/files/styles/900_scale/public/2022-02/67578.jpeg',
    'https://www.almrsal.com/wp-content/uploads/2022/08/%D8%AA%D8%B3%D8%B1%D9%8A%D8%AD%D8%A7%D8%AA-%D8%B4%D8%B9%D8%B1-%D9%86%D8%A7%D8%B9%D9%85%D8%A9-%D8%A8%D8%B6%D9%81%D9%8A%D8%B1%D8%A9.jpeg',
    'https://www.sayidaty.net/sites/default/files/styles/900_scale/public/2020/04/16/6618606-1195004289.jpg',
    'https://alshababradio.ps/upload/ar/images/1658816186-3509-36.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
          new LinearGradient(colors: [Colors.black, Colors.pink])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Parties Works'),
          centerTitle: true,
        ),
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(height: 400,

                    //autoPlay:true,
                    autoPlayInterval: Duration(seconds:3),
                    onPageChanged: (index,reason)=>
                        setState(()=>activeindex=index),
                    // viewportFraction: 1,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height

                ),
                itemCount: imgList.length,
                itemBuilder: (context,index,realIndex){
                  final imgLists= imgList[index];
                  return buildImage(imgLists,index);

                },


              ),
              SizedBox(
                height: 32,
              ),
              buildIndecator(),
            ],
          ),
        ),

      ),
    );




  }


  Widget buildIndecator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeindex,
      count: imgList.length,
      effect: JumpingDotEffect(

          dotHeight: 20,dotWidth: 20,activeDotColor: Colors.black
      ),




    );
  }

}
Widget buildImage(String imgList,int index){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 25),
    color: Colors.grey,
    width: double.infinity,
    child: Image.network(imgList,fit: BoxFit.cover,),

  );


}
