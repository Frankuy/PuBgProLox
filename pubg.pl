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
start :- write(' _____    _    _   ____     _____ '),nl,
		 write('|  __ \\  | |  | | |  _ \\   / ____|'),nl,
		 write('| |__) | | |  | | | |_) | | |  __'),nl,
		 write('|  ___/  | |  | | |  _ <  | | |_ |'),nl,
		 write('| |      | |__| | | |_) | | |__| |'),nl,
		 write('|_|       \\____/  |____/   \\_____|  Jagonya Ayam'),nl,   
		 write('                                     '),nl,
		 write('Selamat datang di Pulau Champs.'), nl, 
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
		 assertz(playerPosition(2,2)),
		 assertz(weaponPosition(akm, 1, 1)),
		 assertz(weaponPosition(clurit, 2, 3)),
		 assertz(weaponPosition(gearsepeda, 3, 3)),
		 assertz(playerHealth(100)),
		 assertz(playerArmor(0)),
		 assertz(playerInventory(0,5)),
		 assertz(playerEquip(none, 0)),
		 assertz(luasmap(10, 10)).

help :-     nl, print('      =================================================================================='),
			nl, print('     |Available commands to help you survive the game and win the title  "Jagonya Ayam"|'),
			nl, print('     |=================================================================================|'),
			nl, print('     |start.            | Start the game.                                              |'),
			nl, print('     |help.             | Get some help to look over commands available.               |'),
			nl, print('     |quit.             | Farewell, quit the game.                                     |'),
			nl, print('     |look.             | Look around you.                                             |'),
			nl, print('     |map.              | Open map and see where on Earth are you.                     |'),
			nl, print('     |N. E. S. W.       | Move to the North, East, South, or West.                     |'),
			nl, print('     |take(Object).     | Pick up an object.                                           |'),
			nl, print('     |drop(Object).     | Drop an object.                                              |'),
			nl, print('     |use(Object).      | Use an object from your inventory.                           |'),
			nl, print('     |attack.           | Attack the enemy that crosses your path.                     |'),
			nl, print('     |status.           | Show your status.                                            |'),
			nl, print('     |save(FileName).   | Save your game.                                              |'),
			nl, print('     |load(FileName).   | Load your previously saved game.                             |'),
			nl, print('     |=================================================================================|'),
			nl, print('     |                            Information in the map                               |'),
			nl, print('     |=================================================================================|'),
			nl, print('     |         W        | Weapon                                                       |'),
			nl, print('     |         A        | Armor                                                        |'),
			nl, print('     |         M        | Medicine                                                     |'),
			nl, print('     |         O        | Ammo                                                         |'),
			nl, print('     |         P        | Player                                                       |'),
			nl, print('     |         E        | Enemy                                                        |'),
			nl, print('     |         -        | Accessible                                                   |'),
			nl, print('     |         X        | Inaccessible                                                 |'),
			nl, print('      ==================================================================================').

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
			
look :- playerPosition(X,Y),
		A is X-1, B is Y-1, cek(A,B),
		C is X, D is Y-1,cek(C,D),
		E is X+1, F is Y-1,cek(E,F),nl,
		G is X-1, H is Y,cek(G,H),
		I is X, J is Y,cek(I,J),
		K is X+1, L is Y,cek(K,L),nl,
		M is X-1, N is Y+1,cek(M,N),
		O is X, P is Y+1,cek(O,P),
		Q is X+1, R is Y+1,cek(Q,R).
		
/*cetak(X,XBenda,Y,YBenda, Benda, NamaBenda) :- XBenda = X, YBenda = Y, write(Benda), retract(weaponPosition(NamaBenda, XBenda, YBenda)),assertz(weaponPosition(NamaBenda, XBenda, YBenda)), !.
cetak(X,XBenda,Y,YBenda, Benda, NamaBenda) :- write('-').
cariObjek(X,Y,Simbol):- */

attack :- playerHealth(X), Z is X-20, retract(playerHealth(X)), asserta(playerHealth(Z)). 

cek(X,Y):-weaponPosition(_,X,Y),write('W'),!.
cek(X,Y):-write('-').
