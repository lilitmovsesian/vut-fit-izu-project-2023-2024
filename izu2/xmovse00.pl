% Zadani c. 26:
% Napiste program resici ukol dany predikatem u26(VIN), kde promenna VIN 
% obsahuje prirozene cislo. Predikat prevede toto cislo na hexadecimalni cislo. 

% Testovaci predikaty:
u26_1:- u26(113).						% 71
u26_2:- u26(10).						% A
u26_3:- u26(252).                       % FC
u26_r:- write('Zadej VIN: '),read(VIN),u26(VIN).

% Reseni:
u26(VIN):-
    dec_to_hex(VIN, HEX),
    print_hex(HEX).

% Converts decimal number to hexadecimal.
% Directly converts decimal numbers 0 to 9.
dec_to_hex(DecNum, Result) :-
    DecNum >= 0, 
    DecNum =< 9,
    Result = [DecNum].

dec_to_hex(10, ['A']).
dec_to_hex(11, ['B']).
dec_to_hex(12, ['C']).
dec_to_hex(13, ['D']).
dec_to_hex(14, ['E']).
dec_to_hex(15, ['F']).

% For numbers >15 recursively gets hexadecimal
% digits by dividing the number by 16 and getting remainders.
dec_to_hex(DecNum, Result) :-
    DecNum > 15,
    Modulo is DecNum mod 16,
    NextDec is DecNum // 16,
    dec_to_hex(NextDec, HigherHex),
    dec_to_hex(Modulo, LowerHex),
    append(HigherHex, LowerHex, Result).

% Prints hexadecimal list.
% Empty list.
print_hex([]).
% Prints each element of the list.
print_hex([Head|Tail]) :-
    write(Head),
    print_hex(Tail).