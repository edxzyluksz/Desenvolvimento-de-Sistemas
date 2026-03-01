import model.Pessoa;

public class App {
    public static void main(String[] args) throws Exception {
        // Aqui eu executo as ações
        // Vamos 'instanciar' (criar) um objeto da classe Pessoa
        Pessoa obj = new Pessoa("123", "Kyryll Chudomirovich Flins", 30);
        obj.setIdade(100);
        System.out.println("Nome da pessoa: " + obj.getNome());
        System.out.println("Idade da pessoa: " + obj.getIdade());    }
}
