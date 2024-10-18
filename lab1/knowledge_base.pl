/*
ОПИСАНИЕ ЛАБОРАТОРНОЙ РАБОТЫ №1

Требования: 
    - Создание >20 фактов с 1 аргументом
    - Создание 10-15 фактов с 2 аргументами, которые показывают связь
    - Написание 5-7 правил

Описание реализаци: 
    - Существует вселенная с 2 класссами персонажей: 
    Выжившие (survivors) и Убийцы (killers)
    Для спасения выжившие могут использовать предметы (items)
    Есть 3 генератора (generators), которые могут быть починены Выжившими.
    Если починены все 3 генаратора, то ворота будут открыты и Выживший может сбежать
*/

:- dynamic generator_state/2.

% Выжившие (survivors)
survivor(dwight).
survivor(meg).
survivor(claudette).
survivor(jake).
survivor(nea).

% Убийцы (killers)
killer(trapper).
killer(wraith).
killer(hillbilly).
killer(nurse).
killer(michael_myers).

% Существующие места на карте
place(house).
place(barn).
place(forest).
place(street).

% Предметы Выживших (items)
item(flashlight).
item(medkit).
item(toolbox).
item(map).
item(key).

% Генераторы на карте (generators)
generator(generator1).
generator(generator2).
generator(generator3).

% Связь пердметов, которые используют только Выжившие: 
has_item(dwight, medkit).
has_item(meg, flashlight).
has_item(claudette, toolbox).
has_item(jake, map).
has_item(nea, key).

% Состояние генераторов: 
generator_state(generator1, broken).
generator_state(generator2, broken).
generator_state(generator3, broken).

% Местоположение Убийц, Выживших и генераторов на карте: 
location(dwight, house).
location(meg, barn).
location(claudette, forest).
location(jake, barn).
location(nea, street).

location(trapper, barn).
location(wraith, forest).
location(michael_myers, house).

location(generator1, house).
location(generator2, barn).
location(generator3, forest).

% 1 Правила на проверку, что Выживший может починить генератор
can_repair(Survivor, Generator) :-
    survivor(Survivor),
    location(Survivor, Location),
    location(Generator, Location),
    generator_state(Generator, broken).

% 2 Проверка, что Выживший может сбежать 
can_escape(Survivor) :-
    survivor(Survivor),
    generator_state(generator1, repaired),
    generator_state(generator2, repaired),
    generator_state(generator3, repaired).

% 3 Проверка, что Убийца может обнаружить Выжившего
can_detect(Killer, Survivor) :-
    killer(Killer),
    survivor(Survivor),
    location(Killer, Location),
    location(Survivor, Location).

% 4 Изменение состояние генератора после починки
repair_generator(Generator) :- 
    retract(generator_state(Generator, broken)), 
    assert(generator_state(Generator, repaired)).

% 5 Изменения состояния генератора после поломки 
damage_generator(Generator) :- 
    retract(generator_state(Generator, repaired)), 
    assert(generator_state(Generator, broken)).

% 6 Проверка, что Выживший может использовать предмет
can_use_item(Survivor, Item) :-
    survivor(Survivor),
    has_item(Survivor, Item).

/**

Примеры запросов: 

location(X, house), survivor(X).
- Определение Выживших, который находятся в доме

survivor(X), \+ has_item(X, flashlight).
- Определение Выживших, у которых нет фонарика

generator_state(Generator, broken).
- Определение всех сломанных генераторов

can_use_item(X, medkit).
- Определение персонажей, который могут использовать предмет "medkit"

can_repair(X, generator1).
Определение кто из выживших может починить генератор1

can_detect(trapper, claudette).
Определение может ли Убийца обнаружить Выжившиего

repair_generator(generator1).
Изменения состояния генератора на починенный

damage_generator(generator2).
Изменения состояние генератора на сломанный

can_escape(dwight).
Проверка может ли сбежать выживший 

*/