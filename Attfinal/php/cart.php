<?php
include 'db.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    $action = $data['action'];
    $produtoID = $data['ID_Produto'] ?? null;
    $quantidade = $data['Qtd'] ?? null;

    $usuarioID = 1; 

   
    $stmt = $conn->prepare("SELECT ID_Carrinho FROM TB_Carrinho WHERE ID_Usuario = ?");
    $stmt->execute([$usuarioID]);
    $carrinho = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$carrinho) {
        $stmt = $conn->prepare("INSERT INTO TB_Carrinho (ID_Usuario) VALUES (?)");
        $stmt->execute([$usuarioID]);
        $carrinhoID = $conn->lastInsertId();
    } else {
        $carrinhoID = $carrinho['ID_Carrinho'];
    }

    switch ($action) {
        case 'add':
            $stmt = $conn->prepare("INSERT INTO TB_Itens (ID_Carrinho, ID_Produto, Qtd) 
                                    VALUES (?, ?, 1) 
                                    ON DUPLICATE KEY UPDATE Qtd = Qtd + 1");
            $stmt->execute([$carrinhoID, $produtoID]);
            echo json_encode(["message" => "Produto adicionado ao carrinho!"]);
            break;

        case 'remove':
            $stmt = $conn->prepare("DELETE FROM TB_Itens 
                                    WHERE ID_Carrinho = ? AND ID_Produto = ?");
            $stmt->execute([$carrinhoID, $produtoID]);
            echo json_encode(["message" => "Produto removido do carrinho!"]);
            break;

        case 'list':
            $stmt = $conn->prepare("SELECT i.ID_Produto, p.Nome, p.Preco, i.Qtd 
                                     FROM TB_Itens i 
                                     JOIN TB_Produto p ON i.ID_Produto = p.ID_Produto 
                                     WHERE i.ID_Carrinho = ?");
            $stmt->execute([$carrinhoID]);
            $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode($items);
            break;

        case 'clear':
            $stmt = $conn->prepare("DELETE FROM TB_Itens WHERE ID_Carrinho = ?");
            $stmt->execute([$carrinhoID]);
            echo json_encode(["message" => "Carrinho limpo!"]);
            break;
    }
}
?>
