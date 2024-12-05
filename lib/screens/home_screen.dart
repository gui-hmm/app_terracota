import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terracota/utils/card_provider.dart';
import 'package:terracota/utils/product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Lista de produtos de exemplo
  final List<Product> products = [
    Product(imageUrl: 'assets/images/p1.png', name: 'Vasos de cerâmica', price: 160.00),
    Product(imageUrl: 'assets/images/p2.png', name: 'Panela de barro', price: 145.00),
    Product(imageUrl: 'assets/images/p3.png', name: 'Estatueta de terracota', price: 350.00),
    Product(imageUrl: 'assets/images/p4.png', name: 'Caldeirão de barro', price: 160.00),
    Product(imageUrl: 'assets/images/p5.png', name: 'Potes de barro', price: 145.00),
    Product(imageUrl: 'assets/images/p6.png', name: 'Tigelas de cerâmica', price: 145.00),
    Product(imageUrl: 'assets/images/p7.png', name: 'Leão de barro', price: 300.00),
    Product(imageUrl: 'assets/images/p8.png', name: 'Cervos de cerâmica', price: 500.00),
    Product(imageUrl: 'assets/images/p9.png', name: 'São Francisco', price: 250.00),
    Product(imageUrl: 'assets/images/p10.png', name: 'Jarra de cerâmica', price: 150.00),
    Product(imageUrl: 'assets/images/p11.png', name: 'Cisnes de cerâmica', price: 200.00),
    Product(imageUrl: 'assets/images/p12.png', name: 'Coelho de barro', price: 130.00),
  ];

  // Função para mostrar o diálogo de quantidade do produto
  void _showQuantityDialog(BuildContext context, Product product) {
  int quantity = 1;  // Quantidade inicial do produto

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Selecionar Quantidade'),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Exibir a imagem do produto
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    product.imageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                // Nome e preço do produto
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(height: 20),
                // Controle de quantidade
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                    Text(quantity.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Adicionar o produto ao carrinho
              final cartProvider = Provider.of<CartProvider>(context, listen: false);
              cartProvider.addItem(product, quantity);

              // Fechar o diálogo
              Navigator.pop(context);
            },
            child: Text('Adicionar ao Carrinho'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);  // Fechar o diálogo
            },
            child: Text('Cancelar'),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180.0,
            floating: true,
            pinned: true,
            backgroundColor: Color(0xFF802600),
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            title: Center(
              child: Container(
                child: Image.asset(
                  'assets/images/logomarca_clara.png',
                  height: 55,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Container(
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                ),
              ),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                bool isCollapsed = constraints.maxHeight < 170;

                return FlexibleSpaceBar(
                  title: isCollapsed
                  ? Container() // Quando colapsado, não mostrar título
                  : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Texto informativo (se necessário)
                        const Padding(
                          padding: EdgeInsets.only(right: 40.0, top: 90.0),
                          child: Text( 
                            'Explore nossa coleção de artesanato!',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 12),
                        // Campo de pesquisa
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: Container(
                            width: 220,
                            height: 35,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 5),
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Buscar produtos...',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                );
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 180.0, left: 32.0, top: 10.0),
              child: Text(
                'Mais Vendidos',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Color(0xff802600)),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final product = products[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => _showQuantityDialog(context, product), // Ao clicar, abrir o diálogo
                      child: ProductCard(product: product),
                    ),
                  );
                },
                childCount: products.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MediaQuery.of(context).size.width / 200).floor(),
                crossAxisSpacing: 14.0,
                mainAxisSpacing: 14.0,
                childAspectRatio: 0.75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFFFFF),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              product.imageUrl,
              height: 130,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14, color: Color(0xff000000)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
