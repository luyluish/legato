limpar_buffer :-
    skip(10). % '10' representa o caractere de nova linha (ASCII para Enter).

% Consultar os arquivos functions.pl e songs.pl, acho que é assim.
:- consult('functions.pl').
:- consult('songs.pl').

mostrar_arte :- 
    write('       _________________________________________________________________________\\'), nl,
    write('       |:____|\\_________b___/______.____.__|__________._______.---.__.__________:|'), nl,
    write('       |:____|/__4____|.____$___| |   ___  ___  ___ _| |_ ___ ___|____|__|______:|'), nl,
    write('       |:___/|___4____\'`____/___| |_ / ._>/ . |<_> | | | / . \\___|____|__|______:|'), nl,
    write('       |:__(\'|)___________$_____|___|\\___.\\_. |<___| |_| \\___/__@|___(|__|__#( ):|'), nl,
    write('       |:__ \\|____________________________<___\'_________________________________:|'), nl,
    write('       ______)__________________________________________________________________/'), nl.

menu :- 
    mostrar_arte,
    nl,
    write('Bem-vindo ao sistema de recomendação de músicas Legato!'), nl,
    write('Escolha uma opção:'), nl,
    write('1. Recomendar músicas'), nl,
    write('2. Sair'), nl,
    read_line_to_string(user_input, Opcao),
    executar_opcao(Opcao),
    halt.

executar_opcao("1") :- 
    nl, write('Por favor, insira o nome da música e o artista para obter recomendações.'), nl,
    write('Exemplo: Se você quiser recomendações para a música "Imagine" de "John Lennon", digite exatamente isso.'), nl,
    recomendar_musica,
    menu.
executar_opcao("2") :- 
    write('Saindo do sistema. Até mais!'), nl,
    halt.
executar_opcao(_) :- 
    write('Opção inválida. Tente novamente.'), nl,
    menu.

:- menu.