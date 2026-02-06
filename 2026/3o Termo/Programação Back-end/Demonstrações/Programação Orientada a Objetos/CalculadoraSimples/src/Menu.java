import java.util.Scanner;

public class Menu {
    // Atributos
    double num1, num2, resultado;
    String operacao;
    boolean continuar = true;

    Scanner sc = new Scanner(System.in);
    // Métodos
    public void calculadora(){
        // Para usar a calculadora - biblioteca de Scanner
        // Usar um laço de repetição
        do {
            System.out.println("=== Calculadora Simples ===");
            System.out.println("=== Escolha uma operação ===");
            System.out.println("1. Soma");
            System.out.println("2. Subtração");
            System.out.println("3. Multiplicação");
            System.out.println("4. Divisão");
            System.out.println("5. Soma de 3 Números");
            System.out.println("6. Raiz quadrada");
            System.out.println("7. Potência");
            System.out.println("8. Sair");
            System.out.println("============================");
            
            // Lê o que o usuário digita
            operacao = sc.next();

            // Escolhi a operacção -> Decisão
            Calculos cl = new Calculos();

            if (operacao.equals("8")) {
                    System.out.println("Entendido. Até mais!");
                    continuar = false;
            }
            else {
                if (!operacao.equals("6")) {
                    digiteNumeros();
                }

                switch (operacao) {
                    case "1":
                        resultado = cl.soma(num1, num2);
                        mostrarResultado(resultado);
                        break;
                    case "2":
                        resultado = cl.subtracao(num1, num2);
                        mostrarResultado(resultado);
                        break;
                    case "3":
                        resultado = cl.multi(num1, num2);
                        mostrarResultado(resultado);
                        break;
                    case "4":
                        if (num2 == 0){ // Tratativa de erro
                            System.out.println("Erro: Impossível dividir por 0.");
                        } else {
                        resultado = cl.divisao(num1, num2);
                        mostrarResultado(resultado);
                        }
                        break;
                    case "5":
                        double num3;
                        System.out.println("Informe o Nº 3");
                        num3 = sc.nextDouble();
                        resultado = cl.soma3(num1, num2, num3);
                        mostrarResultado(resultado);
                        break;
                    case "6": // Exceção
                        // Só precisa de um Nº
                        System.out.println("Digite o nº");
                        num1 = sc.nextDouble();
                        resultado = cl.raiz(num1);
                        mostrarResultado(resultado);
                        break;
                    case "7":
                        resultado = cl.expoent(num1, num2);
                        mostrarResultado(resultado);
                        break;
                    default:
                        System.out.println("Tente digitar uma das opções apresentadas.");
                        break;
                }

                System.out.println("Deseja continuar os cálculos? / 1 - Sim | 2 - Não");
                String decisao;
                decisao = sc.next();
                if (decisao.equals("2")) {
                    continuar = false;
                    System.out.println("Obrigado por usar!");
                }
                else {
                    System.out.println("Continuando a execução...");
                }
            }
        } while (continuar);
        sc.close();
    }
    
    public void digiteNumeros(){
        System.out.println("Informe o Nº 1");
        num1 = sc.nextDouble();
        System.out.println("Informe o Nº 2");
        num2 = sc.nextDouble();
    }

    public double mostrarResultado(double resultado){
        System.out.println("\nO resultado da conta é " + resultado);
        return resultado;
    }
}
