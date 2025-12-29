/*
    Neste filtro tem a opção de mostrar todos
*/

let botoes = document.querySelectorAll("section#filtro aside.botoes button");
let itens = document.querySelectorAll("section#filtro aside.itens div.item");

function removerAtivoBtn() {
    botoes.forEach(botao => {
        botao.classList.remove("ativo")
    })
}

function mostrarItem(valorBtn, item, valorItem) {
    if (valorBtn == "todos") {
        item.style.display = "block"
    }
    else if (valorBtn == valorItem) {
        item.style.display = "block"
    }
    else {
        item.style.display = "none"
    }
}

botoes.forEach(botao => {
    botao.addEventListener("click", () => {
        
        removerAtivoBtn()
        
        // Pega o atributo valor do botão clicado
        let valorBtn = botao.getAttribute("valor")
        botao.classList.add("ativo")
        
        itens.forEach(item => {
            let valorItem = item.getAttribute("valor")
            mostrarItem(valorBtn, item, valorItem)
        })
    })
})

