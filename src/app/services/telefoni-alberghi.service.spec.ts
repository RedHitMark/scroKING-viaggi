import { TestBed } from '@angular/core/testing';

import { TelefoniAlberghiService } from './telefoni-alberghi.service';

describe('TelefoniAlberghiService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: TelefoniAlberghiService = TestBed.get(TelefoniAlberghiService);
    expect(service).toBeTruthy();
  });
});
