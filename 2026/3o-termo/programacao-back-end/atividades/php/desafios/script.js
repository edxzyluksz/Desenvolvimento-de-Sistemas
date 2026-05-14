const range = document.getElementById("percentual-ajuste");
const label = document.getElementById("listen-percentage");

range.addEventListener("input", (event) => {
    label.textContent = `Percentual de Reajuste (${event.target.value}%)`;
});