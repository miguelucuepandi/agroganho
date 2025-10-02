
let botoes = document.querySelectorAll("section#filtro aside.botoes button");
let itens = document.querySelectorAll("section#filtro aside.itens div.item");

botoes.forEach(botao => {
    botao.addEventListener("click", () => {
        botoes.forEach(botao => {
            botao.classList.remove("ativo")
        })
        
        let valorBtn = botao.getAttribute("valor")
        botao.classList.add("ativo")
        
        itens.forEach(item => {
            let valorItem = item.getAttribute("valor")
            if (valorBtn == "todos") {
                item.style.display = "block"
            }
            else if (valorBtn == valorItem) {
                item.style.display = "block"
            }
            else {
                item.style.display = "none"
            }
        })
    })
})

