const modal = document.getElementById('imageModal');
const modalImage = document.getElementById('modalImage');

function showImage(src) {
    modalImage.src = src;
    modal.style.display = 'flex'; // Exibe o modal
}

function closeModal() {
    modal.style.display = 'none'; // Esconde o modal
}

// Adiciona evento ao modal para fechar clicando fora da imagem
modal.addEventListener('click', (e) => {
    if (e.target === modal) {
        closeModal();
    }
});
