import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientiComponent } from './clienti.component';

describe('ClientiComponent', () => {
  let component: ClientiComponent;
  let fixture: ComponentFixture<ClientiComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ClientiComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ClientiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
