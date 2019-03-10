import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViaggioFormComponent } from './viaggio-form.component';

describe('ViaggioFormComponent', () => {
  let component: ViaggioFormComponent;
  let fixture: ComponentFixture<ViaggioFormComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViaggioFormComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViaggioFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
