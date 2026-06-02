export class Vaga {
  // //atributos
  // id: number = 0;
  // nome: string = "";
  // foto: string = "";
  // descricao: string = "";
  // salario: number = 0;

  // //construtor
  // constructor(id:number, nome:string, foto:string, descricao:string, salario:number){
  //   this.id = id,
  //   this.nome = nome,
  //   this.foto = foto,
  //   this.descricao = descricao,
  //   this.salario = salario
  // }

  //Construtor Encurtado =>
  constructor(
    public id: number,
    public nome: string,
    public foto: string,
    public descricao: string,
    public salario: number,
  ) {}

  //métodos
  // Mapeamento de Dados da API (toMap e fromMap)
  // to MAp OBJ => API
  toMap(): { [key: string]: any } {
    return {
      id: this.id,
      nome: this.nome,
      foto: this.foto,
      descricao: this.descricao,
      salario: this.salario,
    };
  }

  // FromMAp = API => OBJ
  fromMap(map: any): Vaga {
    return new Vaga(map.id, map.nome, map.foto, map.descricao, map.salario);
  }
}
