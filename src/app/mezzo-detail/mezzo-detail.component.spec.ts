import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MezzoDetailComponent } from './mezzo-detail.component';

describe('MezzoDetailComponent', () => {
  let component: MezzoDetailComponent;
  let fixture: ComponentFixture<MezzoDetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MezzoDetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MezzoDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
