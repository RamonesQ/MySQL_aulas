USE movies;

-- atv 1
select * from movie;

-- atv 2

insert into language (language_id, language_code, language_name)
values (null, 'BR', 'Português(Brasil)');

select * from language;

-- atv 3

insert into production_company (company_id, company_name)
values(15,'Lereby Produções');

select * from production_company;

-- atv 4

insert into movie (movie_id, title, release_date, overview, popularity, runtime, revenue)
values (null, 'O Auto da Compadecida', '2000-09-15', 'As aventuras de João Grilo e Chicó, dois nordestinos pobres que vivem de golpes para sobreviver. Eles estão sempre enganando o povo de um pequeno vilarejo, inclusive o temido cangaceiro Severino de Aracaju, que os persegue pela região.',
2.157166, 157, 11496994);

insert into movie_company( movie_id, company_id)
values (459489, 15);

insert into movie_languages values (459489, 24702, 1);

insert into movie_genres( movie_id, genre_id)
values (459489, 35);

-- atv 5

update language set language_name='Desconhecido' where language_id=24701;

-- atv 6

select * from person where person_name like "%lee%";
select count(person_id) from person where person_name like "%lee%";
-- resultado = 965

-- atv 7

select title, runtime from movie where runtime < 130;
select count(movie_id) from movie where runtime <  130;
-- resultado = 527 (4804 filmes na db, 527 com runtime > 130 e 4232 com runtime < 130)

-- atv 8

select movie.title, production_company.company_name from movie
	inner join movie_company on movie.movie_id = movie_company.movie_id
    inner join production_company on production_company.company_id = movie_company.company_id;

-- atv 9
select * from movie
	inner join movie_genres on movie.movie_id = movie_genres.movie_id
    inner join genre on genre.genre_id = movie_genres.genre_id
    where genre.genre_name = "Fantasy";
select count(movie.movie_id) from movie
	inner join movie_genres on movie.movie_id = movie_genres.movie_id
    inner join genre on genre.genre_id = movie_genres.genre_id
    where genre.genre_name = "Fantasy";
-- resultado = 424

-- atv 10 

select title from movie order by revenue desc limit 1;
-- resultado = Avatar

-- atv 11

select * from movie where release_date < "1950-01-01";
select count(movie_id) from movie where release_date < "1950-01-01";
-- resposta = 46

-- atv 12

select * from movie
	inner join movie_cast on movie.movie_id = movie_cast.movie_id
    inner join person on person.person_id = movie_cast.person_id
    where person.person_name = "Tom Hanks";
select count(movie.movie_id) from movie
	inner join movie_cast on movie.movie_id = movie_cast.movie_id
    inner join person on person.person_id = movie_cast.person_id
    where person.person_name = "Tom Hanks";
-- resposta = 32

