import { Component, OnInit } from '@angular/core';
import { Api } from '../../service/api';
import { Vaga } from '../../model/vaga.model';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-vagas',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './vagas.html',
  styleUrl: './vagas.scss',
})
export class Vagas implements OnInit {
  //atributos
  //vetor para armazenar as vagas
  public vagas: Vaga[] = [];

  constructor(private _apiService: Api) {} // ao criar abrir a página , estabelce conexão com a API

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
