/*
Usando ao banco de dados de locadora faça:
1) Crie uma view chamada vw_nuncaLocados, que exiba
o nome e codigo dos filmes que nunca foram alugados

2) Crie uma view chamada vw_ClienteSemLocacao, que exiba
o nome e codigo dos clientes que nunca fizeram uma locação

3) Crie uma view chamada vw_Top5, que exiba
o nome dos 5 filmes mais alugados

4) Crie uma view chamada vw_LocacaoTOP, que exiba o 
nome dos clientes de maneira distinta que fizeram locações
de algum dos filmes Top5 (use a view do ex_3)

5) Crie uma view chamada vw_genero, que exiba o 
codigo e descrição do genero de todos os filmes que nunca
foram locados (use view do ex_1)

6) Cria uma view chamada vw_ClienteTOP, que exiba
os 5 nomes de clientes com codigo, que fizeram o maior
numero de locações
*/

-----------------------------------------------------------------
use Locadora

--1)
create view vw_nuncaLocados as
	select M.CodMidia, M.DescMidia from Midias M
	left join ItensLocacao IL on IL.CodMidia = M.CodMidia
	where CodLocacao is null

--para resolver outro exercício:

alter view vw_nuncaLocados as
	select m.CodMidia, m.DescMidia, m.codGenero
	from Midias m
	left join ItensLocacao itl on m.CodMidia = itl.CodMidia
	where itl.CodLocacao is null

select * from vw_nuncaLocados
------------------------------------------------------------------
--2)
create view vw_ClienteSemLocacao as
	select c.Cliente, c.CodCli from Cliente c
	left join Locacao L on c.CodCli = l.CodCli
	where l.DataLoc is null


select * from vw_ClienteSemLocacao
------------------------------------------------------------------
--3) 
create view vw_Top5 as
	select  top 5 count(m.CodMidia) qtd, m.DescMidia, m.CodMidia from Midias m
	inner join ItensLocacao il on m.CodMidia = il.CodMidia
	inner join Locacao l on il.CodLocacao = l.CodLocacao
	group by m.CodMidia, m.DescMidia
	order by qtd desc

delete vw_Top5

select * from vw_Top5
------------------------------------------------------------------
--4)
create view vw_LocacaoTOP as
	select c.Cliente from Cliente c
	inner join Locacao l on c.CodCli = l.CodCli
	inner join ItensLocacao il on l.CodLocacao = il.CodLocacao
	inner join vw_Top5 vw on il.CodMidia = vw.CodMidia
	group by c.cliente

drop view vw_LocacaoTOP
select * from vw_LocacaoTOP


------------------------------------------------------------------
--5)

create view vw_genero as
select distinct g.Codgenero, g.descricao
from vw_nuncaLocados a
inner join Genero g on g.Codgenero = a.codGenero


------------------------------------------------------------------
--6)

create view vw_ClienteTOP as
	select top 5 c.Cliente
	from Locacao L 
	inner join Cliente C on c.CodCli = L.CodCli
	group by c.Cliente
	order by count(*) desc