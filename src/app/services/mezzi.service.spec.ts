import { TestBed } from '@angular/core/testing';

import { MezziService } from './mezzi.service';

describe('MezziService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: MezziService = TestBed.get(MezziService);
    expect(service).toBeTruthy();
  });
});
