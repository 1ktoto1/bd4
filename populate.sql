INSERT INTO Country (country) VALUES ('Украина');
INSERT INTO Country (country) VALUES ('США');
INSERT INTO Country (country) VALUES ('Норвегия');

INSERT INTO Game (game) VALUES ('Герои Меча и Магии III: Возрождение Эрафии');
INSERT INTO Game (game) VALUES ('Герои Меча и Магии III: Клинок Армагеддона');
INSERT INTO Game (game) VALUES ('Герои Меча и Магии III: Дыхание Смерти');

INSERT INTO Author (name,country,url) VALUES ('Gorbik','Украина','http://heroesportal.net/profile.php?id=11');
INSERT INTO Author (name,country,url) VALUES ('James Hanson','США','http://heroesportal.net/profile.php?id=733');
INSERT INTO Author (name,country,url) VALUES ('Stian Olsen','Норвегия','http://heroesportal.net/profile.php?id=590');



INSERT INTO Map (id,name,game,rating,author_name,downloads,map_date) 
VALUES (1,'Leaving your Ancient Valley','Герои Меча и Магии III: Клинок Армагеддона',11,'James Hanson',567,TO_DATE('2005-10-06','yyyy-mm-dd'));
INSERT INTO Map (id,name,game,rating,author_name,downloads,map_date) 
VALUES (2,'Woodyland','Герои Меча и Магии III: Возрождение Эрафии',54,'Gorbik',877,TO_DATE('2005-10-06','yyyy-mm-dd'));
INSERT INTO Map (id,name,game,rating,author_name,downloads,map_date) 
VALUES (3,'Illusion world 2','Герои Меча и Магии III: Возрождение Эрафии',68,'Stian Olsen',435,TO_DATE('2003-06-12','yyyy-mm-dd'));