let cart = {};

function addToCart(product) {
    if (cart[product]) {
        cart[product]++;
    } else {
        cart[product] = 1;
    }
    renderCart();
}

function removeFromCart(product) {
    if (cart[product]) {
        cart[product]--;
        if (cart[product] === 0) {
            delete cart[product];
        }
    }
    renderCart();
}

function renderCart() {
    const cartItems = document.getElementById('cart-items');
    cartItems.innerHTML = '';

    for (let product in cart) {
        const li = document.createElement('li');
        li.innerHTML = `
            ${product} - Quantidade: ${cart[product]} 
            <button onclick="removeFromCart('${product}')">Remover</button>
        `;
        cartItems.appendChild(li);
    }
}

function finalizeOrder() {
    if (Object.keys(cart).length === 0) {
        alert('Seu carrinho está vazio!');
    } else {
        alert('Pedido finalizado com sucesso!');
        cart = {};
        renderCart();
    }
}