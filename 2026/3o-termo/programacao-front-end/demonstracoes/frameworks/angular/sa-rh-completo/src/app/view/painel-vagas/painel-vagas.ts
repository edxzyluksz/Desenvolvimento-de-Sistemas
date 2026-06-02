import { Component } from '@angular/core';
import { Vaga } from '../../model/vaga.model';
import { Api } from '../../service/api';

@Component({
  selector: 'app-painel-vagas',
  imports: [],
  templateUrl: './painel-vagas.html',
  styleUrl: './painel-vagas.scss',
})
export class PainelVagas {
  // Terminar de fazer o CRUD

  // Limpar dados do formulário
  public vaga: Vaga = new Vaga(0, '', '', '', 0); // Interpolação de Dados do Formulário

  // Armazenar as informações da API
  public vagas: Vaga[] = [];

  constructor(private _apiService: Api) {} // Estabelece a conexão quando a página abrir

  ngOnInit(): void {
    this.listarVagas();
  }

  listarVagas(): void {
    this._apiService.getVagas().subscribe((retornaVagas) => {
      this.vagas = retornaVagas.map((e) => {
        return new Vaga(e.id, e.nome, e.foto, e.descricao, e.salario);
      }); // armazena o conteúdo retornado da API no vetor de vagas
    });
  }

  // Cadastrar Vaga
  cadastrarVaga(vaga: Vaga): void {
    this._apiService.cadastrarVaga(this.vaga).subscribe(
      () => {
        this.vaga = new Vaga(0, "", "", "", 0);
        this.listarVagaUnica(this.vaga); // Atualizar a vaga com as informações
        alert("Vaga Cadastrada com Sucesso!");
      }, (error) => {console.error("Exception: ", error)}
    );
  }

  listarVagaUnica(vaga: Vaga){
    this.vaga = vaga;
  }

  // Atualizar Vaga
  atualizarVaga(vaga: Vaga, id: any): void {
    this._apiService.atualizarVaga().subscribe(

    )
  }

  // Deletar Vaga
  removerVaga(vaga: Vaga, id: any):void {
    this._apiService.removerVaga().subscribe(

    )
  }
}
