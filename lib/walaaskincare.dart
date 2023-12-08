import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class walaskin extends StatefulWidget{
  @override
  _walaskinState createState() => _walaskinState();
}
class _walaskinState extends State<walaskin>{
  int activeindex=0;
  final  List<String> imgList = [
    'https://www.cecilydayspa.co.uk/wp-content/uploads/2021/12/Berkhamsted-Day-Spa-What-is-Full-Face-Threading-Blog-Image.jpg',
    'https://honnaimg.elwatannews.com/image_archive/841x427/7314516701655725345.jpg',
    'https://mirra.pt/wp-content/uploads/2020/08/deep-cleansing-facial-porto-portugal.jpeg',
    'https://modo3.com/thumbs/fit630x300/158292/1525258215/%D9%81%D9%88%D8%A7%D8%A6%D8%AF_%D8%A7%D9%84%D9%85%D9%8A%D8%B2%D9%88%D8%AB%D9%8A%D8%B1%D8%A7%D8%A8%D9%8A_%D9%84%D9%84%D8%A8%D8%B4%D8%B1%D8%A9.jpg',
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
          title: Text('Skin Care Works'),
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
