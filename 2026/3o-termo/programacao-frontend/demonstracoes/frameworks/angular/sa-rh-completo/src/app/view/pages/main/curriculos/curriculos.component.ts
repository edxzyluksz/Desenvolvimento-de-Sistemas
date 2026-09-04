import { Component, inject, ChangeDetectorRef } from '@angular/core';
import { CurriculoService } from '../../../../service/curriculo.service';
import { Curriculo } from '../../../../model/curriculo.model';
import { CommonModule } from '@angular/common';
import { MatSnackBarModule, MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-curriculos',
  imports: [CommonModule, MatSnackBarModule],
  templateUrl: './curriculos.component.html',
  styleUrl: './curriculos.component.scss',
})
export class CurriculosComponent {
  public curriculoEncontrado: Curriculo | null = null;
  public isLoading: boolean = false;

  private _curriculoService = inject(CurriculoService);
  private _snackBar = inject(MatSnackBar);
  private cdr = inject(ChangeDetectorRef);

  buscarCurriculo(id: string): void {
    if (!id.trim()) return;

    this.isLoading = true;
    this.curriculoEncontrado = null;
    this.cdr.detectChanges(); // Força a tela a mostrar o spinner na hora

    this._curriculoService.getCurriculoPorId(id).subscribe({
      next: (resposta) => {
        this.curriculoEncontrado = Curriculo.fromMap(resposta);
        this.isLoading = false;
        this.cdr.detectChanges(); // Força a tela a esconder o spinner e mostrar o card
      },
      error: (erro) => {
        this._snackBar.open('Currículo não encontrado!', 'Fechar', {
          duration: 3000,
          horizontalPosition: 'center',
          verticalPosition: 'top',
        });
        this.curriculoEncontrado = null;
        this.isLoading = false;
        this.cdr.detectChanges(); // Força a tela a esconder o spinner mesmo dando erro
      },
    });
  }
}
