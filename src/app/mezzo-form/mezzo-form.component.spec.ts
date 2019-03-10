import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MezzoFormComponent } from './mezzo-form.component';

describe('MezzoFormComponent', () => {
  let component: MezzoFormComponent;
  let fixture: ComponentFixture<MezzoFormComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MezzoFormComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MezzoFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
