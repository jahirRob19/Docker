// src/lib/suma.test.ts
import { describe, it, expect } from 'vitest';
import { suma } from './suma';

describe('suma()', () => {
  it('debería retornar 5 para 2 + 3', () => {
    expect(suma(2, 3)).toBe(5);
  });

  it('debería retornar 0 para -2 + 2', () => {
    expect(suma(-2, 2)).toBe(0);
  });
});
