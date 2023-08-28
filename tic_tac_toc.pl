:- dynamic box/2.
:- dynamic jugador/2.

box(1,1).
box(2,2).
box(3,3).
box(4,4).
box(5,5).
box(6,6).
box(7,7).
box(8,8).
box(9,9).

jugador(1,1).


restaurar:-
retract(box(1,_)),
retract(box(2,_)),
retract(box(3,_)),
retract(box(4,_)),
retract(box(5,_)),
retract(box(6,_)),
retract(box(7,_)),
retract(box(8,_)),
retract(box(9,_)),
assert(box(1,1)),
assert(box(2,2)),
assert(box(3,3)),
assert(box(4,4)),
assert(box(5,5)),
assert(box(6,6)),
assert(box(7,7)),
assert(box(8,8)),
assert(box(9,9)).


tablero:-
box(1,A),
box(2,B),
box(3,C),
box(4,D),
box(5,E),
box(6,F),
box(7,G),
box(8,H),
box(9,I),
nl,
write('-------'),nl,
write('|'), write(A),
write('|'), write(B),
write('|'), write(C),
write('|'), nl,
write('-------'),
nl,
write('|'),write(D),
write('|'),write(E),
write('|'),write(F),
write('|'),nl,
write('-------'),
nl,
write('|'),write(G),
write('|'),write(H),
write('|'),write(I),
write('|'),nl,
write('-------'),
nl.


jugar:-
restaurar,
tablero.

elegir(Posicion):-
jugador(1, UnoActivo),
box(Posicion,ValorCelda),
((ValorCelda == "X"; ValorCelda == "O") -> writeln("La celda ya se encuentra ocupada..") ;
 (UnoActivo == 1 ->
  retract(box(Posicion,_)),retract(jugador(1,_)),assert(box(Posicion,"X")),assert(jugador(1,0))
  ;
  retract(box(Posicion,_)),retract(jugador(1,_)),assert(box(Posicion,"O")),assert(jugador(1,1))
 )
),
tablero,
box(1,A),
box(2,B),
box(3,C),
box(4,D),
box(5,E),
box(6,F),
box(7,G),
box(8,H),
box(9,I),
writeln("Revisando: "),
write(A),write("-"),write(D),write("-"),write(G),
( (A == 1; B == 2; C == 3; D == 4; E == 5; F == 6; G == 7; H == 8; I == 9) -> nl; writeln("Tenemos un empate, el juego se reinicia."), restaurar),

(((A == "X", B == "X", C == "X"); (A == "O", B == "O", C == "O")) -> ((UnoActivo == 1) -> writeln("Han ganado las X"); writeln("Han ganado las O")), restaurar; write("")),
(((D == "X", E == "X", F == "X"); (D == "O", E == "O", F == "O")) -> ((UnoActivo == 1) -> writeln("Han ganado las X"); writeln("Han ganado las O")), restaurar; write("")),
(((G == "X", H == "X", I == "X"); (G == "O", H == "O", I == "O")) -> ((UnoActivo == 1) -> writeln("Han ganado las X"); writeln("Han ganado las O")), restaurar; write("")),
(((A == "X", D == "X", G == "X"); (A == "O", D == "O", G == "O")) -> ((UnoActivo == 1) -> writeln("Han ganado las X"); writeln("Han ganado las O")), restaurar; write("")),
(((B == "X", E == "X", H == "X"); (B == "O", E == "O", H == "O")) -> ((UnoActivo == 1) -> writeln("Han ganado las X"); writeln("Han ganado las O")), restaurar; write("")),
(((C == "X", F == "X", I == "X"); (C == "O", F == "O", I == "O")) -> ((UnoActivo == 1) -> writeln("Han ganado las X"); writeln("Han ganado las O")), restaurar; write("")),
(((A == "X", E == "X", I == "X"); (A == "O", E == "O", I == "O")) -> ((UnoActivo == 1) -> writeln("Han ganado las X"); writeln("Han ganado las O")), restaurar; write("")),
(((C == "X", E == "X", G == "X"); (C == "O", E == "O", G == "O")) -> ((UnoActivo == 1) -> writeln("Han ganado las X"); writeln("Han ganado las O")), restaurar; write("")),
nl.
