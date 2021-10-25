GLOBAL FACTS 
yes (symbol) 
no (symbol)
PREDICATES 
nondeterm fish(symbol) 
nondeterm otrajd(symbol) 
nondeterm vid(symbol) 
begin 
answer 
question(symbol) 
add_to_database(symbol,char) 
otvet(char) 
clear_from_database 
priznak(symbol) 
GOAL
begin.
CLAUSES 
begin:- 
	write ("Ответьте на вопросы :"),nl,nl, 
	answer, 
	clear_from_database, 
	nl,nl,nl,nl, 
	exit. 
answer :- 
	fish(X),!,nl, 
	save("BF1.dbf"), 
	write (" Ответ: ",X,"."),nl. 
question(Y) :- 
     	write ("Вoпрос:    ",Y,"? "), 
	otvet(X), 
	write(X),nl, 
	add_to_database (Y,X). 
otvet(C):- 
	readchar(C). 
	priznak(Y) :- 
	yes(Y),!. 
	priznak(Y) :- 
	not(no(Y)), 
  	question (Y). 
add_to_database (Y,'y') :- 
	assertz (yes (Y)). 
add_to_database (Y,'n') :- 
	assertz (no (Y)),fail. 
clear_from_database :- retract (yes(_)),fail. 
clear_from_database :- retract (no(_)),fail. 
fish("это сазан"):-  
	otrajd("отряд карпообразные"), 
	priznak("губы с 4 усиками").
fish("это плотва"):- 
	otrajd("отряд карпообразные"),
	priznak("плавники с розовыми перьями").
fish("это лещ"):-
	otrajd("отряд карпообразные"), 
	priznak("у рыбы желто-золотистый окрас"), 
	priznak("у рыбы спинной плавник узкий"). 
fish("это электрический скат"):- 
	priznak("электрические органы"),
	otrajd("отряд скаты").
fish("это скат-хвостокол"):-
	priznak("у рыбе на хвосте ядовитый шип"),
	otrajd("отряд скаты").
fish("это гигантская акула"):-
	priznak("серо-коричневый окрас"),
	priznak("у рыбы коническая морда"),
	otrajd("отряд акулы").
fish("это рыба молот"):-
	priznak("рыба нападает на людей"),
	priznak("у рыбы молотообразная морда"),
	otrajd("отряд акулы").
fish("Данной рыбы в базе знаний не обнаружено").
otrajd("отряд карпообразные"):- 
  	vid("пресноводная рыба"), 
	vid("костная рыба"), 
	priznak("одиночный спинной лучевой плавник"), 
	priznak("у рыбы нет зубов").
otrajd("отряд скаты"):- 
	priznak("у рыбы нет хвостового плавника"),
	priznak("у рыбы тонкий длинный хвост"),
	vid("морская рыба"),
	vid("хрящевая рыба").
otrajd("отряд акулы"):-
	vid("морская рыба"),
	vid("хрящевая рыба"),
	priznak("плавники не гибкие"),
	priznak("хвост ассиметричный").
vid("костная рыба"):- 
	priznak("у рыбы есть жаберные крышки"); 
	priznak("у рыбы есть костный скелет"). 
vid("пресноводная рыба"):- 
 	priznak("рыба плавает в реках или озерах").
vid("морская рыба"):-
	priznak("рыба плавает в морях").
vid("хрящевая рыба"):- 
	priznak("у рыбы нет плавательного пузыря"),
	priznak("у рыбы есть хрящевый скелет").