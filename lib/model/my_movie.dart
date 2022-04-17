class MyMovie{
  String? name;
  dynamic? phone;

  MyMovie(this.name,this.phone);

  MyMovie.fromJson(Map<String,dynamic>json){
    name=json['name'];
    phone=json['phone'];
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic>data=Map<String,dynamic>();
    data['name']=this.name;
    data['phone']=this.phone;
    return data;
  }
}