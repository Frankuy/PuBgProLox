/* Fakta */
dynamic(playerPosition/2).
dynamic(weaponPosition/3).
dynamic(playerHealth/1).
dynamic(playerArmor/1).
dynamic(playerInventory/2).
dynamic(playerEquip/2).
dynamic(luasmap/2).

weapon(akm, 50, 0).
weapon(ump, 35, 0).
weapon(pistol, 10, 0).
ammo(5).
ammo(10).
armor(vest, 50).
armor(helmet, 20).
medicine(firstaid, 70).
medicine(bandage, 10).

/* RULES */
start :- write('Selamat datang di Pulau Champs.'), nl, 
		 write('Bersenang-senanglah di pulau ini!. Tapi ingat only one can survive and get the title "Jagonya Ayam"'), nl, 
		 write('Jika kamu menang, Kamu juga akan mendapatkan persediaan sosis selama 1 tahun penuh. So, let\'s the battle royale begin!'), nl, nl,
		 write('Perintah yang tersedia : '),nl,
		 write('    start.'), nl,
		 write('    help.'), nl,
		 write('    quit.'), nl,
		 write('    NSEW.'), nl,
		 write('    map.'),nl,
		 write('    take(object).'), nl,
		 write('    drop(object).'), nl,
		 write('    use(object).'), nl,
		 write('    attack.'),nl,
		 write('    status.'),nl,
		 write('    save(filename).'),nl,
		 write('    load(filename).'),nl,
		 write('Keterangan : '),nl,
		 write('    W = weapon'),nl,
		 write('    A = Armor'),nl,
		 write('    M = Medicine'),nl,
		 write('    O = Ammo'),nl,
		 write('    P = Player'),nl,
		 write('    E = Enemy'),nl,
		 write('    - = Accesible'),nl,
		 write('    X = Inaccesible'),
		 random(0,10,X),
		 random(0,10,Y),
		 assertz(playerPosition(X,Y)),
		 assertz(weaponPosition(akm, X+1, Y+1)),
		 assertz(weaponPosition(clurit, X, Y-1)),
		 assertz(weaponPosition(gearsepeda, X, Y+1)),
		 assertz(playerHealth(100)),
		 assertz(playerArmor(0)),
		 assertz(playerInventory(0,5)),
		 assertz(playerEquip(none, 0)),
		 assertz(luasmap(10, 10)).

help :- write('    start.'), nl,
		 write('    help.'), nl,
		 write('    quit.'), nl,
		 write('    NSEW.'), nl,
		 write('    map.'),nl,
		 write('    take(object).'), nl,
		 write('    drop(object).'), nl,
		 write('    use(object).'), nl,
		 write('    attack.'),nl,
		 write('    status.'),nl,
		 write('    save(filename).'),nl,
		 write('    load(filename).').

quit :- halt.

n :- playerPosition(X, Y), Z is Y-1, retract(playerPosition(X,Y)), assertz(playerPosition(X,Z)).
w :- playerPosition(X, Y), Z is X-1, retract(playerPosition(X,Y)), assertz(playerPosition(Z,Y)).
e :- playerPosition(X, Y), Z is X+1, retract(playerPosition(X,Y)), assertz(playerPosition(Z,Y)).
s :- playerPosition(X, Y), Z is Y+1, retract(playerPosition(X,Y)), assertz(playerPosition(X,Z)).

status :- playerHealth(Health), playerArmor(Armor), playerEquip(Equipment, _), playerInventory(Jumlah,_),
			write('Health : '), write(Health), nl,
			write('Armor : '), write(Armor), nl,
			write('Weapon : '), write(Equipment), nl, 
			Jumlah = 0, write('Your inventory is empty!').
			
/* 
attack :- playerEquip(X, Y).
*/

/* look :- playerPosition(X,Y),
		weaponPosition(J,A,B),
		cetak(X-1,A,Y+1,B,'W', J),
		weaponPosition(J,A,B),
		cetak(X,A,Y+1,B,'W', J),
		weaponPosition(J,A,B),
		cetak(X+1,A,Y+1,B,'W', J),nl,
		weaponPosition(J,A,B),
		cetak(X-1,A,Y,B,'W', J),
		weaponPosition(J,A,B),
		cetak(X,A,Y,B,'W', J),
		weaponPosition(J,A,B),
		cetak(X+1,A,Y,B,'W', J),nl,
		weaponPosition(J,A,B),
		cetak(X-1,A,Y-1,B,'W', J),
		weaponPosition(J,A,B),
		cetak(X,A,Y-1,B,'W', J),
		weaponPosition(J,A,B),
		cetak(X+1,A,Y-1,B,'W', J). */
		
/* cetak(X,XBenda,Y,YBenda, Benda) :- XBenda = X, YBenda = Y, write(Benda), !.
cetak(X,XBenda,Y,YBenda, Benda) :- write('-'). */