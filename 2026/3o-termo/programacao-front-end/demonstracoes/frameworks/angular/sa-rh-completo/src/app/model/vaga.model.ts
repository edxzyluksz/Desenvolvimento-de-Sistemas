export class Vaga {
  // Construtor Encurtado
  constructor(
    public id: string,
    public nome: string,
    public foto: string,
    public descricao: string,
    public salario: number,
  ) {}

  // Métodos
  // Mapeamento de Dados da API (toMap e fromMap)
  // toMap OBJ => API
  toMap(): { [key: string]: any } {
    return {
      id: this.id,
      nome: this.nome,
      foto: this.foto,
      descricao: this.descricao,
      salario: this.salario,
    };
  }

  // FromMap = API => OBJ
  fromMap(map: any): Vaga {
    return new Vaga(map.id, map.nome, map.foto, map.descricao, map.salario);
  }
}
