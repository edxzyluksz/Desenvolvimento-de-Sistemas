import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Vaga } from '../model/vaga.model';

@Injectable({
  providedIn: 'root',
})
export class VagaService {

  // Endereço de conexão da api
  private apiUrl = 'http://localhost:3008/vagas'; // Caminho da API

  constructor(private http: HttpClient) {}

  // Métodos de Conexão da API (GET, POST, PUT, DELETE)

  // GET - READ
  getVagas(): Observable<Vaga[]> {
    // Observable => Permite conexões assíncronas com a API
    return this.http.get<Vaga[]>(this.apiUrl); // Conecta na API e retorna o conteúdo no vetor de Vagas
  }

  // POST - CREATE
  postVaga(vaga: Vaga): Observable<Vaga> {
    return this.http.post<Vaga>(this.apiUrl, vaga); // Passa o link da conexão e o valor vaga
  }

  // PUT - UPDATE
  putVaga(id: any, vaga: Vaga): Observable<Vaga> {
    // Para atualizar precisa passar o id
    const UrlAtualizado = `${this.apiUrl}/${id}`; // http://localhost:3000/vagas/id
    return this.http.put<Vaga>(UrlAtualizado, vaga);
  }

  // DELETE
  deleteVaga(id: any): Observable<void> {
    // Para deletar precisa passar o id
    const urlDeletar = `${this.apiUrl}/${id}`;
    return this.http.delete<void>(urlDeletar);
  }
}
