import 'package:flutter/material.dart';
import 'package:flutter_intership/model/Dtabase.dart';
import 'package:flutter_intership/screen/CustomerProduct.dart';
import 'package:flutter_intership/screen/login_screen.dart';
class Customer_Home extends StatefulWidget {
  String email="";
  Customer_Home(this.email,{Key? key}) : super(key: key);

  @override
  State<Customer_Home> createState() => _Customer_HomeState();
}

class _Customer_HomeState extends State<Customer_Home> {
  String Dvalue="Electronics";
   var items = [   
    'Electronics',
    'Accessories',
    'Fashion',
    'Grocceries',
    'Kids',
    'Household',
    'Men',
    'Women',
  ];
  var category="";
  @override
  void initState() {
    super.initState();
    category=Dvalue;
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar:AppBar(
        title:const Text('Customer Products',style:TextStyle(color:Colors.white,fontSize:30)),
        centerTitle: true,

        actions: [
          IconButton(onPressed: (){
             Database().signOut();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          }, icon: const Icon(Icons.logout))
      ,]
          ),
        
      

      floatingActionButton: FloatingActionButton(
      
        onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddProduct()));
        },
        child:const Icon(Icons.add,color:Colors.white),
      ),

       body:SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children:[
                const Padding(
                  padding:EdgeInsets.all(10), 
                ),
                const Text("Search:",style:TextStyle(fontSize:20,color:Colors.redAccent,fontWeight:FontWeight.bold,)),
                const SizedBox(
                  width:20,
                ),
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(5),
              width: 190,
              height: 40,
               decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(5),
               color: Colors.redAccent,
        ),
              
              child: DropdownButton(
                borderRadius: BorderRadius.circular(20),
                dropdownColor: const Color.fromARGB(255, 244, 197, 54),
              
                focusColor: Colors.yellow,
                iconEnabledColor: Colors.greenAccent,
              
                
                    value:Dvalue,
                    icon:const Icon(Icons.keyboard_arrow_down), 
                    items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    Dvalue = newValue!;
                    category=Dvalue;
                  });
                },),
            ),],
            ),
            
            CustomerProduct(category),
        ]),
      ),
    );
  }
}