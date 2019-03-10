import { TestBed } from '@angular/core/testing';

import { PrenotazioniService } from './prenotazioni.service';

describe('PrenotazioniService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: PrenotazioniService = TestBed.get(PrenotazioniService);
    expect(service).toBeTruthy();
  });
});
