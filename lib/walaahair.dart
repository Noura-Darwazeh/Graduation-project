import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class walahair extends StatefulWidget{
  @override
  _walahairState createState() => _walahairState();
}
class _walahairState extends State<walahair>{
  int activeindex=0;
  final  List<String> imgList = [
    'https://m7et.com/wp-content/uploads/2021/05/4912-%D8%AA%D8%B9%D8%B1%D9%81%D9%8A-%D8%A8%D8%A7%D9%84%D8%B5%D9%88%D8%B1-%D8%A7%D9%84%D9%89-%D8%A7%D9%83%D8%AB%D8%B1-%D8%A7%D9%84%D9%88%D8%A7%D9%86-%D8%A7%D9%84%D8%B4%D8%B9%D8%B1-%D8%B1%D9%88%D8%A7%D8%AC%D8%A7-680x0-2-680x470.jpg',
    'https://i.ytimg.com/vi/Le8L9Cy7tCo/hqdefault.jpg',
    'https://www.aljamila.com/sites/default/files/styles/1100x732_scale/public/2021-06/4132431-510760101.jpg',
    'https://selevabeautycenter.com/wp-content/uploads/2018/08/tvm-home.jpg',
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
          title: Text('Hair Works'),
          centerTitle: true,
        ),
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(height: 400,//autoPlay:true,
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
    margin: EdgeInsets.symmetric(horizontal: 20),
    color: Colors.grey,
    width: double.infinity,
    child: Image.network(imgList,fit: BoxFit.cover,),

  );


}
