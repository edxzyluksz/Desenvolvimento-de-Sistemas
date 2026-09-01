/**
 * Aplicação: Meu Dia - Lista de Tarefas com Tipos, Detalhes e Categorias
 * Arquitetura: Vanilla JavaScript (ES6+)
 * Persistência: LocalStorage API
 */

// Chave utilizada para persistência no LocalStorage
const STORAGE_KEY = 'meu_dia_tarefas_v2';

// Mapeamento das categorias e seus metadados visuais
const CATEGORY_MAP = {
    trabalho: { label: '💼 Trabalho', class: 'cat-trabalho' },
    estudos: { label: '📚 Estudos', class: 'cat-estudos' },
    pessoal: { label: '👤 Pessoal', class: 'cat-pessoal' },
    saude: { label: '🏃 Saúde', class: 'cat-saude' },
    financas: { label: '💰 Finanças', class: 'cat-financas' },
    outros: { label: '📌 Geral', class: 'cat-outros' }
};

// Referências aos elementos do DOM principal
const taskInput = document.getElementById('task-input');
const addBtn = document.getElementById('add-btn');
const openModalBtn = document.getElementById('open-modal-btn');
const taskList = document.getElementById('task-list');
const emptyState = document.getElementById('empty-state');
const emptyStateText = document.getElementById('empty-state-text');
const filterButtons = document.querySelectorAll('.filter-btn');

// Referências aos elementos do Modal
const taskModal = document.getElementById('task-modal');
const modalTitle = document.getElementById('modal-title');
const modalTaskId = document.getElementById('modal-task-id');
const modalTaskTitle = document.getElementById('modal-task-title');
const modalTaskDetails = document.getElementById('modal-task-details');
const modalCloseBtn = document.getElementById('modal-close-btn');
const modalCancelBtn = document.getElementById('modal-cancel-btn');
const modalSaveBtn = document.getElementById('modal-save-btn');

/**
 * Estado da aplicação em memória
 * @type {Array<{ id: string, text: string, category: string, details: string, completed: boolean, createdAt: number }>}
 */
let tasks = [];
let currentFilter = 'all';

/**
 * Salva as tarefas no LocalStorage
 */
function saveTasks() {
    try {
        localStorage.setItem(STORAGE_KEY, JSON.stringify(tasks));
    } catch (error) {
        console.error('Erro ao salvar tarefas no LocalStorage:', error);
    }
}

/**
 * Atualiza o estado vazio com mensagem contextual
 */
function updateEmptyState(visibleCount) {
    if (visibleCount === 0) {
        if (currentFilter === 'all') {
            emptyStateText.textContent = 'Nenhuma tarefa adicionada ainda. Aproveite seu dia! ✨';
        } else {
            const catName = CATEGORY_MAP[currentFilter] ? CATEGORY_MAP[currentFilter].label : currentFilter;
            emptyStateText.textContent = `Nenhuma tarefa na categoria ${catName}.`;
        }
        emptyState.classList.add('visible');
    } else {
        emptyState.classList.remove('visible');
    }
}

/**
 * Cria o elemento HTML de uma tarefa
 * @param {object} task 
 * @param {boolean} isNew 
 * @returns {HTMLLIElement}
 */
