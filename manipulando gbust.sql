insert into generos values(
	3, "suspense"
);

insert into filmes (duracao, nome, ano_lancamento)
 values(null, "Duro de matar", 1994);
 
 select * from filmes;
 select * from generos;
 
 update filmes set quantidade=5 where id=1;
 
 insert filmes_generos values (null, 1, 3);
 
 select * from filmes_generos;
 
 select filmes.*, generos.nome as 'Nome do Genero' from filmes 
 inner join filmes_generos on filmes.id = filmes_generos.filme_id
 inner join generos on filmes_generos.genero_id = generos.id
 where  generos.id=3;
 
select filmes.*, generos.nome as 'Nome do Genero' from filmes 
left join filmes_generos on filmes.id = filmes_generos.filme_id
left join generos on filmes_generos.genero_id = generos.id
where  generos.id=3;
 
 
 
 
 
 