final String fichaBasica = '''Vida: 20 (padrão)
Energia: 6 (padrão)
Atributos: Força, Destreza, Agilidade, vitalidade. (Padrão: 0)
(Desbloqueada com habilidade) Magia: 0

Vida é a saúde do personagem durante o jogo, ferimentos enfraquecem seu personagem e podem atrair doenças ou infeccionar, uma saúde fraca atrai a morte rapidamente. Evite se machucar e trate rápido de seus ferimentos. Energia é o combustível de suas ações, ataques consomem energia de acordo com o golpe feito, ficar sem energia em uma luta é como ser a isca no anzol. 

Os atributos básicos influenciam no ataque de cada tipo de arma, para armas de porte médio ou pesado, pontos de força aumentam o dano de ataque, cada ponto em força é convertido em +1 ponto de ataque. Para armas leves, agilidade adiciona +1 ponto de ataque. Para armas de longa distância, destreza adiciona +1 ponto de ataque. 

Cada atributo possui um bônus a cada 5 pontos preenchidos.

Força:  +2 pontos extras de força
Destreza: +1 chance de acerto critico (D20) / (Padrão: 0)
Agilidade: +1 chance de esquiva (D20) / (Padrão: 0)
Vitalidade: +5 pontos de vida e + 2 pontos de energia
Magia: +5 Mana

(Máximo de 25 pontos em um atributo) 
Os bônus de cada atributo podem ser aproveitados independente da arma usada''';

final String combate = '''Ações de combate

Atacar: Ataque normal consome 2 pontos de energia/ habilidade (cada habilidade tem seu custo) / Esquivar e defender consome 1 ponto de energia/ fugir consome 1 ponto (só é possível fugir quando seu inimigo não estiver lhe focando).

Ataque normal: Ataque comum que usa o dano da arma + seu atributo básico, na ausência de uma arma, punhos causam danos igual a sua força.

Habilidades: Cada habilidade tem seu efeito e custo, elas podem virar o jogo em uma luta.

Esquiva: Só é possível esquivar usando os bônus de agilidade, caso a esquiva seja bem-sucedida, seu próximo ataque tem 2x mais chances de acertar o alvo.

Defesa: Usa a arma ou escudo para repelir o ataque, utiliza-se um D10, armas leves defendem no caso de 1 – 3, armas medias ou pesadas 1 – 4, escudos 1 – 6. No caso de flechas: armas leve 1 – 1 / medias ou pesadas 1 – 2 / Escudos 1 – 5.

Não é possível usar escudos com armas pesadas.

Magia: Ataques mágicos ignoram a defesa e as chances de esquiva são reduzidas em metade, no caso de números decimais, o menor valor se sobressai. Ex: metade de 3 > 1,5 = 1.
''';

final String xp =
    '''Existem duas categorias de experiência: Combate e exploração.

Combate

Experiências de combate servem para evoluírem habilidades e atributos, o ganho vem de cada vitória em uma luta ou treino. 

Combate mano a mano: 1 ponto por vitória

Combate em dupla/trio/quarteto:  1 ponto se sua equipe for maior / 2 pontos quando o grupo é igual / 5 pontos se sua equipe for menor.

Combates em grupo: 3 pontos quando seu grupo é maior / 5 pontos quando o grupo é igual / 10 pontos quando o grupo é menor.

Só é considerado grupo quando há 5 ou mais membros.

Guerras: 20 pontos por sobreviver / 50 pontos por vencer.

Grande Guerra: 30 pontos por sobreviver / 100 pontos por vencer.

É considerado uma guerra quando um Earl luta contra outro Earl ou um rei.

É considerado grande guerra quando um rei luta contra outro rei.

Treino: 10 pontos.

Treino dedicado: 30 pontos.

Missões: 10 pontos (Missões são dadas por organizações, reinos, mestres, etc.).

Só é possível treinar com um instrutor/treinador ou mestre. Treino dedicado só é aplicado por um mestre.

Exploração

Experiência de exploração servem para aumentarem habilidades de sobrevivência, governamentais, diplomática, entre outras. O Ganho vem da conquista, descoberta, exploração, acordo ou títulos adquiridos.

Conquista: Conquistar um território resulta em 50 pontos / Conquistar um lugar dentro de um território resulta em 20 pontos.

Descoberta: Descobrir relíquias, raças, povos, riquezas, etc. Ganho de 20 pontos.

Exploração: Cada território novo explorado vale 10 pontos / Explorar 100% do mapa, 100 pontos.

Acordo: Acordos feitos com outros povos ou reinos, sejam comerciais ou diplomáticos, esses resultam em 20 pontos.

Título: Ganhar um título resulta em 10 pontos. Títulos são ganhos pela conquista e reputação.

Estudos: Estudar com um Instrutor/Professor ou Mestre resulta em 10 pontos.

A cada 10 pontos obtidos é ganho 1 ponto para distribuir em atributo de combate ou conhecimento de exploração com base no tipo de experiência ganha.
''';

