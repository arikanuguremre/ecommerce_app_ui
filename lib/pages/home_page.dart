import 'package:ecommerce_app_ui/components/bottom_nav_bar.dart';
import 'package:ecommerce_app_ui/pages/cart_page.dart';
import 'package:ecommerce_app_ui/pages/shop_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {

//this selected index is to control the bottom nav bar
int _selectedIndex=0;

//this method will update our selected index.
 void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


//pages to display
final List<Widget>_pages = [
  //shop page
  const ShopPage(),
  //Cart Page
  const CartPage(),
];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar:  MyBottomNavBar(
        onTabChange:(index)=>navigateBottomBar(index) ,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
            icon:const Icon(
              Icons.menu,
              color:Colors.black
              ),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              );
          }
        ),
       
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              //logo
          Column(children: [        
            DrawerHeader(
              child: Image.asset(
                "lib/images/logo.png",color:Colors.white),
              ),
         
          //other pages
          const Padding(
            padding:  EdgeInsets.only(left:25.0),
            child: ListTile(
              leading: Icon(Icons.home,color:Colors.white),
              title:Text('Home',style: TextStyle(color:Colors.white70),),

            ),
          ),
          const Padding(
            padding:  EdgeInsets.only(left:25.0),
            child: ListTile(
              leading: Icon(Icons.info,color:Colors.white),
              title:Text('About',style: TextStyle(color:Colors.white70),),

            ),
          ),],),
          const Padding(
            padding:  EdgeInsets.only(left:25.0),
            child: ListTile(
              leading: Icon(Icons.logout,color:Colors.white),
              title:Text('Logout',style: TextStyle(color:Colors.white70),),

            ),
          )
        ],
        )
      ),

      body:_pages[_selectedIndex]
    );
  }
  
 
}