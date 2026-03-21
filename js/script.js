const TaskModel = {
    key: 'myDailyTasks_DB',
    tasks: [],

    init() {
        this.tasks = JSON.parse(localStorage.getItem(this.key)) || [];
    },

    getAll() {
        return this.tasks;
    },

    add(name, desc, priority) {
        const newTask = {
            id: Date.now(),
            name,
            desc,
            priority,
            completed: false
        };
        this.tasks.push(newTask);
        this.save();
        return newTask;
    },

    update(id, name, desc, priority) {
        const index = this.tasks.findIndex(t => t.id === id);
        if (index > -1) {
            this.tasks[index] = { ...this.tasks[index], name, desc, priority };
            this.save();
            return this.tasks[index];
        }
        return null;
    },

    toggleStatus(id, status) {
        const task = this.tasks.find(t => t.id === id);
        if (task) {
            task.completed = status;
            this.save();
        }
        return task;
    },

    delete(id) {
        this.tasks = this.tasks.filter(t => t.id !== id);
        this.save();
    },

    save() {
        localStorage.setItem(this.key, JSON.stringify(this.tasks));
    }
};


const TaskView = {
    sections: {
        pending: document.getElementById('user-tasks'),
        done: document.getElementById('done-tasks'),
        edit: document.getElementById('edit-task'),
        createOverlay: document.getElementById('create-task-overlay'),
        primaryOptions: document.getElementById('primary-options')
    },
    lists: {
        pending: document.querySelector('#user-tasks nav'),
        done: document.querySelector('#done-tasks nav')
    },
    forms: {
        create: document.getElementById('new-taskData'),
        edit: document.getElementById('edit-taskData')
    },
    buttons: {
        finish: document.getElementById('finish-task'),
        delete: document.getElementById('delete-task'),
        confirm: document.getElementById('confirm-action'),
        navAdvance: document.getElementById('advance-page-btn'),
        navReturn: document.getElementById('return-page-btn'),
        label: document.getElementById('page-switch-text')
    },

    renderAll(tasks) {
        this.lists.pending.innerHTML = '';
        this.lists.done.innerHTML = '';
        
        tasks.forEach(task => {
            if (task.completed) this.renderDone(task);
            else this.renderPending(task);
        });
        
        this.updateGlobalButtons();
    },

    renderPending(task) {
        const btn = document.createElement('button');
        btn.className = 'task';
        btn.dataset.id = task.id;

        const { color, text } = this.getPriorityInfo(task.priority);

        btn.innerHTML = `
            <div class="task-name"><span>${task.name}</span></div>
            <div class="task-priority"><span style="color: ${color}; font-weight:bold;">${text}</span></div>
        `;
        
        this.lists.pending.appendChild(btn);
    },

    renderDone(task) {
        const div = document.createElement('div');
        div.className = 'done-task';
        div.dataset.id = task.id;

        div.innerHTML = `
            <div class="task-name" style="text-decoration: line-through; opacity: 0.7;">
                <span>${task.name}</span>
            </div>
            <div class="done-task-actions flex-col">
                <button class="view-done-info-btn"><img src="img/eye.png"></button>
                <button class="delete-done-btn"><img src="img/trashcan.png"></button>
            </div>
        `;
        this.lists.done.appendChild(div);
    },

    updateTaskVisual(task) {
        const btn = document.querySelector(`button.task[data-id="${task.id}"]`);
        if (btn) {
            const { color, text } = this.getPriorityInfo(task.priority);
            btn.innerHTML = `
                <div class="task-name"><span>${task.name}</span></div>
                <div class="task-priority"><span style="color: ${color}; font-weight:bold;">${text}</span></div>
            `;
        }
    },

    getPriorityInfo(priority) {
        const map = {
            'alta': { color: "#be2a2a", text: "ALTA" },
            'media': { color: "#faf73c", text: "MÉDIA" },
            'baixa': { color: "#489cfb", text: "BAIXA" }
        };
        return map[priority] || map['baixa'];
    },

    toggleScreen(screenName) {
        if (screenName === 'create') {
            this.sections.createOverlay.style.display = 'flex';
            document.getElementById('taskName').focus();
        } else if (screenName === 'closeCreate') {
            this.sections.createOverlay.style.display = 'none';
        } else if (screenName === 'edit') {
            this.sections.pending.style.display = 'none';
            this.sections.done.style.display = 'none';
            this.sections.edit.style.display = 'flex';
            this.sections.primaryOptions.style.display = 'none';
        } else if (screenName === 'home') {
            this.sections.edit.style.display = 'none';
            this.sections.done.style.display = 'none';
            this.sections.pending.style.display = 'flex';
            this.sections.primaryOptions.style.display = 'flex';
            this.updateNavFooter('home');
        } else if (screenName === 'done') {
            this.sections.pending.style.display = 'none';
            this.sections.edit.style.display = 'none'
            this.sections.done.style.display = 'flex';
            this.sections.primaryOptions.style.display = 'none';
            this.updateNavFooter('done');
        }
    },

    updateNavFooter(state) {
        if (state === 'done') {
            this.buttons.navAdvance.style.visibility = 'hidden';
            this.buttons.navReturn.style.visibility = 'visible';
            this.buttons.label.innerText = "Ver pendentes";
        } else {
            this.buttons.navReturn.style.visibility = 'hidden';
            this.buttons.navAdvance.style.visibility = 'visible';
            this.buttons.label.innerText = "Ver concluídos";
        }
    },

    updateGlobalButtons() {
        const hasTasks = this.lists.pending.children.length > 0;
        const display = hasTasks ? 'block' : 'none';
        this.buttons.finish.style.display = display;
        this.buttons.delete.style.display = display;
    },

    fillEditForm(task) {
        this.forms.edit.taskName.value = task.name;
        this.forms.edit.taskDesc.value = task.desc;
        const radios = this.forms.edit.querySelectorAll('input[name="priority"]');
        radios.forEach(r => r.checked = (r.value === task.priority));
    }
};

