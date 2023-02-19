/*
-Declaração de variáveis
-Atribuição de Dados
-Desvio Condicional
-Laço de repetição
*/

--Declaração e atribuição de variáveis
use funcionarios
declare @idade int = 18
declare @salário decimal(10,2)
declare @media decimal(10,2)
set @salário = 1234567890.12
set @salário = (select sum(func_salario) from funcionarios)
select @salário = sum(func_salario) --Select funciona como um set
from funcionarios
select @salário = sum(func_salario), @media = avg(func_salario) from funcionarios

--------------------------------------------------------------------------------------

--comando if
declare @gerente int = 1

if @gerente = 1 
	begin
		select * from funcionarios where gerente_id = 1
	end
else --Uma linha não precisa de begin end
	select * from funcionarios where gerente_id !=1
	
--------------------------------------------------------------------------------------
declare @tipo varchar(30)
declare @valor decimal(10,2)
set @tipo = 'soma'

if @tipo = 'media'
	set @valor = (select avg(func_salario) from funcionarios)

else
	set @valor = (select sum(func_salario) from funcionarios)

print 'O valor calculado é R$' + cast(@valor as varchar(20))

	
--------------------------------------------------------------------------------------
--laço de repetição

declare @contador int = 1
while(@contador <= 10) begin
	print 'Número: ' + cast(@contador as varchar(2))
	set @contador = @contador + 1


--------------------------------------------------------------------------------------
--Uso do case

select f.func_nome, f.func_salario, 
		case f.gerente_id
		when 1 then 'Gerente 1'
		when 2 then 'Gerente 2'
		when 3 then 'Gerente 3'
		else 'Inexistente'
		end as tipo_gerente
from funcionarios f

select f.func_nome, f.func_salario,
	case
			when f.func_salario < 1000 then 'Ganha pouco'
			when f.func_salario < 2000 then 'Ganha bem'
			else 'Milionário'
		end as tipo_salario
	from funcionarios f






