-- CTE que simula a Tabela_A (pedidos com múltiplas linhas por id_pedido)
WITH Tabela_A AS (
    SELECT * FROM (VALUES
        (1, TIMESTAMP '2023-08-01 10:00:00', 250.00),
        (1, TIMESTAMP '2023-08-05 09:15:00', 180.00),
        (1, TIMESTAMP '2023-08-07 14:00:00', 300.00),
        (2, TIMESTAMP '2023-08-02 11:00:00', 399.90),
        (2, TIMESTAMP '2023-08-04 13:30:00', 220.00),
        (2, TIMESTAMP '2023-08-06 16:45:00', 190.00),
        (3, TIMESTAMP '2023-08-03 12:00:00', 129.99),
        (3, TIMESTAMP '2023-08-05 17:00:00', 199.99),
        (3, TIMESTAMP '2023-08-08 08:45:00', 89.90)
    ) AS t(id_pedido, data_pedido, valor_pedido)
),

-- CTE que simula a Tabela_B (eventos dos pedidos)
Tabela_B AS (
    SELECT * FROM (VALUES
        (1, TIMESTAMP '2023-08-01 15:00:00', 'Pagamento aprovado'),
        (1, TIMESTAMP '2023-08-02 09:30:00', 'Pedido em transporte'),
        (1, TIMESTAMP '2023-08-03 17:45:00', 'Pedido entregue'),
        (2, TIMESTAMP '2023-08-02 14:10:00', 'Pagamento aprovado'),
        (2, TIMESTAMP '2023-08-05 10:00:00', 'Pedido devolvido'),
        (3, TIMESTAMP '2023-08-03 13:15:00', 'Pagamento aprovado'),
        (3, TIMESTAMP '2023-08-04 11:00:00', 'Pedido em transporte'),
        (3, TIMESTAMP '2023-08-06 19:00:00', 'Pedido entregue')
    ) AS t(id_pedido, data_evento, evento)
),

-- Último evento por pedido
Ultimo_Evento AS (
    SELECT
        id_pedido,
        evento,
        data_evento,
        ROW_NUMBER() OVER (PARTITION BY id_pedido ORDER BY data_evento DESC) AS rn
    FROM Tabela_B
),

-- Filtra somente o evento mais recente
Eventos_Finais AS (
    SELECT
        id_pedido,
        evento AS ultimo_evento,
        data_evento AS data_ultimo_evento
    FROM Ultimo_Evento
    WHERE rn = 1
)

-- Junta os pedidos com o último evento por id_pedido
SELECT
    a.id_pedido,
    a.data_pedido,
    a.valor_pedido,
    e.ultimo_evento,
    e.data_ultimo_evento
FROM Tabela_A a
LEFT JOIN Eventos_Finais e
    ON a.id_pedido = e.id_pedido
ORDER BY a.id_pedido, a.data_pedido;
