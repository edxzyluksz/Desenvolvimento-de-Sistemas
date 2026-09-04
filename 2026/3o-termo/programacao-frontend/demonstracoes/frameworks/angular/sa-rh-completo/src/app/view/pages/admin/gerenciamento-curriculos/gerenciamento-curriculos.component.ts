import { Component, OnInit, inject, ChangeDetectorRef } from '@angular/core';
import { Curriculo } from '../../../../model/curriculo.model';
import { CurriculoService } from '../../../../service/curriculo.service';
import { MatSnackBarModule, MatSnackBar } from '@angular/material/snack-bar';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-gerenciamento-curriculos',
  imports: [FormsModule, MatSnackBarModule],
  templateUrl: './gerenciamento-curriculos.component.html',
  styleUrl: './gerenciamento-curriculos.component.scss',
})
export class GerenciamentoCurriculosComponent implements OnInit {
  public curriculo: Curriculo = new Curriculo('0', '', '', '', '', '', '', '');
  public curriculos: Curriculo[] = [];

  private _apiService = inject(CurriculoService);
  private _snackBar = inject(MatSnackBar);
  private cdr = inject(ChangeDetectorRef);

  ngOnInit(): void {
    this.listarCurriculos();
  }

  listarCurriculos(): void {
    this._apiService.getCurriculos().subscribe((resposta) => {
      this.curriculos = resposta.map((e) => Curriculo.fromMap(e));
      this.cdr.detectChanges();
    });
  }

  cadastrarCurriculo(): void {
    if (
      this.curriculo.nome === '' ||
      this.curriculo.email === '' ||
      this.curriculo.formacao === '' ||
      this.curriculo.experiencia === '' ||
      this.curriculo.habilidades === ''
    ) {
      this._snackBar.open('Preencha os campos principais para cadastrar', 'Fechar', {
        duration: 3000,
      });
      return;
    }

    const curriculoDuplicado = this.curriculos.find(
      (c) =>
        c.email.trim().toLowerCase() === this.curriculo.email.trim().toLowerCase() ||
        c.userId.trim() === this.curriculo.userId.trim(),
    );

    if (curriculoDuplicado) {
      this._snackBar.open(
        'Bloqueado: Já existe um currículo com este E-mail ou ID de Usuário!',
        'Entendi',
        {
          duration: 4500,
          horizontalPosition: 'center',
          verticalPosition: 'bottom',
        },
      );
      return;
    }

    this._apiService.postCurriculo(this.curriculo).subscribe(() => {
      this.curriculo = new Curriculo('0', '', '', '', '', '', '', '');
      this.listarCurriculos();
      this._snackBar.open('Currículo Cadastrado com Sucesso!', 'OK', {
        duration: 3000,
        horizontalPosition: 'center',
        verticalPosition: 'bottom',
      });
    });
  }

  listarCurriculoUnico(curriculo: Curriculo) {
    this.curriculo = new Curriculo(
      curriculo.id,
      curriculo.userId,
      curriculo.nome,
      curriculo.email,
      curriculo.formacao,
      curriculo.experiencia,
      curriculo.habilidades,
      curriculo.linkedin,
    );
  }

  atualizarCurriculo(id: any): void {
    this._apiService.putCurriculo(id, this.curriculo).subscribe(() => {
      this.curriculo = new Curriculo('0', '', '', '', '', '', '', '');
      this.listarCurriculos();
      this._snackBar.open('Currículo Atualizado com Sucesso!', 'OK', {
        duration: 3000,
        horizontalPosition: 'center',
        verticalPosition: 'bottom',
      });
    });
  }

  removerCurriculo(id: any): void {
    this._apiService.deleteCurriculo(id).subscribe(() => {
      this.curriculo = new Curriculo('0', '', '', '', '', '', '', '');
      this.listarCurriculos();
      this._snackBar.open('Currículo Excluído com Sucesso!', 'OK', {
        duration: 3000,
        horizontalPosition: 'center',
        verticalPosition: 'bottom',
      });
    });
  }
}
