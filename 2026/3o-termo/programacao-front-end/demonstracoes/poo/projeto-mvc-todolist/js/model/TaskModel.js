// Base da estrutura do aplicativo - Regra do Negócio
// É a classe responsável pela modelagem de dados

// Adicionar uma anotação na classe => export
// A classe será usada em outras partes da aplicação

export class TaskModel {
    
    // Js permite colocar atributos diretamente no construtor
    constructor(){
        this.tasks = []; // Cria um vetor para as tarefas
        this.currentId = 1; // Contador para o ID
    }

    // Métodos
    // Adicionar tarefa (create)

    addTask(title) {
        const newTask = {
            id: this.currentId++,
            title: title,
            completed: false
        };
        this.tasks.push(newTask)
    }

    // Busca as tarefas (read)
    getTasks(){
        return this.tasks;
    }

    updateTask(id){
        const task = this.tasks.find(task => task.id === id);
        if (task) { // Se encontrar
            task.completed = !task.completed; // Inversão do valor lógico
        }
    }

    // Remover a tarefa do vetor (delete)
    removeTask(id) {
        this.tasks = this.tasks.filter(task => task.id !== id)
    }
}

// O que foi feito?

// - Crud | - Task Array | ID automático