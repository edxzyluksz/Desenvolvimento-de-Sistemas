export class Curriculo {
  constructor(
    public id: string,
    public userId: string,
    public nome: string,
    public email: string,
    public formacao: string,
    public experiencia: string,
    public habilidades: string,
    public linkedin: string,
  ) {}

  toMap(): { [key: string]: any } {
    return {
      id: this.id,
      userId: this.userId,
      nome: this.nome,
      email: this.email,
      formacao: this.formacao,
      experiencia: this.experiencia,
      habilidades: this.habilidades,
      linkedin: this.linkedin
    };
  }
  
  static fromMap(map: any): Curriculo {
    return new Curriculo(
      map.id, map.userId, map.nome, map.email,
      map.formacao, map.experiencia,
      map.habilidades, map.linkedin
    );
  }
}
