import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class walaanails extends StatefulWidget{
  @override
  _walaanailsState createState() => _walaanailsState();
}
class _walaanailsState extends State<walaanails>{
  int activeindex=0;
  final  List<String> imgList = [
    'https://moon4online.com/images/products/sliders/16420770468281.jpg',
    'https://www.yasmina.com/uploads/sites/5/2022/02/14da892ea24268a8ea395bead3dd25a5f067436d.jpg',
    'https://www.sayidaty.net/sites/default/files/styles/900_scale/public/2019/02/12/4932131-498455786.jpg',
    'https://i0.wp.com/jnyhnews.com/wp-content/uploads/2022/10/6245456-498891981.jpg'

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
          title: Text('Nails Works'),
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
