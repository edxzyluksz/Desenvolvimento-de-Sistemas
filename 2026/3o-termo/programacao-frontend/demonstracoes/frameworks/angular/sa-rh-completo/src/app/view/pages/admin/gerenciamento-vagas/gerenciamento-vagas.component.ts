import { Component, OnInit, inject, ChangeDetectorRef } from '@angular/core';
import { Vaga } from '../../../../model/vaga.model';
import { VagaService } from '../../../../service/vaga.service';
import { FormsModule } from '@angular/forms';
import { MatSnackBarModule, MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-painel-vagas',
  imports: [FormsModule, MatSnackBarModule],
  templateUrl: './gerenciamento-vagas.component.html',
  styleUrl: './gerenciamento-vagas.component.scss',
})
export class PainelVagasComponent implements OnInit {
  public vaga: Vaga = new Vaga('0', '', '', '', 0);
  public vagas: Vaga[] = [];

  private _apiService = inject(VagaService);
  private _snackBar = inject(MatSnackBar);
  private cdr = inject(ChangeDetectorRef); // A Bala de Prata

  ngOnInit(): void {
    this.listarVagas();
  }

  listarVagas(): void {
    this._apiService.getVagas().subscribe((resposta) => {
      this.vagas = resposta.map((e) => new Vaga(e.id, e.nome, e.foto, e.descricao, e.salario));
      this.cdr.detectChanges(); // Avisa o HTML que a lista foi alterada!
    });
  }

  cadastrarVaga(): void {
    if (
      this.vaga.nome === '' ||
      this.vaga.descricao === '' ||
      this.vaga.foto === '' ||
      this.vaga.salario === 0
    ) {
      this._snackBar.open('Preencha todos os campos para cadastrar', 'Fechar', { duration: 3000 });
      return;
    }

    this._apiService.postVaga(this.vaga).subscribe(() => {
      this.vaga = new Vaga('0', '', '', '', 0);
      this.listarVagas();
      this._snackBar.open('Vaga Cadastrada com Sucesso!', 'OK', {
        duration: 3000,
        horizontalPosition: 'center',
        verticalPosition: 'bottom',
      });
    });
  }

  listarVagaUnica(vaga: Vaga) {
    this.vaga = new Vaga(vaga.id, vaga.nome, vaga.foto, vaga.descricao, vaga.salario);
  }

  atualizarVaga(id: any): void {
    this._apiService.putVaga(id, this.vaga).subscribe(() => {
      this.vaga = new Vaga('0', '', '', '', 0);
      this.listarVagaUnica(this.vaga);
      this.listarVagas();
      this._snackBar.open('Vaga Atualizada com Sucesso!', 'OK', {
        duration: 3000,
        horizontalPosition: 'center',
        verticalPosition: 'bottom',
      });
    });
  }

  removerVaga(id: any): void {
    this._apiService.deleteVaga(id).subscribe(() => {
      this.vaga = new Vaga('0', '', '', '', 0);
      this.listarVagas();
      this._snackBar.open('Vaga Excluída com Sucesso!', 'OK', {
        duration: 3000,
        horizontalPosition: 'center',
        verticalPosition: 'bottom',
      });
    });
  }
}
