
class Product {
  int _id;
  String _name;
  String _description;
  double _price;



// Constructer
  Product(this._name,this._description, this._price);
  Product.withId(this._id, this._name, this._description, this._price);

  //Getter And Setter

//Getter
  int get id => _id;
  String get name => _name;
  String get description => _description;
  double get price => _price;

// Setter
  set name(String value) {
    if (value.length >= 2) {
      _name = value;
    }
  }

// Setter
  set description(String value) {
    if (value.length >= 2) {
      _description = value;
    }
  }

// Setter
  set price(double value) => value;
//Maps
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["name"] = _name;
    map["description"] = _description;
    map["price"] = _price;

    if (_id != null) {
      map["id"] = _id;
    }

    return map;
  } 
  
  Product.fromObject(dynamic o){
    
    this._id = o["Id"];
    this._name = o["Name"];
    this._description = o["Description"];
    this._price = double.tryParse(o["Price"].toString());

  }
}
