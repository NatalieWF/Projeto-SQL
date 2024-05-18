-- Tabela de Pedidos
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteNome VARCHAR(255),
    DataPedido DATE);

-- Tabela de ItensPedidos
CREATE TABLE ItensPedidos (
    ItemID INT PRIMARY KEY,
    PedidoID INT,
    ProdutoNome VARCHAR(255),
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID));

-- Inserir 5 pedidos com itens
INSERT INTO Pedidos (PedidoID, ClienteNome, DataPedido) VALUES
    (1, 'ClienteA', '2023-01-20'),
    (2, 'ClienteB', '2023-02-25'),
    (3, 'ClienteC', '2023-03-15'),
    (4, 'ClienteD', '2023-04-07'),
    (5, 'ClienteE', '2023-05-21');

INSERT INTO ItensPedidos (ItemID, PedidoID, ProdutoNome, Quantidade, PrecoUnitario) VALUES
    (1, 1, 'ProdutoA', 2, 45.00),
    (2, 1, 'ProdutoB', 1, 60.00),
    (3, 2, 'ProdutoC', 3, 35.00),
    (4, 3, 'ProdutoD', 1, 80.00),
    (5, 4, 'ProdutoE', 2, 56.00);

-- Consulta com JOIN para mostrar tabelas relacionadas
SELECT 
    Pedidos.PedidoID,
    Pedidos.ClienteNome,
    Pedidos.DataPedido,
    ItensPedidos.ItemID,
    ItensPedidos.ProdutoNome,
    ItensPedidos.Quantidade,
    ItensPedidos.PrecoUnitario
FROM
    Pedidos
JOIN
    ItensPedidos ON Pedidos.PedidoID = ItensPedidos.PedidoID;
