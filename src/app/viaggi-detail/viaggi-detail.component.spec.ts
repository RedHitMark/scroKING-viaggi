import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViaggiDetailComponent } from './viaggi-detail.component';

describe('ViaggiDetailComponent', () => {
  let component: ViaggiDetailComponent;
  let fixture: ComponentFixture<ViaggiDetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViaggiDetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViaggiDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
