class Book {
  String cover, title, author, status, clientName;
  DateTime date;
  static List<Book> books = [
    Book('assets/images/1984.jpg', '1984', 'George Orwell', 'Disponível', null,
        '0'),
    Book('assets/images/a-revolucao-dos-bichos.jpg', 'A Revolução dos Bichos',
        'George Orwell', 'Disponível', null, '0'),
    Book('assets/images/jogos-vorazes.jpg', 'Jogos Vorazes', 'Suzanne Collins',
        'Indisponível', DateTime.parse('2021-05-15'), 'Pedro Henrique'),
    Book('assets/images/em-chamas.jpg', 'Em Chamas', 'Suzanne Collins',
        'Disponível', null, '0'),
    Book('assets/images/a-esperanca.jpg', 'A Esperança', 'Suzanne Collins',
        'Disponível', null, '0'),
    Book(
        'assets/images/hp-e-a-pedra-filosofal.jpg',
        'Harry Potter e a Pedra Filosofal',
        'J.K. Rowling',
        'Disponível',
        null,
        '0'),
    Book(
        'assets/images/hp-e-a-camara-secreta.jpg',
        'Harry Potter e a Câmara Secreta',
        'J.K. Rowling',
        'Indisponível',
        DateTime.parse('2021-05-15'),
        'Renato Gomes'),
    Book(
        'assets/images/hp-e-o-calice-de-fogo.jpg',
        'Harry Potter e o Cálice de Fogo',
        'J.K. Rowling',
        'Disponível',
        null,
        '0'),
    Book(
        'assets/images/hp-e-o-prisioneiro-de-azkaban.jpg',
        'Harry Potter e o Prisioneiro de Azkaban',
        'J.K. Rowling',
        'Indisponível',
        DateTime.parse('2021-05-18'),
        'Guilherme Rodrigues'),
    Book('assets/images/o-magico-de-oz.jpg', 'O Mágico de Oz', 'L. Frank Baum',
        'Indisponível', DateTime.parse('2021-05-17'), 'Nicole Andrade'),
    Book('assets/images/o-pequeno-principe.jpg', 'O Pequeno Príncipe',
        'Antoine De Saint-exupéry', 'Disponível', null, '0'),
    Book('assets/images/o-que-o-sol-faz-com-as-flores.jpg',
        'O Que o Sol Faz Com as Flores', 'Rupi Kaur', 'Disponível', null, '0'),
    Book('assets/images/outros-jeitos-de-usar-a-boca.jpg',
        'Outros Jeitos de Usar a Boca', 'Rupi Kaur', 'Disponível', null, '0'),
    Book('assets/images/a-menina-que-roubava-livros.jpg',
        'A Menina Que Roubava Livros', 'Markus Zusak', 'Disponível', null, '0'),
  ];

  Book(String cover, String title, String author, String status, DateTime date,
      String clientName) {
    this.cover = cover;
    this.title = title;
    this.author = author;
    this.status = status;
    this.date = date;
    this.clientName = clientName;
  }
}
