



class CartModel {
  int? itemId;
  int? itemProductId;
  String? itemProductName;
  String? itemProductImage;
  String? itemProductPrice;
  int? itemProductDiscount;
  double? itemProductPriceAfterDiscount;
  int? itemProductStock;
  int? itemQuantity;
  double? itemTotal;

  CartModel(
      {this.itemId,
        this.itemProductId,
        this.itemProductName,
        this.itemProductImage,
        this.itemProductPrice,
        this.itemProductDiscount,
        this.itemProductPriceAfterDiscount,
        this.itemProductStock,
        this.itemQuantity,
        this.itemTotal});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemProductId = json['item_product_id'];
    itemProductName = json['item_product_name'];
    itemProductImage = json['item_product_image'];
    itemProductPrice = json['item_product_price'] ;
    itemProductDiscount = json['item_product_discount'];
    itemProductPriceAfterDiscount = json['item_product_price_after_discount'];
    itemProductStock = json['item_product_stock'];
    itemQuantity = json['item_quantity'];
    itemTotal = json['item_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_product_id'] = this.itemProductId;
    data['item_product_name'] = this.itemProductName;
    data['item_product_image'] = this.itemProductImage;
    data['item_product_price'] = this.itemProductPrice;
    data['item_product_discount'] = this.itemProductDiscount;
    data['item_product_price_after_discount'] =
        this.itemProductPriceAfterDiscount;
    data['item_product_stock'] = this.itemProductStock;
    data['item_quantity'] = this.itemQuantity;
    data['item_total'] = this.itemTotal;
    return data;
  }
}