// Classe controller para realizar a interação entre model e view

export class TaskController {
    constructor(model, view) {
        this.model = model;
        this.view = view;
    }

    init() {
        // Evento para adicionar tarefas
        this.view.addTaskBtn.addEventListener("click", () => this.addTask())
        // Renderizar a lista de tarefas
        this.view.renderTask(
            this.model.getTasks(), // pegar as tarefas do model
            (id) => this.updateTask(id),
            (id) => this.removeTask(id)
        );
    }

    // Funções para adicionar tarefas
    addTask() {
        const title = this.view.getTaskInputValue() // Pega o valor do input

        if (!title) { // Captura strings vazias e transforma em true {
            this.view.showMessage("O título da tarefa não pode ser vazio.");
            return; // Interrompe a função
        }

        // Continuo escrevendo a função
        this.view.cleanMessage(); // Limpa a mensagem de erro
        this.model.addTask(title);
        this.view.clearInput();
        this.updateView();

    }
    
    // Função para mudar tarefa para concluída ou não concluída
    updateTask(id) {
        this.model.updateTask(id);
        this.updateView()
    }

    // Função para remover a tarefa

    removeTask(id) {
        this.model.removeTask(id) // Remove a tarefa no model
        this.updateView()
    }

    updateView() {
        this.view.renderTask(
            this.model.getTasks(),
            (id) => this.updateTask(id),
            (id) => this.removeTask(id)
        )
    }
}   