/*
    Limite do texto para os cards de Dica
*/

const containerTexto = [...document.querySelectorAll("div.dica")]
const lerMais = [...document.querySelectorAll(".lerMais")]
const limite = 100;
var body = document.querySelector("body")

function limitarTexto(btnLerMais) {
    let paiT = btnLerMais.parentNode.parentNode
    containerTexto.forEach((containerT) => {
        if (paiT == containerT) {
            paiT.classList.toggle("limita")
        } else {
            containerT.classList.add("limita")
        }
    })
}


lerMais.map((btnLerMais) => {
    btnLerMais.addEventListener("click", (evt) => {
        evt.preventDefault()
        limitarTexto(btnLerMais)
        let textLermais = btnLerMais.textContent == "Ler mais" ? "Ler menos" : "Ler mais"
        btnLerMais.innerHTML = textLermais
    })
})
//  ========== ========== ========== ========== ========== ========== ========== ========== ========== ========== 

/*
    Loading
*/

let caixaLoaging = document.querySelector("#Loading");
let siteTodo = document.querySelector("div.tudo")

window.onload = () => {
    if (localStorage.tema == "dark") {
        body.classList.add("dark")
    }
    else {
        body.classList.remove("dark")
    }
}
setTimeout(() => {
    caixaLoaging.style.display = "none"
    siteTodo.style.display = "flex"
}, 1500)