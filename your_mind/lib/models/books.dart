class Book {
  String cover, title, author, status, date, clientName;
  static List<Book> books = [
    Book('assets/images/1984.jpg', '1984', 'George Orwell', 'Disponível', '0',
        '0'),
    Book('assets/images/a-revolucao-dos-bichos.jpg', 'A Revolução dos Bichos',
        'George Orwell', 'Disponível', '0', '0'),
    Book('assets/images/jogos-vorazes.jpg', 'Jogos Vorazes', 'Suzanne Collins',
        'Indisponível', '11/05/2021', 'Pedro Henrique'),
    Book('assets/images/em-chamas.jpg', 'Em Chamas', 'Suzanne Collins',
        'Disponível', '0', '0'),
    Book('assets/images/a-esperanca.jpg', 'A Esperança', 'Suzanne Collins',
        'Disponível', '0', '0'),
    Book(
        'assets/images/hp-e-a-pedra-filosofal.jpg',
        'Harry Potter e a Pedra Filosofal',
        'J.K. Rowling',
        'Disponível',
        '0',
        '0'),
    Book(
        'assets/images/hp-e-a-camara-secreta.jpg',
        'Harry Potter e a Câmara Secreta',
        'J.K. Rowling',
        'Indisponível',
        '15/05/2021',
        'Renato Gomes'),
    Book(
        'assets/images/hp-e-o-calice-de-fogo.jpg',
        'Harry Potter e o Cálice de Fogo',
        'J.K. Rowling',
        'Disponível',
        '0',
        '0'),
    Book(
        'assets/images/hp-e-o-prisioneiro-de-azkaban.jpg',
        'Harry Potter e o Prisioneiro de Azkaban',
        'J.K. Rowling',
        'Indisponível',
        '18/05/2021',
        'Guilherme Rodrigues'),
    Book('assets/images/o-magico-de-oz.jpg', 'O Mágico de Oz', 'L. Frank Baum',
        'Indisponível', '17/05/2021', 'Nicole Andrade'),
    Book('assets/images/o-pequeno-principe.jpg', 'O Pequeno Príncipe',
        'Antoine De Saint-exupéry', 'Disponível', '0', '0'),
    Book('assets/images/o-que-o-sol-faz-com-as-flores.jpg',
        'O Que o Sol Faz Com as Flores', 'Rupi Kaur', 'Disponível', '0', '0'),
    Book('assets/images/outros-jeitos-de-usar-a-boca.jpg',
        'Outros Jeitos de Usar a Boca', 'Rupi Kaur', 'Disponível', '0', '0'),
    Book('assets/images/a-menina-que-roubava-livros.jpg',
        'A Menina Que Roubava Livros', 'Markus Zusak', 'Disponível', '0', '0'),
  ];

  // static void addToBooks(Book newBook) {
  //   Book.books.add(newBook);
  // }

  Book(String cover, String title, String author, String status, String date,
      String clientName) {
    this.cover = cover;
    this.title = title;
    this.author = author;
    this.status = status;
    this.date = date;
    this.clientName = clientName;
  }

  // static void createInitialLibrary() {
  //   addToBooks(Book('assets/images/1984.jpg', '1984', 'George Orwell',
  //       'Disponível', '0', '0'));
  //   addToBooks(Book('assets/images/a-revolucao-dos-bichos.jpg',
  //       'A Revolução dos Bichos', 'George Orwell', 'Disponível', '0', '0'));
  //   addToBooks(Book('assets/images/jogos-vorazes.jpg', 'Jogos Vorazes',
  //       'Suzanne Collins', 'Indisponível', '11/05/2021', 'Pedro Henrique'));
  //   addToBooks(Book('assets/images/em-chamas.jpg', 'Em Chamas',
  //       'Suzanne Collins', 'Disponível', '0', '0'));
  //   addToBooks(Book('assets/images/a-esperanca.jpg', 'A Esperança',
  //       'Suzanne Collins', 'Disponível', '0', '0'));
  //   addToBooks(Book(
  //       'assets/images/hp-e-a-pedra-filosofal.jpg',
  //       'Harry Potter e a Pedra Filosofal',
  //       'J.K. Rowling',
  //       'Disponível',
  //       '0',
  //       '0'));
  //   addToBooks(Book(
  //       'assets/images/hp-e-a-camara-secreta.jpg',
  //       'Harry Potter e a Câmara Secreta',
  //       'J.K. Rowling',
  //       'Indisponível',
  //       '15/05/2021',
  //       'Renato Gomes'));
  //   addToBooks(Book(
  //       'assets/images/hp-e-o-calice-de-fogo.jpg',
  //       'Harry Potter e a Câmara Secreta',
  //       'J.K. Rowling',
  //       'Disponível',
  //       '0',
  //       '0'));
  //   addToBooks(Book(
  //       'assets/images/hp-e-o-prisioneiro-de-azkaban.jpg',
  //       'Harry Potter e o Prisioneiro de Azkaban',
  //       'J.K. Rowling',
  //       'Indisponível',
  //       '18/05/2021',
  //       'Guilherme Rodrigues'));
  //   addToBooks(Book('assets/images/o-magico-de-oz.jpg', 'O Mágico de Oz',
  //       'L. Frank Baum', 'Indisponível', '17/05/2021', 'Nicole Andrade'));
  //   addToBooks(Book(
  //       'assets/images/o-pequeno-principe.jpg',
  //       'O Pequeno Príncipe',
  //       'Antoine De Saint-exupéry',
  //       'Disponível',
  //       '0',
  //       '0'));
  //   addToBooks(Book('assets/images/o-que-o-sol-faz-com-as-flores.jpg',
  //       'O Que o Sol Faz Com as Flores', 'Rupi Kaur', 'Disponível', '0', '0'));
  //   addToBooks(Book('assets/images/outros-jeitos-de-usar-a-boca.jpg',
  //       'Outros Jeitos de Usar a Boca', 'Rupi Kaur', 'Disponível', '0', '0'));
  //   addToBooks(Book('assets/images/a-menina-que-roubava-livros.jpg',
  //       'A Menina Que Roubava Livros', 'Markus Zusak', 'Disponível', '0', '0'));
  // }
}
