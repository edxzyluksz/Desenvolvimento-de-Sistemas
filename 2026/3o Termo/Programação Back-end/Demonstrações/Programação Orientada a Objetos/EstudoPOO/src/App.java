import view.CursoView;

public class App {
    public static void main(String[] args) throws Exception {
        
        // Instanciando os objetos das classes
        // 'Pessoa' é uma classe abstrata, portanto não poderá ser instanciada diretamente.
        // Pessoa pes1 = new Pessoa("Fulano", "123.456.789-00", "10/10/1910");
        // pes1.exibirInfo();

        new CursoView().menu();
    }
}
