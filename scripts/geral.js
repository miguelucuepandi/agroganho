const containerTexto = [...document.querySelectorAll("div.dica")]
const lerMais = [...document.querySelectorAll(".lerMais")]
const limite = 100;

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
    })
})
