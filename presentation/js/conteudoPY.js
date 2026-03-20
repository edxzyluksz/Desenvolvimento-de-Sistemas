const PyContent = {
    PyAuth: `
    import os
    dadosLogin = [f"Email: admin; Senha: senhasecreta123; Cargo: {3}"] # Login de gestor padrão para testes
    # Essa lista armazena os dados de login dos usuários, mas não funciona na memória volátil.

    def CriarDadosLogin():
    while True: 
        print("=== Registro ===")
        print("AVISO: ESSE PROCEDIMENTO DEVE SER FEITO COM CONSENTIMENTO DO USUÁRIO.")

        cargo = int(input("Escolha a função do usuário:
            1 - Aluno/Responsável 
            2 - Professor
            Escolha alternativa: "))
        if cargo not in [1, 2]:
            print("Digite uma escolha válida.")
            continue

        emailCad = input("Digite o email da conta: ")
        senhaCad = input("Digite a senha (Tenha ciência que o usuário poderá alterá-la posteriormente): ")
        dadosLogin.append(f"Email: {emailCad}; Senha: {senhaCad}; Cargo: {cargo}")
        print("Usuário registrado com sucesso!")

        if not emailCad or not senhaCad:
        os.system('cls')
        print("Falha no cadastro. Tente novamente.")
        continue



    def AutenticaUsuario():
    while True:
        try:
            if dadosLogin:
            print("Digite seus dados de acesso.")
            emailInput = input("Email: ")
            senhaInput = input("Senha: ")
            credenciais = f"Email: {emailInput}; Senha: {senhaInput}"
            for item in dadosLogin:
                if credenciais in item:
                    cargo_str = item.split("Cargo: ")[1]
                    cargo = int(cargo_str)
                    return True, cargo
            print("Erro. Login ou senha incorretos.")     
            else:
            print("Não existem usuários registrados no sistemas.")
        except ValueError:
        print("Escolha uma das opções apresentadas.")
    `,
    PyUser: `
    import os
    from autenticacao import CriarDadosLogin, dadosLogin

    # Mockup de armazenamento de dados
    alunos = []
    professores = []
    turmas = []

    def FinalizarCadastro(cargo):
        print("Olá, usuário! Para prosseguirmos, vamos finalizar o seu cadastro de informações.")
        nome = input("Digite o seu nome: ").title()
        if cargo == 1:
            nomeResponsavel = input("Por favor, digite o nome de seu responsável (Ou deixe vazio se for maior de idade): ").title()
            alunos.append({"nome": nome, "responsavel": nomeResponsavel})
            print(f"Cadastro finalizado! Bem-vindo, {nome}!")
        elif cargo == 2:
            disciplina = input("Digite a disciplina que você leciona: ")
            professores.append({"nome": nome, "disciplina": disciplina})
            print(f"Cadastro finalizado! Bem-vindo, Professor {nome}!")
        return nome

    def MenuAluno(nome):
        while True:
            fiaps = []
            print(f"Olá, {nome}! O que deseja fazer hoje?")
            print('''
                    1 - Agenda de Aulas
                    2 - Boletim Escolar
                    3 - Minhas FIAPs
                    4 - Boletos
                    5 - Materiais Escolares
                    6 - Contatos Secretaria
                    7 - Renovar Matrícula
                    8 - Sair
                ''')
            menu = int(input("Escolha uma opção: "))
            if menu == 1:
                agenda = ["Segunda-feira: Matemática, Português, Ciências", 
                        "Terça-feira: História, Geografia, Educação Física", 
                        "Quarta-feira: Inglês, Artes, Matemática", 
                        "Quinta-feira: Ciências, Português, História", 
                        "Sexta-feira: Geografia, Educação Física, Inglês"]
                print("Sua agenda de aulas é:")
                for item in agenda:
                    print(f"- {item}")
                
            elif menu == 2:
                boletim = {"Matemática": 85, "Português": 90, "Ciências": 88, "História": 92, "Geografia": 87}
                print("Seu boletim escolar é:")
                for disciplina, nota in boletim.items():
                    print(f"{disciplina}: {nota}")
                
            elif menu == 3:
                if fiaps:
                    print("Suas FIAPs são:")
                    for item in fiaps:
                        print(f"- {item}")
                        contestar = input("Deseja contestar alguma FIAP? (s/n): ").lower()
                        if contestar == 's':
                            fiapContestar = int(input("Digite o número da FIAP que deseja contestar: "))
                            if 0 < fiapContestar <= len(fiaps):
                                fiaps.pop(fiapContestar - 1)
                                print("FIAP contestada com sucesso.")
                            
                else:
                    print("Você não possui FIAPs.")
            if menu == 4:
                boletoPendentes = ["Livros Didáticos - R$150,00", "Uniforme Escolar - R$100,00", "Taxa de Atividades Extracurriculares - R$80,00"]
                boletosPagos = ["Mensalidade Dezembro 2025 - R$500,00 (pago em 10/12/2025)"]
                    print("Seus boletos pendentes são:")
                for item in boletoPendentes:
                    print(f"- {item}")
                    print("Seus boletos pagos são:")
                for item in boletosPagos:
                    print(f"- {item}")
                
            elif menu == 5:
                materiais = ["Caderno Universitário - R$20,00", "Estojo Completo - R$35,00", "Mochila Escolar - R$80,00"]
                print("Materiais escolares disponíveis para compra:")
                for item in materiais:
                    print(f"- {item}")
            elif menu == 6:
                print("=== CONEDUC ===")
                print("Contatos da Secretaria:")
                print("Nome: Escola ABC")
                print("Telefone: (11) 1234-5678")
                print("Endereço: Rua da Escola, 123 - Cidade, Estado")
            elif menu == 7:
                curso = input("Digite o curso para o qual deseja renovar a matrícula: ")
                escolhaPeriodo = input("Digite o período desejado (Matutino/Vespertino/Noturno): ")
                print(f"Matrícula para o curso de {curso} no período {escolhaPeriodo} renovada com sucesso!")
                print("Renovação de matrícula iniciada. Em breve, você receberá um email com mais informações.")
            elif menu == 8:
                print("Saindo do sistema. Até mais!")
                return
            else:
                os.system('cls')
                print("Opção inválida. Tente novamente.")

    def MenuProfessor(nome):
        while True:
            print(f"Olá, professor {nome}! O que deseja fazer hoje?")
            print('''
                    1 - Laboratórios
                    2 - Eventos da Escola
                    3 - Horários de Aula
                    4 - Minhas Turmas
                    5 - Registrar FIAP
                    6 - Sair
                ''')
            menu = int(input("Escolha uma opção: "))
            if menu == 1:
                agendamentos = [] # Puxar do banco de dados na implementação real
                print("1 - Verificar disponibilidade de laboratórios" \
                "n2 - Agendar laboratório")
                opcao = int(input("Escolha uma opção: "))
                if opcao == 1:
                    laboratorios = {"Lab de Informática": "Disponível", "Lab de Ciências": "Ocupado", "Lab de Matemática": "Disponível"}
                    print("Disponibilidade dos laboratórios:")
                    for lab, status in laboratorios.items():
                        print(f"{lab}: {status}")
                elif opcao == 2:
                    labEscolhido = input("Digite o nome do laboratório que deseja agendar: ")
                    dataAgendamento = input("Digite a data e hora desejada (DD/MM/AAAA): ")
                    if labEscolhido and dataAgendamento:
                        if any(agendamento["laboratório"] == labEscolhido and agendamento["data"] == dataAgendamento for agendamento in agendamentos):
                            print("Desculpe, esse laboratório já está agendado para essa data e hora.")
                        else:
                            agendamentos.append({"laboratório": labEscolhido, "data": dataAgendamento})
                            print(f"Laboratório {labEscolhido} agendado para {dataAgendamento} com sucesso!")
            elif menu == 2:
                print("Eventos da Escola:")
                eventos = ["Feira de Ciências - 15/08/2025", "Semana Cultural - 01/09/2025", "Palestra Motivacional - 20/09/2025"]
                for evento in eventos:
                    print(f"- {evento}")
            elif menu == 3:
                print("Seus horários de aula nas turmas são:")
                horarios = {"Turma A": "Segunda e Quarta - 08:00 às 10:00", "Turma B": "Terça e Quinta - 10:00 às 12:00"}
                for turma, horario in horarios.items():
                    print(f"{turma}: {horario}")
            elif menu == 4:
                turmasProfessor = ["Turma A - Matemática", "Turma B - Ciências"]
                alunosProfessor = {"Turma A": ["Ana Silva", "Bruno Souza"], "Turma B": ["Carla Dias", "Daniel Lima"]}
                print("Suas turmas são:")
                for turma in turmasProfessor:
                    print(f"- {turma}")
                turmaEscolhida = input("Digite o nome da turma para ver os alunos: ")
                if turmaEscolhida in alunosProfessor:
                    print(f"Alunos da {turmaEscolhida}:")
                    for aluno in alunosProfessor[turmaEscolhida]:
                        print(f"- Nome: {aluno}")
                    print(" 1 - Notas
                            2 - Aulas")
                    escolha = int(input("Escolha uma opção: "))
                    if escolha == 1:
                        print(" 1 - Lançar notas
                                2 - Ver notas lançadas")
                        notaEscolha = int(input("Escolha uma opção: "))
                        if notaEscolha == 1:
                            alunoNome = input("Digite o nome do aluno: ").title()
                            notaValor = float(input("Digite a nota a ser lançada: "))
                            print(f"Nota {notaValor} lançada para o aluno {alunoNome} com sucesso!")
                        elif notaEscolha == 2:
                            notasLançadas = {"Ana Silva": 85, "Bruno Souza": 90}
                            print("Notas lançadas:")
                            for aluno, nota in notasLançadas.items():
                                print(f"{aluno}: {nota}")
                    elif escolha == 2:
                        print(" 1 - Nova aula
                                2 - Aulas ministradas")
                        aulaEscolha = int(input("Escolha uma opção: "))
                        if aulaEscolha == 1:
                            temaAula = input("Digite o tema da aula: ")
                            dataAula = input("Digite a data da aula (DD/MM/AAAA): ")
                            nomeFaltas = input("Digite os nomes dos alunos faltantes separados por vírgula: ").title().split(", ")
                            print(f"Aula sobre '{temaAula}' ministrada em {dataAula}.")
                            if nomeFaltas:
                                print("Alunos faltantes:")
                                for nome in nomeFaltas:
                                    print(f"- {nome}")
            elif menu == 5:
                aluno = input("Digite o nome ou código do aluno: ").title()
                motivoFIAP = input("Digite o motivo da FIAP: ")
                if aluno and motivoFIAP:
                    try:
                        aluno_int = int(aluno)  # Tentativa de converter para inteiro
                        print(f"FIAP registrada para o aluno com código {aluno_int} pelo motivo: {motivoFIAP}")
                    except ValueError:
                        print(f"FIAP registrada para o aluno {aluno} pelo motivo: {motivoFIAP}")
            elif menu == 6:
                print("Saindo do sistema. Até mais!")
                return
            else:
                os.system('cls')
                print("Opção inválida. Tente novamente.")

    def MenuGestor(nome):
        while True:
            print(f"Olá, {nome}! O que deseja fazer hoje?")
            print('''
                1 - Gerenciar Alunos 
                2 - Gerenciar Turmas
                3 - Gerenciar Professores
                4 - Controle de ponto
                5 - FIAP
                6 - Eventos da Escola
                7 - Sair''')
            menu = int(input("Escolha uma opção: "))
            if menu == 1:
                print(" 1 - Ver lista de alunos
                        2 - Adicionar aluno
                        3 - Remover aluno")
                escolha = int(input("Escolha uma opção: "))
                if escolha == 1:
                    if alunos:
                        print("Lista de alunos:")
                        for aluno in alunos:
                            print(f"- Nome: {aluno['nome']}, Responsável: {aluno['responsavel']}")
                    else:
                        print("Nenhum aluno cadastrado.")
                elif escolha == 2:
                    CriarDadosLogin()
                elif escolha == 3:
                    nomeAluno = input("Digite o nome do aluno a ser removido: ").title()
                    for aluno in alunos:
                        if aluno['nome'] == nomeAluno:
                            alunos.remove(aluno)
                            print(f"Aluno {nomeAluno} removido com sucesso!")
                            break
                    else:
                        print("Aluno não encontrado.")
            elif menu == 2:
                print(" 1 - Ver lista de turmas
                        2 - Adicionar turma
                        3 - Remover turma")
                escolha = int(input("Escolha uma opção: "))
                if escolha == 1:
                    if turmas:
                        print("Lista de turmas:")
                        for turma in turmas:
                            print(f"- {turma}")
                    else:
                        print("Nenhuma turma cadastrada.")
                elif escolha == 2:
                    nomeTurma = input("Digite o nome da nova turma: ")
                    turmas.append(nomeTurma)
                    print(f"Turma {nomeTurma} adicionada com sucesso!")
                    print("Digite o professor(es) responsável por essa turma:")
                    professoresTurma = input("Nomes dos professores separados por vírgula: ").title().split(", ")
                    print(f"Professores {', '.join(professoresTurma)} atribuídos à turma {nomeTurma}.")
                elif escolha == 3:
                    nomeTurma = input("Digite o nome da turma a ser removida: ")
                    if nomeTurma in turmas:
                        turmas.remove(nomeTurma)
                        print(f"Turma {nomeTurma} removida com sucesso!")
                    else:
                        print("Turma não encontrada.")
            elif menu == 3:
                print(" 1 - Ver lista de professores
                        2 - Adicionar professor
                        3 - Remover professor")
                escolha = int(input("Escolha uma opção: "))
                if escolha == 1:
                    if professores:
                        print("Lista de professores:")
                        for professor in professores:
                            print(f"- Nome: {professor['nome']}, Disciplina: {professor['disciplina']}")
                    else:
                        print("Nenhum professor cadastrado.")
                elif escolha == 2:
                    CriarDadosLogin()
                elif escolha == 3:
                    nomeProfessor = input("Digite o nome do professor a ser removido: ").title()
                    for professor in professores:
                        if professor['nome'] == nomeProfessor:
                            professores.remove(professor)
                            print(f"Professor {nomeProfessor} removido com sucesso!")
                            break
                    else:
                        print("Professor não encontrado.")
            elif menu == 4:
                print(" 1 - Registrar ponto de entrada
                        2 - Registrar ponto de saída")
                escolha = int(input("Escolha uma opção: "))
                if escolha == 1:
                    nomeFuncionario = input("Digite o nome do funcionário: ").title()
                    horaEntrada = input("Digite a hora de entrada (HH:MM): ")
                    print(f"Ponto de entrada registrado para {nomeFuncionario} às {horaEntrada}.")
                elif escolha == 2:
                    nomeFuncionario = input("Digite o nome do funcionário: ").title()
                    horaSaida = input("Digite a hora de saída (HH:MM): ")
                    print(f"Ponto de saída registrado para {nomeFuncionario} às {horaSaida}.")
            elif menu == 5:
                print(" 1 - Ver FIAPs registradas
                        2 - Resolver FIAP")
                escolha = int(input("Escolha uma opção: "))
                if escolha == 1:
                    fiapsRegistradas = [{"aluno": "Ana Silva", "motivo": "Atraso"}, {"aluno": "Bruno Souza", "motivo": "Falta não justificada"}]
                    if fiapsRegistradas:
                        print("FIAPs registradas:")
                        for fiap in fiapsRegistradas:
                            print(f"- Aluno: {fiap['aluno']}, Motivo: {fiap['motivo']}")
                    else:
                        print("Nenhuma FIAP registrada.")
                elif escolha == 2:
                    nomeAluno = input("Digite o nome do aluno cuja FIAP deseja resolver: ").title()
                    for fiap in fiapsRegistradas:
                        if fiap['aluno'] == nomeAluno:
                            fiapsRegistradas.remove(fiap)
                            print(f"FIAP do aluno {nomeAluno} resolvida com sucesso!")
                            break
                    else:
                        print("FIAP não encontrada para esse aluno.")
            elif menu == 6:
                print(" 1 - Ver eventos da escola
                        2 - Adicionar evento
                        3 - Remover evento")
                escolha = int(input("Escolha uma opção: "))
                if escolha == 1:
                    eventos = ["Feira de Ciências - 15/08/2025", "Semana Cultural - 01/09/2025", "Palestra Motivacional - 20/09/2025"]
                    print("Eventos da escola:")
                    for evento in eventos:
                        print(f"- {evento}")
                elif escolha == 2:
                    nomeEvento = input("Digite o nome do evento: ")
                    dataEvento = input("Digite a data do evento (DD/MM/AAAA): ")
                    print(f"Evento '{nomeEvento}' adicionado para a data {dataEvento}.")
                elif escolha == 3:
                    nomeEvento = input("Digite o nome do evento a ser removido: ")
                    print(f"Evento '{nomeEvento}' removido com sucesso.")
            elif menu == 7:
                print("Saindo do sistema. Até mais!")
                return
            else:
                os.system('cls')
                print("Opção inválida. Tente novamente.")`,
    PyMain: `
    import os
    from autenticacao import AutenticaUsuario
    from usuario import FinalizarCadastro, MenuAluno, MenuGestor, MenuProfessor

    sucesso, cargo = AutenticaUsuario()

    def main():
        if sucesso:
            nome = FinalizarCadastro(cargo)
            os.system('cls')
            print("=== Gestão Educacional ConEduc ===")
            print("Tornando a educação um processo automatizado em dobro!")

            try:
                if cargo == 1:
                    MenuAluno(nome)
                elif cargo == 2:
                    MenuProfessor(nome)
                elif cargo == 3:
                    MenuGestor(nome)
                else:
                    print("Este cargo não existe. Algo deu errado.")
            except KeyboardInterrupt:
                while True:
                    try:
                        print("Olá. Você entrou secreto do sistema. Esse modo não existirá na versão final e foi criado apenas para testes internos do mockup.")
                        cargo_teste = int(input("Digite o cargo que deseja testar (1 - Aluno/Responsável, 2 - Professor, 3 - Gestor): "))
                        if cargo_teste == 1:
                            MenuAluno(nome)
                        elif cargo_teste == 2:
                            MenuProfessor(nome)
                        elif cargo_teste == 3:
                            MenuGestor(nome)
                    except KeyboardInterrupt:
                        print("Saindo do modo de teste secreto.")
                        break
        
    if __name__ == "__main__":
        main()`
}