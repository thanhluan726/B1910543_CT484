import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_grid_tile.dart';
import 'products_manager.dart';

import'../../models/product.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;

  const ProductsGrid(this.showFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    //Doc ra danh sach cac product se duoc hien thi tu ProductsManage
    final products = context.select<ProductsManager, List<Product>>(
      (productsManager) => showFavorites
      ? productsManager.favoriteItems
      : productsManager.items);
  
    final productsManager = ProductsManager();
    final product = showFavorites ? productsManager.favoriteItems : productsManager.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: product.length,
      itemBuilder: (ctx, i) => ProductGridTile(product[i]),
      
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );

}
}