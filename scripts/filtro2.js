let botoes = document.querySelectorAll("section#filtro aside.botoes button");
let itens = document.querySelectorAll("section#filtro aside.itens div.item");
let item1 = itens[0];
let botao1 = botoes[0];

function mostrarItemInicial() {
    let valorBtn = item1.getAttribute("valor")
    removerAtivoBtn()
    botao1.classList.add("ativo")
    mostrarItem(valorBtn)
}

function removerAtivoBtn() {
    botoes.forEach(botao => {
        botao.classList.remove("ativo")
    })
}

function mostrarItem(valorBtn) {
    itens.forEach(item => {
        let valorItem = item.getAttribute("valor")
        if (valorBtn == valorItem) {
            item.style.display = "block"
        }
        else {
            item.style.display = "none"
        }
    })
}

window.onload = () => {
    if (localStorage.valorBtn) {
        removerAtivoBtn()
        botoes.forEach(botao => {
            let valorBtn = botao.getAttribute("valor")
            if (valorBtn == localStorage.valorBtn) {
                botao.classList.add("ativo")
            }
        })
        mostrarItem(localStorage.valorBtn)
    } else {
        mostrarItemInicial()
    }
}

botoes.forEach(botao => {
    botao.addEventListener("click", () => {
        // Pega o atributo valor do botão clicado
        let valorBtn = botao.getAttribute("valor")
        localStorage.valorBtn = valorBtn
        removerAtivoBtn()
        botao.classList.add("ativo")
        mostrarItem(valorBtn)
    })
})

