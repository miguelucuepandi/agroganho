const btnMenu = document.getElementById('btnMenu');
const sideBar = document.querySelector('section#left');

btnMenu.addEventListener('click', () => {
    btnMenu.classList.toggle('ativar');
    sideBar.classList.toggle('abrir');
})
