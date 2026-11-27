import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/shared/widget/widget.dart';

class PokemonNews {
  final String title;
  final String category;
  final String date;
  final String summary;
  final String content; 
  final String image;

  PokemonNews({
    required this.title, 
    required this.category, 
    required this.date, 
    required this.summary, 
    required this.content, 
    required this.image
  });
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({
    super.key
  });

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  String _selectedCategory = 'Todas';

  static const _categories = <String> [
    'Todas',
    'Juegos',
    'Eventos',
    'Anime',
    'Competitivo'
  ];


  static final _news = <PokemonNews>[
    PokemonNews(
      title: 'Comienza una nueva temporada competitiva', 
      category: 'Competitivo', 
      date: '23 Nov 2026', 
      summary: 'Los entrenadores podran demostrar sus equipos en batallas mas desafiantes.', 
      content: 'La nueva temporada competitiva incluye equipos renovados, recompensas por '
      'victoia y cambio en la clasificacion revisa tu equipo y crea estrategias antes de que termine a temporada.', 
      image: 'assets/images/cynthia.gif' 
    ),

    PokemonNews(
      title: 'Pokemon MMO Blanco 2 / Negro 2', 
      category: 'Juegos', 
      date: '19 Ago 2026', 
      summary: 'Nueva Region desbloqueada para entrenadores veteranos', 
      content: 'Entrenadores bienvenidos a la nueva ubicacion e historia de la region '
      'Unova donde podra revivir la historia de Pokemon white and black 2.', 
      image: 'assets/images/pokemon_W_&_B.png'
    ),

    PokemonNews(
      title: 'Descubre a los ganadores del Campeonato Internacional Pokémon de Latinoamérica 2027 (LAIC)', 
      category: 'Eventos', 
      date: '22 Nov 2026', 
      summary: 'Los Campeonatos Internacionales de Latinoamérica 2027', 
      content: 'El Campeonato Internacional Pokémon de Latinoamérica se celebró durante '
      'tres días repletos de encuentros emocionantes en São Paulo (Brasil) del 20 al 22 de '
      '¿noviembre de 2026. Al tratarse del primer Campeonato Internacional de la temporada, '
      'el evento contó con grandes competidores del Campeonato de Videojuegos Pokémon, del Juego '
      'de Cartas Coleccionables Pokémon (JCC Pokémon) y de Pokémon GO. Además, pudimos presenciar '
      'el debut de nuevas cartas de la expansión Megaevolución-Dominio Delta y de los Pokémon megaevolucionados en Pokémon GO.', 
      image: 'assets/images/torneo_latam.png'
    ),

    PokemonNews(
      title: 'Las ilustraciones de la expansión Megaevolución-Dominio Delta de JCC Pokémon', 
      category: 'Juegos', 
      date: '20 Nov 2026', 
      summary: 'Expansión Megaevolución-Dominio Delta de JCC Pokémon', 
      content: 'La expansión Megaevolución-Dominio Delta de JCC Pokémon promete intensos combates con los poderosos Pokémon ex '
      'Megaevolución, pero, si lo que te interesa de verdad es contemplar la naturaleza o maravillarte con la destreza artística, '
      'las ilustraciones de esta expansión tienen mucho que decir. Todo el mundo encontrará algo en estas cartas, desde artistas que '
      'debutan en JCC Pokémon hasta otros nombres conocidos que nos brindan momentos de alegría, serenidad y ferocidad. Descubre algunas '
      'de las cartas más destacadas que podrás encontrar en la expansión Megaevolución-Dominio Delta de JCC Pokémon.', 
      image: 'assets/images/card_poke.jpg'
    ),

    PokemonNews(
      title: 'Cómo ver el Campeonato Internacional Pokémon de Latinoamérica 2027.', 
      category: 'Eventos', 
      date: '19 Nov 2026', 
      summary: 'Te contamos dónde puedes conectarte al LAIC para ver los combates.', 
      content: 'El Campeonato Internacional de Latinoamérica 2027 (LAIC, por sus siglas en inglés) comienza el 20 de noviembre de '
      '2026, en vivo desde São Paulo (Brasil), marcando el inicio de un fin de semana repleto de combates y acción con los videojuegos '
      'Pokémon, el Juego de Cartas Coleccionables Pokémon (JCC Pokémon) y Pokémon GO. Únete a la fiesta conectándote a nuestra página de '
      'transmisiones del LAIC o al canal de Play! Pokémon en Twitch o YouTube durante el evento. La transmisión en vivo comenzará a las 4:00 '
      'a. m. PST cada día y se transmitirá casi inmediatamente después en Twitch para los miembros de nuestra comunidad global.', 
      image: 'assets/images/torneo_international.jpg'
    ),

    PokemonNews(
      title: 'Mabosstiff sufre las travesuras de Whimsicott en el nuevo corto de POKÉTOON', 
      category: 'Anime', 
      date: '19 Nov 2026', 
      summary: '¡Shhh! ¡Que la bebé está durmiendo!', 
      content: '¡Ya está disponible en YouTube un nuevo corto de POKÉTOON! A pesar de su apariencia gruñona, Mabosstiff tiene '
      'un gran corazón y adora a su familia, así que su Entrenadora le confía el cuidado de su bebé mientras ella está ocupada. '
      'Pero esta vez la tarea no será fácil. La brisa deja entrar por la ventana a un Whimsicott dispuesto a provocar un alboroto. '
      'Tampoco ayuda que Whimsicott vaya dejando a su paso esponjosas bolitas de algodón que hacen estornudar al pobre Mabosstiff.', 
      image: 'assets/images/poketoon.jpg'
    )

  ];