function createTaskElement(task, isNew = false) {
    const li = document.createElement('li');
    li.className = `task-item ${task.completed ? 'completed' : ''} ${isNew ? 'item-enter' : ''}`;
    li.dataset.id = task.id;

    if (isNew) {
        li.addEventListener('animationend', () => {
            li.classList.remove('item-enter');
        }, { once: true });
    }

    const contentDiv = document.createElement('div');
    contentDiv.className = 'task-content';

    // Checkbox de conclusão
    const checkbox = document.createElement('input');
    checkbox.type = 'checkbox';
    checkbox.className = 'task-checkbox';
    checkbox.checked = task.completed;
    checkbox.setAttribute('aria-label', `Marcar tarefa "${task.text}" como concluída`);
    checkbox.title = 'Marcar como concluída';
    checkbox.addEventListener('change', () => toggleTask(task.id));

    // Bloco de informações (Badge + Título + Detalhes)
    const infoBlock = document.createElement('div');
    infoBlock.className = 'task-info-block';

    const headerRow = document.createElement('div');
    headerRow.className = 'task-header-row';

    // Badge de Categoria
    const categoryInfo = CATEGORY_MAP[task.category] || CATEGORY_MAP.outros;
    const badge = document.createElement('span');
    badge.className = `category-badge ${categoryInfo.class}`;
    badge.textContent = categoryInfo.label;

    // Título da Tarefa
    const titleSpan = document.createElement('span');
    titleSpan.className = 'task-text';
    titleSpan.textContent = task.text;

    headerRow.appendChild(badge);
    headerRow.appendChild(titleSpan);
    infoBlock.appendChild(headerRow);

    // Detalhes / Observações (se existirem)
    if (task.details && task.details.trim() !== '') {
        const detailsSnippet = document.createElement('p');
        detailsSnippet.className = 'task-details-snippet';
        detailsSnippet.textContent = task.details;
        infoBlock.appendChild(detailsSnippet);
    }

    contentDiv.appendChild(checkbox);
    contentDiv.appendChild(infoBlock);

    // Ações (Botão Detalhes/Editar + Botão Excluir)
    const actionsDiv = document.createElement('div');
    actionsDiv.className = 'task-actions';

    const editBtn = document.createElement('button');
    editBtn.className = 'btn-details';
    editBtn.type = 'button';
    editBtn.innerHTML = '📝 Detalhes';
    editBtn.title = 'Visualizar e editar detalhes da tarefa';
    editBtn.addEventListener('click', () => openModalForEdit(task.id));

    const deleteBtn = document.createElement('button');
    deleteBtn.className = 'btn-delete';
    deleteBtn.textContent = 'Excluir';
    deleteBtn.type = 'button';
    deleteBtn.title = 'Excluir tarefa';
    deleteBtn.addEventListener('click', () => deleteTask(task.id));

    actionsDiv.appendChild(editBtn);
    actionsDiv.appendChild(deleteBtn);

    li.appendChild(contentDiv);
    li.appendChild(actionsDiv);

    return li;
}

/**
 * Renderiza a lista de tarefas aplicando o filtro selecionado
 */
function renderFilteredTasks() {
    taskList.innerHTML = '';

    const filteredTasks = tasks.filter(task => {
        if (currentFilter === 'all') return true;
        return task.category === currentFilter;
    });

    filteredTasks.forEach(task => {
        const itemElement = createTaskElement(task, false);
        taskList.appendChild(itemElement);
    });

    updateEmptyState(filteredTasks.length);
}

/**
 * Carrega tarefas salvas do LocalStorage
 */
function loadTasks() {
    try {
        const storedTasks = localStorage.getItem(STORAGE_KEY);
        if (storedTasks) {
            tasks = JSON.parse(storedTasks);
        } else {
            // Compatibilidade com chave antiga v1 caso exista
            const legacyTasks = localStorage.getItem('meu_dia_tarefas_v1');
            if (legacyTasks) {
                const parsed = JSON.parse(legacyTasks);
                tasks = parsed.map(t => ({
                    id: t.id || Date.now().toString(),
                    text: t.text || '',
                    category: 'outros',
                    details: '',
                    completed: !!t.completed,
                    createdAt: Date.now()
                }));
                saveTasks();
            }
        }
    } catch (error) {
        console.error('Erro ao carregar tarefas do LocalStorage:', error);
        tasks = [];
    }

    renderFilteredTasks();
}

/**
 * Adição rápida via campo de texto principal
 */
function addQuickTask() {
    const taskText = taskInput.value.trim();

    if (taskText === '') {
        alert('Por favor, digite o nome de uma tarefa antes de adicionar!');
        taskInput.focus();
        return;
    }

    // Define a categoria inicial com base no filtro ativo
    const category = currentFilter !== 'all' ? currentFilter : 'trabalho';

    const newTask = {
        id: Date.now().toString(),
        text: taskText,
        category: category,
        details: '',
        completed: false,
        createdAt: Date.now()
    };

    tasks.unshift(newTask);
    saveTasks();

    // Renderiza e destaca o novo item
    renderFilteredTasks();

    taskInput.value = '';
    taskInput.focus();
}

/**
 * Remove uma tarefa pelo ID com transição fluida
 * @param {string} id
 */
function deleteTask(id) {
    const taskElement = taskList.querySelector(`[data-id="${id}"]`);

    if (taskElement) {
        taskElement.classList.add('item-removing');
        setTimeout(() => {
            tasks = tasks.filter(task => task.id !== id);
            saveTasks();
            renderFilteredTasks();
        }, 220);
    } else {
        tasks = tasks.filter(task => task.id !== id);
        saveTasks();
        renderFilteredTasks();
    }
}

/**
 * Alterna o status de concluído de uma tarefa
 * @param {string} id
 */
