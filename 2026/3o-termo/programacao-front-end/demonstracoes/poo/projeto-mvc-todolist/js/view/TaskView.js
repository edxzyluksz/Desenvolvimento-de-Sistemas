// Classe para organização da interface

export class TaskView{
    constructor(){
        this.taskInput = document.getElementById("taskInput");
        this.addTaskBtn = document.getElementById("addTaskBtn");
        this.listTasks = document.getElementById("listTasks");
        this.message = document.getElementById("message");
    }

    // Métodos
    // Pegar a tarefa do input

    getTaskInputValue() {
        return this.taskInput.value.trim();
    }

    // Limpar o valor do input
    clearInput() {
        this.taskInput.value = "";
    }

    // Mandar uma mensagem para o usuário no parágrafo
    showMessage(text) {
        this.message.textContent = text;
    }

    cleanMessage() {
        this.message.textContent = "";
    }

    // Renderizar a lista de tarefas
    renderTask(tasks, update, remove) {
        // Limpar a lista existente
        this.listTasks.innerHTML = ""; // Remover todo HTML do ul

        // Reconstruir a lista
        tasks.forEach(task => {
            // Lógica do laço de repetição
            const li = document.createElement("li"); // Criando um item na lista

            if (task.completed) {
                li.classList.add("completed"); // Adicionando a classe completed ao elemento
            }

            const span = document.createElement("span");
            span.textContent = task.title;

            const action = document.createElement("div");
            action.classList.add("action");

            // Botão para atualizar a tarefa
            const updateBtn = document.createElement("button")
            updateBtn.textContent = task.completed ? "Desfazer" : "Concluir"; // Operador ternário
            updateBtn.addEventListener("click", () => update(task.id)); // Função que estará no controller
            
            // Botão para remover a tarefa
            const removeBtn = document.createElement("button");
            removeBtn.textContent = "Remover";
            removeBtn.addEventListener("click", () => remove(task.id));
            
            // Adicionar os elementos ao HTML
            action.appendChild(updateBtn);
            action.appendChild(removeBtn);

            // Adiciona o span e a div ao li
            li.appendChild(span);
            li.appendChild(action);
            
            // Add li ao ul
            this.listTasks.appendChild(li);
        });
    }
}

// Pega os elementos do HTML
// Lê o valor do Input
// Limpa o Input
// Mostra Mensagem
// Limpa a Mensagem
// Renderiza a lista de Tarefas na UL