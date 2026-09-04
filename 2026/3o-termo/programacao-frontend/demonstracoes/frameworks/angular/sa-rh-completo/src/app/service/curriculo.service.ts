import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Curriculo } from '../model/curriculo.model';

@Injectable({
  providedIn: 'root',
})

export class CurriculoService {
  private url = 'http://localhost:3008/curriculos';

  constructor(private _httpClient: HttpClient) {}

  getCurriculos(): Observable<any[]> {
    return this._httpClient.get<any[]>(this.url);
  }

  // Buscar um currículo específico pelo ID (usado na pesquisa)
  getCurriculoPorId(id: string): Observable<any> {
    return this._httpClient.get<any>(`${this.url}/${id}`);
  }

  postCurriculo(curriculo: Curriculo): Observable<any> {
    return this._httpClient.post<any>(this.url, curriculo.toMap());
  }

  putCurriculo(id: string, curriculo: Curriculo): Observable<any> {
    return this._httpClient.put<any>(`${this.url}/${id}`, curriculo.toMap());
  }

  deleteCurriculo(id: string): Observable<any> {
    return this._httpClient.delete<any>(`${this.url}/${id}`);
  }
}
