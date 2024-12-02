
function sendRequest(action, produtoID = null, Qtd = null) {
    const data = { action, ID_Produto: ID_Produto, Qtd };

    return fetch('cart.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data),
    }).then((response) => response.json());
}

// Adicionar produto ao carrinho
function addToCart(ID_Produto) {
    sendRequest('add', ID_Produto)
        .then(() => listCart()) // Atualiza o carrinho após adicionar
        .catch((error) => console.error('Erro ao adicionar:', error));
}

// Remover produto do carrinho
function removeFromCart(ID_Produto) {
    sendRequest('remove', ID_Produto)
        .then(() => listCart()) // Atualiza o carrinho após remover
        .catch((error) => console.error('Erro ao remover:', error));
}

// Listar itens do carrinho
function listCart() {
    sendRequest('list')
        .then((items) => renderCart(items)) // Renderiza os itens recebidos
        .catch((error) => console.error('Erro ao listar:', error));
}

// Renderizar o carrinho no site
function renderCart(items) {
    const cartItems = document.getElementById('cart-items');
    cartItems.innerHTML = '';

    if (items.length === 0) {
        cartItems.innerHTML = '<li>O carrinho está vazio!</li>';
        return;
    }

    items.forEach((item) => {
        const li = document.createElement('li');
        li.innerHTML = `
            ${item.nome} - R$${item.preco.toFixed(2)} x ${item.quantidade}
            <button onclick="removeFromCart(${item.ID_Produto})">Remover</button>`;
        cartItems.appendChild(li);
    });
}

// Limpar carrinho
function clearCart() {
    sendRequest('clear')
        .then(() => listCart()) // Atualiza o carrinho após limpar
        .catch((error) => console.error('Erro ao limpar o carrinho:', error));
}

// Carregar o carrinho ao iniciar a página
document.addEventListener('DOMContentLoaded', listCart);
