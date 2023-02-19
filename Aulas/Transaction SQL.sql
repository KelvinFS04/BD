/*
-Declara��o de vari�veis
-Atribui��o de Dados
-Desvio Condicional
-La�o de repeti��o
*/

--Declara��o e atribui��o de vari�veis
use funcionarios
declare @idade int = 18
declare @sal�rio decimal(10,2)
declare @media decimal(10,2)
set @sal�rio = 1234567890.12
set @sal�rio = (select sum(func_salario) from funcionarios)
select @sal�rio = sum(func_salario) --Select funciona como um set
from funcionarios
select @sal�rio = sum(func_salario), @media = avg(func_salario) from funcionarios

--------------------------------------------------------------------------------------

--comando if
declare @gerente int = 1

if @gerente = 1 
	begin
		select * from funcionarios where gerente_id = 1
	end
else --Uma linha n�o precisa de begin end
	select * from funcionarios where gerente_id !=1
	
--------------------------------------------------------------------------------------
declare @tipo varchar(30)
declare @valor decimal(10,2)
set @tipo = 'soma'

if @tipo = 'media'
	set @valor = (select avg(func_salario) from funcionarios)

else
	set @valor = (select sum(func_salario) from funcionarios)

print 'O valor calculado � R$' + cast(@valor as varchar(20))

	
--------------------------------------------------------------------------------------
--la�o de repeti��o

declare @contador int = 1
while(@contador <= 10) begin
	print 'N�mero: ' + cast(@contador as varchar(2))
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
			else 'Milion�rio'
		end as tipo_salario
	from funcionarios f






