import { TestBed } from '@angular/core/testing';

import { ViaggiService } from './viaggi.service';

describe('ViaggiService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ViaggiService = TestBed.get(ViaggiService);
    expect(service).toBeTruthy();
  });
});
