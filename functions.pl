% Função para normalizar as entradas e saídas pro formato do dataset
% (sem espaços desnecessários nem letras maiúsculas).
normalizar(Entrada, Saida) :-
    string_lower(Entrada, Baixa),
    normalize_space(string(Saida), Baixa).

% Comparar os atributos de duas músicas, fazendo uma mini-clusterização
% ao pegar a distância dos dois.
similaridade(Id1, Id2, Dif) :-
    song(Id1, _, _, _, _, Dance1, Energy1, Loud1, _, Speech1, _, Val1, _, _),
    song(Id2, _, _, _, _, Dance2, Energy2, Loud2, _, Speech2, _, Val2, _, _),
    Dif is abs(Dance1 - Dance2) + abs(Energy1 - Energy2) + abs(Loud1 - Loud2) + abs(Speech1 - Speech2) + abs(Val1 - Val2).

% Funções para retirar os elementos de uma lista e colocá-los em outra
% sublista.
take(0, _, []) :- !.
take(_, [], []) :- !.
take(N, [H|T], [H|Rest]) :-
    N1 is N - 1,
    take(N1, T, Rest).

% Função principal de recomendação
recomendar(Musica, Artista, Recomendacoes, ArtistasRecomendacoes) :-
    song(Id, Artista, _, Musica, _, _, _, _, Mode, _, _, _, _, Genero),
    
    % Compara a música recbida como parâmetro com todas do dataset de maneira bruteforce
    % e roda uma função similaridades para ver a distância de cada elemento no conjunto universo.
    findall(Dif-M-Artista2,
        (   song(Id2, Artista2, _, M, _, _, _, _, Mode, _, _, _, _, Genero),
            Id \= Id2,
            Artista \= Artista2,
            similaridade(Id, Id2, Dif)
        ), 
        Similaridades),

    % Os resultados são armazenados num vetor que é ordenado para que seja possível reitrar
    % apenas as 5 principais. Depois, armazena-as em dois vetores para serem printadas.
    (   Similaridades \= []
    ->  sort(Similaridades, SimilaridadesOrdenadas),
        length(SimilaridadesOrdenadas, Len),
        (   Len >= 5
        ->  take(5, SimilaridadesOrdenadas, Top5)
        ;   Top5 = SimilaridadesOrdenadas 
        ),
        findall(M, member(_-M-_, Top5), Recomendacoes),
        findall(A, member(_-_-A, Top5), ArtistasRecomendacoes)
    ;   Recomendacoes = [],
        ArtistasRecomendacoes = []
    ).

% Comando principal, pede uma musica e artista do usuário e lança como parâmetro
% para a função de recomendação. Depois, printa os resultados.
recomendar_musica :-
    ansi_term:ansi_format([fg(cyan)],'Digite o nome da música: ', []), nl,
    read_line_to_string(user_input, MusicaInput),
    normalizar(MusicaInput, MusicaNormalizada),
    ansi_term:ansi_format([fg(cyan)],'Digite o nome do artista: ', []), nl,
    read_line_to_string(user_input, ArtistaInput),
    normalizar(ArtistaInput, ArtistaNormalizada),
    
    (   song(_, ArtistaTemplate, _, MusicaTemplate, _, _, _, _, _, _, _, _, _, _),
        normalizar(MusicaTemplate, MusicaTemplateNormalizada),
        normalizar(ArtistaTemplate, ArtistaTemplateNormalizada),
        MusicaTemplateNormalizada = MusicaNormalizada, 
        ArtistaTemplateNormalizada = ArtistaNormalizada
    ->  recomendar(MusicaTemplate, ArtistaTemplate, Recomendacoes, ArtistasRecomendacoes),
        (   Recomendacoes \= []
        ->  ansi_term:ansi_format([fg(cyan)],'Aqui estão algumas músicas recomendadas baseadas em (', []),
            ansi_term:ansi_format([fg(cyan)],MusicaTemplate, []), ansi_term:ansi_format([fg(cyan)],' - ', []), ansi_term:ansi_format([fg(cyan)],ArtistaTemplate, []), ansi_term:ansi_format([fg(cyan)],'):', []), nl,
            print_recomendacoes(Recomendacoes, ArtistasRecomendacoes)
        ;   ansi_term:ansi_format([fg(cyan)],'Nenhuma recomendação encontrada.', []), nl
        )
    ;   ansi_term:ansi_format([fg(cyan)],'Música ou artista não encontrados.', []), nl
    ).

print_recomendacoes([], []) :- 
    true. % Caso não haja músicas, não faz nada.
print_recomendacoes([Musica|RestMusicas], [Artista|RestArtistas]) :- 
    write('• '), write(Musica), write(' - '), write(Artista), nl,
    print_recomendacoes(RestMusicas, RestArtistas).