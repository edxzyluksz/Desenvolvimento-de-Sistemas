import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Contato } from './contato';

describe('Contato', () => {
  let component: Contato;
  let fixture: ComponentFixture<Contato>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Contato],
    }).compileComponents();

    fixture = TestBed.createComponent(Contato);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