  //   PokemonNews(
      // title: '', 
      // category: '', 
      // date: '', 
      // summary: '', 
      // content: '', 
      // image: ''
  //   )

  void _openNews(PokemonNews news) {
    showModalBottomSheet<void>(
      context: context, 
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: ((context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.78,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),

              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.only(bottom: 24),
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadiusGeometry.vertical(top: Radius.circular(24)),
                    child: Image.asset(
                      news.image,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Chip(
                              label: Text(news.category),
                              backgroundColor: Colors.red.withValues(alpha:  0.15),
                            ),

                            const Spacer(),

                            Text(
                              news.date,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Text(
                          news.title,
                          style: Theme.of(context).textTheme.headlineSmall ?.copyWith(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          news.content,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),                     
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    //filtro para las noticias
    final fillteredNews = _selectedCategory == 'Todas'
          ? _news
          : _news
              .where((news) => news.category == _selectedCategory)
              .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.red,
      ),
      drawer: DrawerScreen(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () => context.go('/home')
      ),
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/may_cascada.gif',
              fit: BoxFit.cover,
            ),
          ),

          //categorias de noticias
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 64,
                  child: ListView.separated(
                    padding:  const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 8), 
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      final isSelected = category == _selectedCategory;

                      return ChoiceChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (_){
                          setState(() => _selectedCategory = category);
                        },
                      );
                    }, 
                  ),
                ),

                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                    itemCount: fillteredNews.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12), 
                    itemBuilder: ((context, index) {
                      final news = fillteredNews[index];

                      //Pantallas de cada Card con una imagen y su categoria
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 4,
                        child: InkWell(
                          onTap: () => _openNews(news),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                news.image,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (_, _, _) => const SizedBox(
                                  height: 150,
                                  child: ColoredBox(
                                    color: Colors.red,
                                    child: Icon(
                                      Icons.newspaper,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                              //cuadro de la parte inferior
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        //
                                        Text(
                                          news.category.toUpperCase(),
                                          style: TextStyle(
                                            color: Theme.of(context).colorScheme.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ), 
                                        ),

                                        const Spacer(),

                                        //fecha
                                        Text(
                                          news.date.toUpperCase(),
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 8),

                                    //titulo
                                    Text(
                                      news.title.toUpperCase(),
                                      style: Theme.of(context).textTheme.titleLarge ?.copyWith(
                                                                                        fontWeight: FontWeight.bold
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    //Descripcion
                                    Text(
                                      news.summary,
                                      style: Theme.of(context).textTheme.bodyMedium
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }), 
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}