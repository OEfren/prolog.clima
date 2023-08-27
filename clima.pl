ciudad(cdmx, 24).
ciudad(puebla, 24).
ciudad(leon, 25).
ciudad(san_luis_potosi, 27).
ciudad(aguascalientes, 25).
ciudad(guadalajara, 25).
ciudad(monterrey, 36).
ciudad(ciudad_juarez, 29).

clima(Temperatura, Clima):-
(Temperatura < 26 -> Clima = "Templado"; Clima = "Cálido").

evaluar:-
write('¿Cuál es tu ciudad?'),
nl,
read(Ciudad),
ciudad(Ciudad, Temperatura),
clima(Temperatura, Clima),
write("Temperatura: "),
writeln(Temperatura),
write("Clima: "),
writeln(Clima),
nl.
