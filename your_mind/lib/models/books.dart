class Book {
  String cover, title, author, status, date;

  Book({
    this.cover,
    this.title,
    this.author,
    this.status,
    this.date,
  });
}

List<Book> books = [
  Book(
      title: '1984',
      author: 'George Orwell',
      status: 'Disponível',
      date: '0',
      cover: 'assets/images/1984.jpg'),
  Book(
      title: 'A Revolução dos Bichos',
      author: 'George Orwell',
      status: 'Disponível',
      date: '0',
      cover: 'assets/images/a-revolucao-dos-bichos.jpg'),
  Book(
      title: 'Jogos Vorazes',
      author: 'Suzanne Collins',
      status: 'Indisponível',
      date: '11/05/2021',
      cover: 'assets/images/jogos-vorazes.jpg'),
  Book(
      title: 'Em Chamas',
      author: 'Suzanne Collins',
      status: 'Disponível',
      date: '0',
      cover: 'assets/images/em-chamas.jpg'),
  Book(
      title: 'A Esperança',
      author: 'Suzanne Collins',
      status: 'Disponível',
      date: '0',
      cover: 'assets/images/a-esperanca.jpg'),
  Book(
      title: 'Harry Potter e a Pedra Filosofal',
      author: 'J.K. Rowling',
      status: 'Disponível',
      date: '0',
      cover: 'assets/images/hp-e-a-pedra-filosofal.jpg'),
  Book(
      title: 'Harry Potter e a Câmara Secreta',
      author: 'J.K. Rowling',
      status: 'Indisponível',
      date: '08/05/2021',
      cover: 'assets/images/hp-e-a-camara-secreta.jpg'),
  Book(
      title: 'Harry Potter e o Cálice de Fogo',
      author: 'J.K. Rowling',
      status: 'Disponível',
      date: '0',
      cover: 'assets/images/hp-e-o-calice-de-fogo.jpg'),
  Book(
      title: 'Harry Potter e o Prisioneiro de Azkaban',
      author: 'J.K. Rowling',
      status: 'Disponível',
      date: '0',
      cover: 'assets/images/hp-e-o-prisioneiro-de-azkaban.jpg'),
  Book(
      title: 'O Mágico de Oz',
      author: 'L. Frank Baum',
      status: 'Disponível',
      date: '0',
      cover: 'assets/images/o-magico-de-oz.jpg'),
  Book(
      title: 'O Pequeno Príncipe',
      author: 'Antoine De Saint-exupéry',
      status: 'Disponível',
      date: '0',
      cover: 'assets/images/o-pequeno-principe.jpg'),
  Book(
      title: 'O Que o Sol Faz Com as Flores',
      author: 'Rupi Kaur',
      status: 'Disponível',
      date: '0',
      cover: 'assets/images/o-que-o-sol-faz-com-as-flores.jpg'),
  Book(
      title: 'Outros Jeitos de Usar a Boca',
      author: 'Rupi Kaur',
      status: 'Disponível',
      date: '0',
      cover: 'assets/images/outros-jeitos-de-usar-a-boca.jpg'),
  Book(
      title: 'A Menina Que Roubava Livros',
      author: 'Markus Zusak',
      status: 'Disponível',
      date: '0',
      cover: 'assets/images/a-menina-que-roubava-livros.jpg'),
];
