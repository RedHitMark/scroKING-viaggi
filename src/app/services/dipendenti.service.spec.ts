import { TestBed } from '@angular/core/testing';

import { DipendentiService } from './dipendenti.service';

describe('DipendentiService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: DipendentiService = TestBed.get(DipendentiService);
    expect(service).toBeTruthy();
  });
});