final String npcs =
    '''Viajantes: Encontrados durante o trajeto, trazem informações ao jogador.

Mercadores: Encontrados em cidades ou em trajetos, carregam mercadorias que podem ajudar o jogador quando ele estiver viajando.

Nativos: Grupo um tanto hostil caso invada suas terras.

Bandidos: Uma presença indesejável que rouba, machuca ou elimina o jogador.

Soldados: Força militar de um local, fornecem proteção a um território.

Aldeões: Povo de um determinado lugar, podem ajudar de diversas maneiras.

Adoradores: Sábios estudiosos, podem ensinar e oferecer conhecimentos.

Curandeiro: Cuida de ferimentos e doenças de um determinado lugar.

Earl/Jarl: Donos de um pedaço de terra concedido pelo Rei, podem oferecer trabalhos.

Ferreiro: Cria armas e equipamentos, além de repara-las.

Taberneiro: Donos de tabernas, podem oferecer comida, bebidas, abrigo e informações.

Rei: Principal figura de um território, lidera e gerencia seu território para sobrevivência do povo.

Mercenários: Experientes em batalhas, podem prestar seus serviços por ouro.

Aventureiros: Podem se aliar em prol de um objetivo em comum, ótimos para formar um grupo para aventuras.

Escaldos: Contam estórias e feitos, responsáveis por criarem ou expandirem reputações por onde passam.

Instrutores/professores: Responsáveis pelos treinamentos e ensinamentos de habilidades de classe.

Mestres: Possuem uma ou mais habilidades especiais, podem ter discípulos para passarem seus conhecimentos.
''';

final String monstros =
    '''Animais são bons fornecedores de alimento, quase não apresentam perigo.

Feras são perigosas, podem fornecer alimento, mas seu real valor está nas peles.

Monstros são extremamente perigosos, pouco se sabe sobre eles, suas recompensas podem ser tão grandes quanto a ameaça que representam.

Nível de ameaça 

Nv 1: Inofensivos, raramente atacam.
Nv 2: Podem machucar ou matar em alguns casos, pode eliminar uma pessoa.
Nv 3: Muito perigosos, conseguem eliminar uma ou mais pessoas.
Nv 4: Extremamente agressivos e perigosos, podem destruir um grupo facilmente.
Nv 5: Podem destruir um exército, seu poder é surreal.

Localização

Hostil 
Floresta
Tribal
Pântano
Montanhas
Deserto
Mar''';

final String exploracao =
    '''Movimentação – Cada personagem possui seu status de exploração, em cada ficha o jogador encontra a sua barra de movimentação necessária para se deslocar no mapa. Cada movimento de uma área para outra consome 4 pontos de movimentação, sendo a cavalo apenas 1 ponto.

Cavalos – Movimentar-se com cavalo é 4x mais prático, é possível comprar, domar ou roubar um cavalo, contudo também necessita de alimento.

Repouso – É necessário descansar para recuperar pontos de movimentação, uma noite é suficiente para se recuperar por completo, embora dormir o deixa muito vulnerável.

Eventos – Ao se deslocar pelo mapa em terreno aberto, existe uma possibilidade de ocorrer algum evento aleatório decidido por um D20, a cada movimento do jogador joga-se um D10, 1 – 4 um evento ocorre, caso nenhum evento ocorra e o jogador continue a viajar as chances de um evento aparecer aumentam em +2, isso é acumulativo até que o jogador saia do terreno aberto ou pare para descansar.
''';

final String eventoViagem =
    '''Terra comum. D50: 1 – 15 > Viajante /16 – 25 Mercadores /26 – 35 Bandidos /36 – 44 feras /45 – 50 Monstros

Alguns lugares possuem seus próprios eventos

Terras de tribos não possuem mercadores nem bandidos, os eventos são 1 – 10 nativos, 11 – 18 feras /19 – 20 Monstros

Terras hostis não possuem viajantes, mercadores ou bandidos, as chances são 1 - 10 eventos climático, 11 – 20 feras

Eventos climáticos: D4 

1: Começa a nevar
2: Começa a nevar
3: Chuva de granizo
4: Tempestade

Se estiver no inverno

1: Começa a nevar
2: Tempestade
3: Chuva de granizo
4: Nevasca''';

