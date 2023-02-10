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
	select  top (5) count(m.CodMidia) qtd, m.DescMidia from Midias m
	inner join ItensLocacao il on m.CodMidia = il.CodMidia
	inner join Locacao l on il.CodLocacao = l.CodLocacao
	group by DescMidia
	order by COUNT(m.CodMidia) desc

select * from vw_ClienteSemLocacao
------------------------------------------------------------------

