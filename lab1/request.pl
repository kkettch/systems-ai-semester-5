location(X, house), survivor(X).
% Определение Выживших, который находятся в доме

survivor(X), \+ has_item(X, flashlight).
% Определение Выживших, у которых нет фонарика

generator_state(Generator, broken).
% Определение всех сломанных генераторов

can_use_item(X, medkit).
% Определение персонажей, который могут использовать предмет medkit

can_repair(X, generator1).
% Определение кто из выживших может починить генератор1

can_detect(trapper, claudette).
%Определение может ли Убийца обнаружить Выжившиего

repair_generator(generator1).
% Изменения состояния генератора на починенный

damage_generator(generator2).
% Изменения состояние генератора на сломанный

can_escape(dwight).
% Проверка может ли сбежать выживший 