final String eventoGeral = '''
No início do turno do jogo, o primeiro jogador joga um D8 para definir o clima do mapa por um dia, depois que todos os jogadores encerrarem seus turnos uma nova partida começa e assim o dado é jogado novamente

Eventos do D8

1: Clima normal
2: Clima normal
3: Clima normal
4: Clima normal
5: Nevando
6: Nevando
7: Nevando
8: Tempestade

Inverno

Quando todos encerrarem seus turnos, joga-se um dado para subtrair um valor, quando este valor for igual ou menor que 0, o inverno chega. Para que o inverno acabe, é preciso jogar o mesmo dado e deixa-lo novamente no seu número padrão ou maior

Dado: D4
Valor: 25

Sobre o Inverno

No inverno os alimentos dobram de preço
Não há frutinhas para coletar
Caçar e pescar é mais difícil
Mais chances de morrer de frio
Produção diminui em 50% (Governação)
Consumo de lenha e alimento aumentam em 50% (Governação)
Navegar é quase impossível 
Mover consome 5 barras de energia, a cavalo 2''';

final String eventoEspecial = '''Eventos especiais ocorrem em lugares Hostis 

Categoria de eventos

C – Ameaça de menor grau
Ameaça que pode ser contida com um grupo

B – Ameaça territorial
Ameaça que pode ser contida com um exercito

A – Ameaça continental
Ameaça que pode ser contida com um grande exercito

S – Ameaça desconhecida
Não se sabe ao certo

Classificação de cada lugar 
1 Groenland: Comum
2 Jarnugar: Comum
3 Lotland: Comum
4 Börn: Comum
5 Helgard: Comum
6 Kalvarg: Comum
7 Ungrar: Comum
8 Ostrid: Comum
9 Danheim: Comum
10 Clofningar: Comum
11 Dunahir: Comum
12 Dornundur: Comum
13 Asgar: Tribo
14 Iskis: Tribo
15 Godum: Tribo
16 Nordnar: Tribo
17 Urvrenheim: Tribo
18 Endland: Hostil - A
19 Endless: Hostil - B
20 Val’heim: Hostil - B
21Tordenbyge: Hostil - S
22 Iskrig: Hostil - S
23 Otrum: Hostil - C
24 Clofha: Hostil - C
25 Balnur: Hostil - B
26 Montanha da fortuna: Hostil - C
27 Cordilheira Krafgar: Hostil - B
28 Gagarot: Hostil - B
29 Montanha sussurrante: Hostil - B
30 Boca do inferno: Hostil - A
31 Arquipélago das geleiras: Hostil - S''';

final String fome =
    '''Fome - É necessário comer ao menos uma vez no dia, ficar um dia sem comer deixa seu personagem “faminto”, 3 dias sem comer resulta em “Desnutrição”, 1 semana resulta em morte

Faminto é um estado onde o personagem tem seus atributos reduzidos em metade, inclusive sua energia (Exceto vida)

Desnutrição é um estado onde seus atributos são reduzidos 3x, incluindo sua vida''';

final String clima =
    '''O clima é um desafio para a sobrevivência, é preciso estar protegido para sobreviver a baixas temperaturas, ou pode acabar morrendo congelado. Todo jogador possui a barra de Resistencia climática, algumas vestimentas possuem um bônus de agasalho, esses pontos são somados para decidir sua resistência atual, para que não seja afetado pelo frio, é preciso ter pontos superiores ao tipo de clima que se encontra, cada clima requer pontos específicos de resistência climática, caso os pontos sejam inferiores, os efeitos do frio começam a surgir.

R. Climática do jogador: 0 (padrão)

Frio de cada clima

Normal: 1
Nevando: 3
Chuva de ganizo: 5
Tempestade: 8
Nevasca: 15

Danos por frio

Danos só ocorrem caso a resistência seja menor do que o clima atual. Ao se movimentar, os pontos de clima subtraem com os de resistência do jogador, os pontos que restarem vão se transformando em números negativos, cada efeito possui uma quantidade mínima de números negativos a serem atingidos para serem ativados

-1°: movimentar-se gasta +1 de movimentação

-5°: dano de ataque reduzido em 50%

-8°: Não é possível se movimentar

-10°: Morte por congelamento''';

final String itens =
    '''Itens podem ser obtidos através da coleta, combate e compra. Cada item possui uma ou mais categorias. 
Itens de coleta: São itens coletados por meios que não necessitam de uma compra ou combate
Itens de compra: Itens vendidos por mercadores, a moeda é o meio de compra
Itens de combate: Obtidos através do perigo, são itens específicos ou espólios de um inimigo''';
