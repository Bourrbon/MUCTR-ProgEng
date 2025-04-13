% Предикат для проверки соседства слева
left(X, Y, [X, Y|_]).
left(X, Y, [_|T]) :- left(X, Y, T).
left(X, Y, [Y|T]) :- T = [_, _, X].

% Предикат для проверки посадки на противоположной стороне стола
opposite(X, Y, [X, _, Y|_]).
opposite(X, Y, [_, X, _, Y]).
opposite(X, Y, L) :- left(X, Y, L).


solve(Places) :-
    
    Places = [P1, P2, P3, P4],
    
    Names = [wolf, nif, naf, nuf],
    Hobbies = [fauna, flora, cosmos, sport],
    
    % Внесены изменения в эти строки
    P4 = person(Name4, Hobby4),
    P1 = person(Name1, Hobby1),
    P2 = person(Name2, Hobby2),
    P3 = person(Name3, Hobby3),
    
    
    permutation(Names, [Name1, Name2, Name3, Name4]),
    
    permutation(Hobbies, [Hobby1, Hobby2, Hobby3, Hobby4]),
    % Условие 1: Волк увлекается Фауной
    member(person(wolf, fauna), Places),
    % Условие 2: Волк сидит слева от Наф-Нафа
    left(person(wolf, _), person(naf, _), Places),
    % Условие 3: Ниф-Ниф сидит справа от того, кто увлекается Космосом
    left(person(_, cosmos), person(nif, _), Places),
    % Условие 4: Нуф-Нуф сидит напротив Наф-Нафа
    opposite(person(nuf, _), person(naf, _), Places),
    

% Вывести решение
print_solution :-
    solve(Places),
    Places = [P1, P2, P3, P4],
    write('Position 1: '), write(P1), nl,
    write('Position 2: '), write(P2), nl,
    write('Position 3: '), write(P3), nl,
    write('Position 4: '), write(P4), nl.