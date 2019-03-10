import { TestBed } from '@angular/core/testing';

import { SoggiorniService } from './soggiorni.service';

describe('SoggiorniService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: SoggiorniService = TestBed.get(SoggiorniService);
    expect(service).toBeTruthy();
  });
});
