public class Calculos {
    // Classe para criar os cálculos

    // Métodos

    // Soma
    public double soma(double a, double b) {
        return a+b;
    }
    // Subtração
    public double subtracao(double a, double b) {
        return a-b;
    }
    // Divisão
    public double divisao(double a, double b) {
        return a/b;
    }
    // Multiplicação
    public double multi(double a, double b) {
        return a*b;
    }

    public double soma3(double a, double b, double c){
        return a + b + c;
    }

    public double raiz(double a) {
        return Math.sqrt(a);
    }

    public double expoent(double a, double b){
        double resultado = 1;
        for (int i = 1; i <= b; i++){
            resultado = resultado * a;
        }
        return resultado;
    }
}
