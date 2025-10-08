const btnMenu = document.getElementById('btnMenu');
const sideBar = document.querySelector('section#left');
const btnTema = document.querySelector('#btnTema');
let body = document.querySelector("body")

btnMenu.addEventListener('click', () => {
    btnMenu.classList.toggle('ativar');
    sideBar.classList.toggle('abrir');
})

btnTema.addEventListener('click', () => {
    body.classList.toggle('dark');
})
