/*
(resolva com JOIN e depois com subselect)
1) Liste todos os pedidos com o nome dos clientes (ex2_pedido, ex2_cliente)
2) Liste todos os pedidos com o nome dos clientes e quantos itens de produtos cada pedido possui (ex2_pedido, ex2_cliente, ex2_itempedido)
*/
use pedidos

select P.*, C.nome from EX2_PEDIDO P
inner join EX2_CLIENTE C on (P.codcliente = C.codcliente)

-- Com subselect
select a.*, (select b.nome from EX2_CLIENTE b
			where a.codcliente = b.codcliente)
from EX2_PEDIDO a
where exists (select b.nome from EX2_CLIENTE b
			where a.codcliente = b.codcliente)

--------------------------------------------------------------
select quantidade, P.codpedido, C.nome from EX2_ITEMPEDIDO IT
inner join EX2_PEDIDO P on (IT.codpedido = P.codpedido)
inner join EX2_CLIENTE C on (P.codcliente = C.codcliente)

select * from EX2_PEDIDO