const TaskController = {
    selectionMode: null, // ''finish' | 'delete' | null'
    selectedIds: new Set(),
    editingId: null,

    init() {
        TaskModel.init();
        TaskView.renderAll(TaskModel.getAll());
        this.setupEventListeners();
    },

    setupEventListeners() {
        document.getElementById('new-task').addEventListener('click', () => {
            this.exitSelectionMode();
            TaskView.toggleScreen('create');
        });
        document.getElementById('cancel-task').addEventListener('click', () => TaskView.toggleScreen('closeCreate'));
        TaskView.forms.create.addEventListener('submit', (e) => this.handleCreate(e));

        // Formulário Editar
        TaskView.forms.edit.addEventListener('submit', (e) => this.handleEditSubmit(e));
        document.getElementById('cancel-edit').addEventListener('click', () => {
            this.editingId = null;
            TaskView.toggleScreen('home');
        });

        // Navegação
        TaskView.buttons.navAdvance.addEventListener('click', () => TaskView.toggleScreen('done'));
        TaskView.buttons.navReturn.addEventListener('click', () => TaskView.toggleScreen('home'));

        // Modos de Seleção
        TaskView.buttons.finish.addEventListener('click', () => this.toggleMode('finish'));
        TaskView.buttons.delete.addEventListener('click', () => this.toggleMode('delete'));
        TaskView.buttons.confirm.addEventListener('click', () => this.handleBatchAction());

        TaskView.lists.pending.addEventListener('click', (e) => {
            const btn = e.target.closest('.task');
            if (btn) this.handleTaskClick(parseInt(btn.dataset.id));
        });

        TaskView.lists.done.addEventListener('click', (e) => {
            const card = e.target.closest('.done-task');
            if (!card) return;
            const id = parseInt(card.dataset.id);
            
            if (e.target.closest('.delete-done-btn')) this.handleDeletePermanent(id);
            if (e.target.closest('.view-done-info-btn')) this.showInfo(id);
        });
    },

    handleCreate(e) {
        e.preventDefault();
        const f = TaskView.forms.create;
        TaskModel.add(f.taskName.value, f.taskDesc.value, f.priority.value);
        
        f.reset();
        TaskView.toggleScreen('closeCreate');
        TaskView.renderAll(TaskModel.getAll());
    },

    handleTaskClick(id) {
        if (this.selectionMode) {
            this.toggleSelection(id);
        } else {
            const task = TaskModel.getAll().find(t => t.id === id);
            if (task) {
                this.editingId = id;
                TaskView.fillEditForm(task);
                TaskView.toggleScreen('edit');
            }
        }
    },

    handleEditSubmit(e) {
        e.preventDefault();
        if (!this.editingId) return;

        const f = TaskView.forms.edit;
        TaskModel.update(this.editingId, f.taskName.value, f.taskDesc.value, f.priority.value);
        
        TaskView.toggleScreen('home');
        TaskView.renderAll(TaskModel.getAll());
        this.editingId = null;
    },

    toggleMode(mode) {
        if (this.selectionMode === mode) {
            this.exitSelectionMode();
            return;
        }
        this.selectionMode = mode;
        this.selectedIds.clear();
        this.updateSelectionVisuals();
    },

    exitSelectionMode() {
        this.selectionMode = null;
        this.selectedIds.clear();
        this.updateSelectionVisuals();
    },

    toggleSelection(id) {
        if (this.selectedIds.has(id)) this.selectedIds.delete(id);
        else this.selectedIds.add(id);
        this.updateSelectionVisuals();
    },

    updateSelectionVisuals() {
        const isFinish = this.selectionMode === 'finish';
        const isDelete = this.selectionMode === 'delete';
        
        TaskView.buttons.finish.classList.toggle('active-mode', isFinish);
        TaskView.buttons.delete.classList.toggle('active-mode', isDelete);
        
        // Atualiza botão Confirmar
        if (this.selectionMode) {
            TaskView.buttons.confirm.style.display = 'block';
            TaskView.buttons.confirm.innerText = `Confirmar (${this.selectedIds.size})`;
        } else {
            TaskView.buttons.confirm.style.display = 'none';
        }

        // Atualiza estilo das tarefas
        document.querySelectorAll('.task').forEach(btn => {
            btn.classList.remove('select-finish', 'select-delete');
            const id = parseInt(btn.dataset.id);
            if (this.selectedIds.has(id)) {
                if (isFinish) btn.classList.add('select-finish');
                if (isDelete) btn.classList.add('select-delete');
            }
        });
    },

    handleBatchAction() {
        const animClass = this.selectionMode === 'finish' ? 'anim-finish' : 'anim-delete';

        this.selectedIds.forEach(id => {
            const btn = document.querySelector(`.task[data-id="${id}"]`);
            if (btn) {
                btn.classList.add(animClass);
            }
        });

        setTimeout(() => {
            this.selectedIds.forEach(id => {
                if (this.selectionMode === 'delete') TaskModel.delete(id);
                if (this.selectionMode === 'finish') TaskModel.toggleStatus(id, true);
            });
            
            this.exitSelectionMode();
            TaskView.renderAll(TaskModel.getAll());
        }, 500);
    },

    handleDeletePermanent(id) {
        if (confirm("Deseja excluir a tarefa permanentemente?")) {
            TaskModel.delete(id);
            TaskView.renderAll(TaskModel.getAll());
        }
    },

    showInfo(id) {
        const task = TaskModel.getAll().find(t => t.id === id);
        if (task) {
            const priorityText = TaskView.getPriorityInfo(task.priority).text;
            alert(`Detalhes:\n\nNome: ${task.name}\nDescrição: ${task.desc}\nPrioridade: ${task.priority.toUpperCase()}`);
        }
    }
};

document.addEventListener('DOMContentLoaded', () => {
    TaskController.init();
});