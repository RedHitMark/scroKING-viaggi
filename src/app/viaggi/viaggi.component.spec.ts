import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViaggiComponent } from './viaggi.component';

describe('ViaggiComponent', () => {
  let component: ViaggiComponent;
  let fixture: ComponentFixture<ViaggiComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViaggiComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViaggiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
