tarefas = {
    "segunda": "Estudar Python",
    "terca": "Reunião de equipe",
    "quarta": "Academia"
}

print(f"Lista original: {tarefas}")

tarefa_feita = tarefas.pop("segunda")

print(f"Tarefa concluída e removida: {tarefa_feita}")
print(f"Lista atualizada: {tarefas}")

try:
    tarefa_quinta = tarefas.pop("quinta")
except KeyError:
    print("Tentativa de remoção: {tarefa_quinta} (KeyError)")