class SellerModel{
  String?   uid;
  String? name;
  String? email;
  String? buisnessName;
  String? city;
  String? category;
  SellerModel({this.uid,this.email,this.buisnessName,this.city,this.category, this.name}); 
 //recieve data from the server
  factory SellerModel.fromMap(map){
    return SellerModel(
      uid:map['uid'],
      name:map['name'],
      email:map['email'],
      buisnessName:map['buisnessName'],
      city:map['city'],
      category:map['category'],
    );
  }
  //sending data to our server
  Map<String,dynamic>toMap(){
    return{
      'uid':uid,
      'email':email,
      'buisnessName':buisnessName,
      'city':city,
      'category':category
    };
}
}