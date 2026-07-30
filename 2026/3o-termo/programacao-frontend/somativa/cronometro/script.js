//variaveis
const timerEl = document.getElementById("timer"); //variavel que mostra a passagem de tempo, linha 12 html
const marksListElement = document.getElementById("marks-list"); //armazena a passagem do tempo

let intervalid = 0;
let timer = 0; //armazena o tempo em centesimos de segundos
let voltas = []; //para marcar tempos especificos

//função para formatar a passagem do tempo (segundo->minuto, minuto->hora)
const formatTime = (time) => {
    const hours = Math.floor(time / 360000); //centesimo de segundo dividido por 360000
    const minutes = Math.floor((time % 360000) / 6000);
    const seconds = Math.floor((time % 6000) / 100);
    const hundredths = time % 100;

    //transformar inteiro em string e manter as duas casas decimais
    return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}:${hundredths.toString().padStart(2, '0')}`;
}

//voltas
const addMarkToList = (markIndex, markTimeValue) => {
    marksListElement.innerHTML += `<p>Marca ${markIndex}: ${formatTime(markTimeValue)}</p>`;
}

const markTime = () => {
    if (voltas[voltas.length - 1] === timer) {
        return; // Impede marcar o mesmo tempo múltiplas vezes
    }
    //permite que o tempo começa a rodar
    voltas.push(timer);
    addMarkToList(voltas.length, timer);
}

//controla o play, continue
const toggleTimer = () => {
    const button = document.getElementById('power');
    const action = button.getAttribute('action'); //causou vários problemas, não fazia o código rodar porque estava escrito "document.getAttribute" ao invés de button
    
    clearInterval(intervalid); //iniciar tempo novo

    if (action == 'start' || action == 'continue') {
        intervalid = setInterval(() => {
            timer += 1;
            setTimer(timer);
        }, 10); //incrementa o tempo
        button.setAttribute('action', 'pause');
        button.innerHTML = '<i class="fa-solid fa-pause"></i>'; //troca o icone
    } else if (action == 'pause') {
        button.setAttribute('action', 'continue');
        button.innerHTML = '<i class="fa-solid fa-play"></i>'; //troca o icone
    }
}
 //reiniciar o tempo
const resetTimer = () => {
    clearInterval(intervalid);
    timer = 0;
    voltas = [];
    setTimer(timer);
    marksListElement.innerHTML = '';
    const button = document.getElementById('power');
    button.setAttribute('action', 'start');
    button.innerHTML = '<i class="fa-solid fa-play"></i>';
}

const setTimer = (time) => {
    timerEl.innerText = formatTime(time); //vai "transmitir" o tempo pro html
}
// Funcionalidades para botão
document.getElementById('power').addEventListener('click', toggleTimer);
document.getElementById('mark').addEventListener('click', markTime);
document.getElementById('reset').addEventListener('click', resetTimer);