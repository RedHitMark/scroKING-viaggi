import { TestBed } from '@angular/core/testing';

import { ClientiService } from './clienti.service';

describe('ClientiService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ClientiService = TestBed.get(ClientiService);
    expect(service).toBeTruthy();
  });
});
