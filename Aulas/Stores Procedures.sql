--Stores Procedures

--SP comum
--mostra o total dos sal�rios pagos para cada setor

use funcionarios

create procedure sp_exemplo1 as
begin
	select f.setor_id, sum(f.func_salario) as total
	from funcionarios f
	group by f.setor_id
end

--chamada da SP
exec sp_exemplo1


select * from funcionarios


--SP com par�metros
--mostra total dos sal�rios pafos para cada setor
--filtrando os setores ou -1 para todos

create procedure SP_exemplo2 (@numSetor int) as
begin
	if @numSetor = -1	
	begin --vai listar tudo
		select f.setor_id, sum(f.func_salario) as total
		from funcionarios f
		group by f.setor_id
	end
	else
	begin --vai listar somente o desejado
		select @numSetor setor_id, sum(f.func_salario) as total
		from funcionarios f
		where f.setor_id = @numSetor
	end
end

--chamada
exec SP_exemplo2 
-1 --valor a ser passado no par�metro



--SP que recebe par�metro e devolve 1 ou mais dados
create or alter procedure SP_exemplo4 (
	@num1 int,
	@num2 int, 
	@resultado decimal (10,2) output)
	as
begin
	set @resultado = @num1 / @num2
end

--chamada
declare @res decimal (10,2)
exec SP_exemplo4 10,13, @res output
print 'O resultado �: ' + cast(@res as varchar(15))


--SP que devolve v�rios valores de output
create or alter procedure SP_exemplos(
	@num1 decimal(10,2),
	@num2 decimal(10,2),
	@soma decimal(10,2) output,
	@sub decimal(10,2) output,
	@div decimal(10,2) output,
	@mult decimal(10,2) output
	) as
begin 
	set @soma = @num1 + @num2
	set @sub = @num1 - @num2
	set @div = @num1 / @num2
	set @mult = @num1 * @num2
end

--chamada
declare @soma decimal(10,7)
declare @mult decimal(10,7)
declare @divis�o decimal(10,7)
declare @sub decimal(10,7)
exec SP_exemplo5 10,13, @soma output, @sub output, @divis�o output, @mult output

print 'O resultado da soma �: ' + cast(@soma as varchar(15))
print 'O resultado da subtra��o �: ' +cast(@sub as varchar(15))
print 'O resultado da divis�o �: ' +cast(@divis�o as varchar(15))
print 'O resultado da multiplica��o �: ' +cast(@mult as varchar(15))



--Stored Procedure com verifica��es
--Sp para inclus�o de funcionarios com verifica��o do setor

create or alter procedure SP_insere_Func(
	@func_id int, @func_nome varchar (50),
	@gerente_id int, 
	@setor_id int, 
	@func_salario decimal(10,2), 
	@func_dataNasc smalldatetime)
as begin
	--verifica se o setor existe
	if not exists (select setor_id from setores where setor_id = @setor_id)
	begin
		print 'Setor informado n�o existe'
		return -1
	end

end

insert into funcionarios values(
	@func_id  ,
	@gerente_id , 
	@setor_id  ,
	@func_salario  ,
	@func_dataNasc)

--Verifica se tem o erro na inclus�o de dados
if @@ERROR != 0 
	begin
		print 'Ocorreu um erro na inclus�o de dados'
		return -1
	end
return 0
end

--chamada
declare @ret int
exec @ret = SP_insere_Func 19, 'Ivan Soares', 2, 12, 1500.87, '1972/10/22'
if @ret = 0
	print 'Dados incluidos com sucesso'
else
	print 'ocorreu um erro'
