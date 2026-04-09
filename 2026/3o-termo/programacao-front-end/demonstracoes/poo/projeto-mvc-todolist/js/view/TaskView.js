// Classe para organização da interface

export class TarefaView{
    constructor(){
        this.taskInput = document.getElementById("taskInput")
        this.addTaskBtn = document.getElementById("addTaskBtn")
        this.listTasks = document.getElementById("listTasks")
        this.message = document.getElementById("message")
    }

    // Métodos
    // Pegar a tarefa do input

    getTaskInputValue() {
        return this.tarefaInput.value.trim();
    }

    // Limpar o valor do input
    clearInput() {
        this.taskInput.value = "";
    }

    // Mandar uma mensagem para o usuário no parágrafo
    showMessage(text) {
        this.message.textContent = text
    }

    clearMessage() {
        this.message.textContent = "";
    }

    // Renderizar a lista de tarefas
}