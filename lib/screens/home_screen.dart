import 'package:flutter/material.dart';
import '../utils/auth_service.dart';  // Função para limpar o login

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Lista de produtos de exemplo
  final List<Product> products = [
    Product(
      imageUrl: 'assets/images/p1.png',
      name: 'Vasos de cerâmica',
      price: 160.00,
    ),
    Product(
      imageUrl: 'assets/images/p2.png',
      name: 'Panela de barro',
      price: 145.00,
    ),
    Product(
      imageUrl: 'assets/images/p3.png',
      name: 'Estatueta de terracota',
      price: 350.00,
    ),
    Product(
      imageUrl: 'assets/images/p4.png',
      name: 'Caldeirão de barro',
      price: 160.00,
    ),
    Product(
      imageUrl: 'assets/images/p5.png',
      name: 'Potes de barro',
      price: 145.00,
    ),
    Product(
      imageUrl: 'assets/images/p6.png',
      name: 'Tigelas de cerâmica',
      price: 145.00,
    ),
    Product(
      imageUrl: 'assets/images/p7.png',
      name: 'Leão de barro',
      price: 300.00,
    ),
    Product(
      imageUrl: 'assets/images/p8.png',
      name: 'Cervos de cerâmica',
      price: 500.00,
    ),
    Product(
      imageUrl: 'assets/images/p9.png',
      name: 'São Francisco',
      price: 250.00,
    ),
    Product(
      imageUrl: 'assets/images/p10.png',
      name: 'Jarra de cerâmica',
      price: 150.00,
    ),
    Product(
      imageUrl: 'assets/images/p11.png',
      name: 'Cisnes de cerâmica',
      price: 200.00,
    ),
    Product(
      imageUrl: 'assets/images/p12.png',
      name: 'Coelho de barro',
      price: 130.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar com cabeçalho encolhível
          SliverAppBar(
            expandedHeight: 230.0, // altura inicial do header
            collapsedHeight: 60.0, 
            floating: false, // não permite que o AppBar fique flutuando
            pinned: true, // mantém o cabeçalho no topo quando encolher
            backgroundColor: Color(0xFF802600), // cor de fundo do header
            elevation: 0, // Remover a sombra
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                bool isCollapsed = constraints.maxHeight < 220;

                return FlexibleSpaceBar(
                  title: isCollapsed
                      ? Container() // Não mostra título quando encolhido
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Ícones de menu e carrinho no topo
                            Padding(
                              padding: const EdgeInsets.only(top: 50, left: 16, right: 16),  // Ajuste no padding
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.settings, color: Colors.white),
                                    onPressed: () {
                                      // Navegar até a tela de configurações
                                      Navigator.pushNamed(context, '/settings');
                                    },
                                  ),
                                  // Logomarca no centro
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                    child: Image.asset(
                                      'assets/images/logomarca_clara.png', // Caminho para sua logomarca
                                      height: 35, // Tamanho da logomarca quando o cabeçalho está expandido
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                                    onPressed: () {
                                      // Aqui vai o código para navegar para a tela de carrinho
                                      Navigator.pushNamed(context, '/cart');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Explore nossa coleção de artesanato!',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(height: 12),
                            // Barra de pesquisa (só aparece quando expandido)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
                                width: 250,
                                height: 45,
                                child: TextField(
                                  decoration: InputDecoration(
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
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (isCollapsed) ...[
                        // Barra de pesquisa e ícones de menu e carrinho (enquanto encolhido)
                        Padding(
                          padding: const EdgeInsets.only(top: 48), // Ajuste no padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.settings, color: Colors.white),
                                onPressed: () {
                                  // Navegar até a tela de configurações
                                  Navigator.pushNamed(context, '/settings');
                                },
                              ),
                              // Barra de pesquisa (aparece quando o cabeçalho encolhe)
                              Container(
                                width: 300,
                                height: 45,
                                child: TextField(
                                  decoration: InputDecoration(
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
                              IconButton(
                                icon: Icon(Icons.shopping_cart, color: Colors.white),
                                onPressed: () {
                                  // NAvegar até a tela de carrinho
                                  Navigator.pushNamed(context, '/cart');
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),

          // Lista de produtos com SliverGrid para exibir 3 produtos por linha
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 180.0,left: 32.0, top: 10.0),
              child: Text(
                'Mais Vendidos',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Color(0xff802600)),
              ),
            ),
          ),

          // Grid de produtos (adaptável conforme o tamanho da tela)
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),  // Adiciona padding nas bordas do grid
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final product = products[index];
                  return Padding(  // Padding para os produtos não ficarem colados nas bordas
                    padding: const EdgeInsets.all(8.0),
                    child: ProductCard(product: product),
                  );
                },
                childCount: products.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MediaQuery.of(context).size.width / 200).floor(), // Ajusta dinamicamente o número de colunas
                crossAxisSpacing: 14.0,
                mainAxisSpacing: 14.0,
                childAspectRatio: 0.75, // Ajuste para que os cards fiquem mais quadrados
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String imageUrl;
  final String name;
  final double price;

  Product({required this.imageUrl, required this.name, required this.price});
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
          // Imagem do produto
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
                // Nome do produto
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3),
                // Preço do produto
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
