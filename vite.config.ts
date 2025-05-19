import { sveltekit } from '@sveltejs/kit/vite';
<<<<<<< HEAD
import { defineConfig } from 'vitest/config';

export default defineConfig({
  plugins: [sveltekit()],
  test: {
    globals: true,
    environment: 'jsdom',
    coverage: {
      reporter: ['text', 'json', 'html'],
      include: ['src/**/*.{ts,js,svelte}']
    }
  }
=======
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [sveltekit()]
>>>>>>> 56fc7ca50928c5695b9926dc53084eda604f2457
});
