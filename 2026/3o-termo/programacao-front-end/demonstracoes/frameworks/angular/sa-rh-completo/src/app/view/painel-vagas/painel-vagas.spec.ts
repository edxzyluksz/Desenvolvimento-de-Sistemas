import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PainelVagas } from './painel-vagas';

describe('PainelVagas', () => {
  let component: PainelVagas;
  let fixture: ComponentFixture<PainelVagas>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PainelVagas],
    }).compileComponents();

    fixture = TestBed.createComponent(PainelVagas);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
