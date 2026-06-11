import { Component } from '@angular/core';
import { Vaga } from '../../../model/vaga.model';
import { Api } from '../../../service/api';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-painel-vagas',
  imports: [FormsModule],
  templateUrl: './painel-vagas.html',
  styleUrl: './painel-vagas.scss',
})
export class PainelVagas {
  // Terminar de fazer o CRUD

  // Limpar dados do formulário
  public vaga: Vaga = new Vaga('0', '', '', '', 0); // Interpolação de Dados do Formulário

  // Armazenar as informações da API
  public vagas: Vaga[] = [];

  constructor(private _apiService: Api) {} // Estabelece a conexão quando a página abrir

  ngOnInit(): void {
    this.listarVagas();
  }

  listarVagas(): void {
    this._apiService.getVagas().subscribe(
      (resposta) => {
        this.vagas = resposta.map((e) => new Vaga(e.id, e.nome, e.foto, e.descricao, e.salario));
      },
    );
  }

  // Cadastrar Vaga
  cadastrarVaga(): void {
    if (
      this.vaga.nome === '' ||
      this.vaga.descricao === '' ||
      this.vaga.foto === '' ||
      this.vaga.salario === 0
    ) {
      alert('Preencha todos os campos para cadastrar a vaga');
      return;
    }
    console.log(this.vaga);
    this._apiService.cadastrarVaga(this.vaga).subscribe(() => {
      this.vaga = new Vaga("0", '', '', '', 0); //limpa o formulário
      this.listarVagas(); //atualiza a lista de vagas
      alert('Vaga Cadastrada com Sucesso');
    });
  }

  listarVagaUnica(vaga: Vaga) {
    this.vaga = vaga;
  }

  // Atualizar Vaga
  atualizarVaga(id: any): void {
    this._apiService.atualizarVaga(id, this.vaga).subscribe(() => {
      this.vaga = new Vaga('0', '', '', '', 0); // Criar um objeto vazio
      this.listarVagaUnica(this.vaga);
      alert('Vaga Atualizada com Sucesso!');
    });
  }

  // Deletar Vaga
  removerVaga(id: any): void {
    this._apiService.removerVaga(id).subscribe(() => {
      this.vaga = new Vaga('0', '', '', '', 0); // Criar um objeto vazio
      this.listarVagas(); // atualiza a lista de vagas
      alert('Vaga Excluída com Sucesso!');
    });
  }
}
