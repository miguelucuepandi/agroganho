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
    let tema = (localStorage.tema) ? localStorage.tema : ""
    localStorage.tema = tema
})

window.onload = () => {
    if (localStorage.tema == "dark") {
        body.classList.add("dark")
    }
    else {
        body.classList.remove("dark")
    }
}