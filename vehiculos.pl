
% Catálogo de vehículos
vehicle(toyota, rav4, suv, 28000, 2022).
vehicle(toyota, corolla, sedan, 22000, 2021).
vehicle(toyota, highlander, suv, 35000, 2023).
vehicle(ford, mustang, sport, 45000, 2023).
vehicle(ford, escape, suv, 29000, 2022).
vehicle(ford, fiesta, sedan, 18000, 2020).
vehicle(bmw, x5, suv, 60000, 2021).
vehicle(bmw, series3, sedan, 40000, 2022).
vehicle(honda, civic, sedan, 25000, 2022).
vehicle(honda, crv, suv, 32000, 2023).

% Filtro por presupuesto
meet_budget(Reference, BudgetMax) :-
    vehicle(_, Reference, _, Price, _),
    Price =< BudgetMax.

% Listar por marca
list_by_brand(Brand, List) :-
    findall(Reference, vehicle(Brand, Reference, _, _, _), List).

% Sumar precios
sum_prices([], 0).
sum_prices([vehicle(_, _, _, Price, _) | T], Total) :-
    sum_prices(T, Subtotal),
    Total is Subtotal + Price.

% Generar reporte
generate_report(Brand, Type, Budget, Result) :-
    findall(
        vehicle(Brand, Ref, Type, Price, Year),
        (vehicle(Brand, Ref, Type, Price, Year), Price =< Budget),
        Vehicles),
    sum_prices(Vehicles, Total),
    Total =< Budget,
    Result = Vehicles.

% Casos de prueba
case1(Result) :-
    findall(Ref, (vehicle(toyota, Ref, suv, Price, _), Price < 30000), Result).

case2(Result) :-
    bagof((Type, Year, Ref), vehicle(ford, Ref, Type, _, Year), Result).

case3(Total, Result) :-
    findall(vehicle(B, R, sedan, P, Y), vehicle(B, R, sedan, P, Y), List),
    sum_prices(List, Total),
    Total =< 500000,
    Result = List.
