class ECommerceProductModel
{
   late String message;
  List<ProductModel>? products = [];

  ECommerceProductModel.fromJson(Map<String, dynamic> json)
  {
    message = json['message'];
    json['data'].forEach((element){
      products!.add(ProductModel.fromJson(element));
    });
  }


}

class ProductModel
{
   int  ? id;
   late String name;
   dynamic  price;
   dynamic quantity;
   dynamic shortDescription;
   dynamic fullDescription;

  ProductModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    price = json['final_price'];
    quantity = json['quantity'];
    shortDescription = json['short_description'];
    fullDescription = json['full_description'];
  }
}


