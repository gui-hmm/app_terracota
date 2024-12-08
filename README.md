# TerraCota App

Este é um aplicativo Flutter para uma loja de produtos artesanais, focado em itens de cerâmica e barro. O aplicativo oferece uma experiência de compras online onde os usuários podem explorar os produtos, adicioná-los ao carrinho, fazer login, gerenciar seu perfil e realizar pagamentos.

## Funcionalidades

- **Tela Inicial (Home Screen):** Exibição de uma lista de produtos em formato grid, com a possibilidade de adicionar itens ao carrinho e selecionar a quantidade desejada.
- **Carrinho de Compras:** O usuário pode adicionar produtos ao carrinho e visualizar o resumo do que foi adicionado antes de finalizar a compra.
- **Drawer (Menu Lateral):** Contém as opções de navegação para as telas de perfil, pagamentos, notificações, segurança, ajuda e suporte, e logout.
- **Cadastro e Login:** Sistema de autenticação onde o usuário pode criar uma conta e fazer login para acessar funcionalidades como edição de perfil e visualização de histórico de compras.
- **Tela de Perfil:** Exibição e edição de dados do usuário, com as informações sendo armazenadas no backend do **Back4App**.
- **Sistema de Busca de Produtos:** Funcionalidade que permite ao usuário buscar rapidamente por produtos na loja. *(Em desenvolvimento)*

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento de aplicativos móveis.
- **Dart**: Linguagem de programação utilizada no Flutter.
- **Back4App**: Plataforma para backend como serviço (BaaS), usada para armazenar dados como informações de usuários e produtos.
- **Provider**: Gerenciamento de estado para o carrinho de compras.

## Como Rodar o Projeto Localmente

1. **Clonar o repositório:**
   ```bash
   git clone https://github.com/gui-hmm/app_terracota.git


Instalar as dependências: Navegue até o diretório do projeto e instale as dependências necessárias:

bash
Copy code
cd terra-cota-app
flutter pub get
Rodar o aplicativo: Conecte um dispositivo ou inicie um emulador e execute:

bash
Copy code
flutter run
Como Contribuir
Se você deseja contribuir para este projeto, siga as etapas abaixo:

Faça um fork deste repositório.
Crie uma nova branch para a sua funcionalidade:
bash
Copy code
git checkout -b nova-funcionalidade
Faça suas alterações.
Realize o commit com uma mensagem clara e objetiva:
bash
Copy code
git commit -m "Adiciona nova funcionalidade"
Envie suas alterações para o repositório remoto:
bash
Copy code
git push origin nova-funcionalidade
Abra um pull request detalhando suas alterações.
Equipe de Desenvolvimento
Este projeto foi desenvolvido por uma equipe colaborativa:

Andressa Mota (Desenvolvedora Flutter)
Guilherme Henrique (Desenvolvedor Flutter e Gerente de Projeto)
Lucas Bernardino (Desenvolvedor Backend)
Ketyllen Emylle (Designer e Desenvolvedora)
Welliana Carvalho (Desenvolvedora Flutter)
