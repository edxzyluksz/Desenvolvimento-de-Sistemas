import { Component, OnInit } from '@angular/core';
import { VagaService } from '../../../../service/vaga.service';
import { Vaga } from '../../../../model/vaga.model';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-vagas',
  imports: [CommonModule],
  templateUrl: './vagas.component.html',
  styleUrl: './vagas.component.scss',
})
export class VagasComponent implements OnInit {
  //atributos
  //vetor para armazenar as vagas
  public vagas: Vaga[] = [];

  constructor(private _apiService: VagaService) {} // ao criar abrir a página , estabelce conexão com a API

  ngOnInit(): void {
    this.listarVagas();
  }

  // método para Listar as Vagas (Controller)
  listarVagas(): void {
    this._apiService.getVagas().subscribe((retornaVagas) => {
      this.vagas = retornaVagas.map((e) => {
        return new Vaga(e.id, e.nome, e.foto, e.descricao, e.salario);
      }); // armazena o conteúdo retornado da API no vetor de vagas
    });
  }
}
