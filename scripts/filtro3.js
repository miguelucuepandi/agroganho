/*
    Neste filtro não tem a opção de mostrar todos, e o botão não é guardado no localStorage
*/


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
            item.style.display = "flex"
        }
        else {
            item.style.display = "none"
        }
    })
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

mostrarItemInicial()