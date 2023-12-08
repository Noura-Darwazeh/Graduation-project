import 'package:flutter/material.dart';
import 'package:soft/product_detail.dart';

class product_page12 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },icon:Icon(Icons.arrow_back,color: Colors.white,)
          ),
          title: Text('Products',style: TextStyle(fontSize: 20,color: Color(0xFF545D68)),),
          actions: <Widget>[
            IconButton(
                onPressed: (){},icon:Icon(Icons.notifications_none,color: Colors.black,)
            ),

          ],
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 15),
            Container(

              padding: EdgeInsets.only(right: 15),
              width: MediaQuery.of(context).size.width-30,
              height: MediaQuery.of(context).size.height-50,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: .8,
                children: <Widget>[
                  _buildCard('Highliter Powder', '\$40', 'assets/high.jpg', false, false, context),
                  _buildCard('Mackeup Organizer', '\$100', 'assets/org.jpg', false, false, context),
                  _buildCard('Nail tools', '\$70', 'assets/art.jpg', false, false, context),
                  _buildCard('Facial Roller', '\$15', 'assets/roller.jpg', false, false, context),
                  _buildCard('Wig', '\$70', 'assets/wig.jpg', false, false, context),
                  _buildCard('Eyebrows Maskara', '\$80', 'assets/brows.jpg', false, false, context),
                  _buildCard('Pink Eyeliners', '\$55', 'assets/pink.jpg', false, false, context),
                  _buildCard('Body Scrub', '\$100', 'assets/body.jpg', false, false, context),
                  _buildCard('Body Lotion', '\$35', 'assets/lotion5.jpg', false, false, context),
                  _buildCard('Rimmel Mascara', '\$50', 'assets/mascara.jpg', false, false, context),

                ],
              ),

            )
          ],
        ),
      ),
    );
  }
  Widget _buildCard(String Name,String price,String imgPath,bool added,bool isFavorite,context){
    return Padding(
      padding: EdgeInsets.only(top: 5,bottom: 5,left: 5,right: 5),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>product_detail(
                assetpath:imgPath,
                product_price:price,
                product_name:Name, product_description: "nul",
              ))
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 3,
                blurRadius: 5,
              )
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite?Icon(Icons.favorite,color: Colors.pink):
                    Icon(Icons.favorite_border,color: Colors.pink),
                  ],
                ),
              ),
              Hero(tag: imgPath,
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,

                        )
                    ),
                  )),
              SizedBox(height: 7,),
              Text(
                price,
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 14
                ),
              ),
              Text(
                Name,
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 20
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  color: Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15,right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if(!added)...[
                      Icon(Icons.shopping_bag,color: Color(0xFFD17E5),
                        size: 12,
                      ),
                      Text('More details',style: TextStyle(
                        color: Colors.pink,
                        fontSize: 17,

                      ),),
                    ],
                    if(!added)...[
                      Icon(Icons.remove_circle_outline,color: Colors.pink,
                        size: 12,
                      ),
                      Text('3',style: TextStyle(
                        color: Color(0xFFD17E0),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),),
                      Icon(Icons.add_circle_outline,color:Colors.pink,size:12),
                    ],

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );

  }

}