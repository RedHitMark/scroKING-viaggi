import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientiDetailComponent } from './clienti-detail.component';

describe('ClientiDetailComponent', () => {
  let component: ClientiDetailComponent;
  let fixture: ComponentFixture<ClientiDetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ClientiDetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ClientiDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