function toggleTask(id) {
    tasks = tasks.map(task => {
        if (task.id === id) {
            const updatedCompleted = !task.completed;
            const taskElement = taskList.querySelector(`[data-id="${id}"]`);
            if (taskElement) {
                taskElement.classList.toggle('completed', updatedCompleted);
                const checkbox = taskElement.querySelector('.task-checkbox');
                if (checkbox) checkbox.checked = updatedCompleted;
            }
            return { ...task, completed: updatedCompleted };
        }
        return task;
    });

    saveTasks();
}

/* ==========================================================================
   Lógica do Modal (Criação e Edição com Categorias e Detalhes)
   ========================================================================== */

/**
 * Abre o modal para criar uma nova tarefa completa
 */
function openModalForNew() {
    modalTitle.textContent = 'Nova Tarefa com Detalhes';
    modalTaskId.value = '';
    modalTaskTitle.value = taskInput.value.trim();
    modalTaskDetails.value = '';

    // Seleciona a categoria ativa no filtro ou padrão 'trabalho'
    const defaultCat = currentFilter !== 'all' ? currentFilter : 'trabalho';
    const categoryRadio = document.querySelector(`input[name="modal-category"][value="${defaultCat}"]`);
    if (categoryRadio) categoryRadio.checked = true;

    taskModal.classList.add('open');
    taskModal.setAttribute('aria-hidden', 'false');
    modalTaskTitle.focus();
}

/**
 * Abre o modal preenchido para visualizar ou editar uma tarefa existente
 * @param {string} id
 */
function openModalForEdit(id) {
    const task = tasks.find(t => t.id === id);
    if (!task) return;

    modalTitle.textContent = 'Editar Detalhes da Tarefa';
    modalTaskId.value = task.id;
    modalTaskTitle.value = task.text;
    modalTaskDetails.value = task.details || '';

    const categoryRadio = document.querySelector(`input[name="modal-category"][value="${task.category || 'outros'}"]`);
    if (categoryRadio) {
        categoryRadio.checked = true;
    }

    taskModal.classList.add('open');
    taskModal.setAttribute('aria-hidden', 'false');
    modalTaskTitle.focus();
}

/**
 * Fecha o modal e limpa os campos
 */
function closeModal() {
    taskModal.classList.remove('open');
    taskModal.setAttribute('aria-hidden', 'true');
    modalTaskId.value = '';
    modalTaskTitle.value = '';
    modalTaskDetails.value = '';
}

/**
 * Salva os dados do formulário do Modal (Criar ou Editar)
 */
function saveModalTask() {
    const title = modalTaskTitle.value.trim();
    const details = modalTaskDetails.value.trim();
    const selectedCategoryInput = document.querySelector('input[name="modal-category"]:checked');
    const category = selectedCategoryInput ? selectedCategoryInput.value : 'trabalho';
    const editId = modalTaskId.value;

    if (title === '') {
        alert('Por favor, informe o título da tarefa!');
        modalTaskTitle.focus();
        return;
    }

    if (editId) {
        // Atualiza tarefa existente
        tasks = tasks.map(task => {
            if (task.id === editId) {
                return {
                    ...task,
                    text: title,
                    category: category,
                    details: details
                };
            }
            return task;
        });
    } else {
        // Cria nova tarefa completa
        const newTask = {
            id: Date.now().toString(),
            text: title,
            category: category,
            details: details,
            completed: false,
            createdAt: Date.now()
        };
        tasks.unshift(newTask);
        taskInput.value = '';
    }

    saveTasks();
    renderFilteredTasks();
    closeModal();
}

/* ==========================================================================
   Configuração dos Ouvintes de Eventos (Event Listeners)
   ========================================================================== */

// Adição Rápida
addBtn.addEventListener('click', addQuickTask);
taskInput.addEventListener('keydown', (event) => {
    if (event.key === 'Enter') {
        addQuickTask();
    }
});

// Abertura do Modal
openModalBtn.addEventListener('click', openModalForNew);

// Fechamento do Modal
modalCloseBtn.addEventListener('click', closeModal);
modalCancelBtn.addEventListener('click', closeModal);
modalSaveBtn.addEventListener('click', saveModalTask);

// Fechar modal ao clicar fora do card
taskModal.addEventListener('click', (event) => {
    if (event.target === taskModal) {
        closeModal();
    }
});

// Fechar modal com a tecla Escape
document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape' && taskModal.classList.contains('open')) {
        closeModal();
    }
});

// Filtros de Categoria
filterButtons.forEach(button => {
    button.addEventListener('click', () => {
        filterButtons.forEach(btn => btn.classList.remove('active'));
        button.classList.add('active');
        currentFilter = button.dataset.category;
        renderFilteredTasks();
    });
});

// Inicialização da aplicação ao carregar a página
document.addEventListener('DOMContentLoaded', loadTasks);
