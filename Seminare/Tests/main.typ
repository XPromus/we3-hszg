#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()
#codly(languages: codly-languages)

= Frontend Tests

== Vitest
#link("https://vitest.dev/guide/")[https://vitest.dev/guide/]

1. Install the packages
```bash
bun install @types/node jsdom @testing-library/jest-dom @testing-library/svelte @testing-library/user-event @vitest/ui jdom vitest
```
2. Add Scripts to `package.json`
```json
{
  "scripts": {
    "test": "vitest run",
    "test:ui": "vitest --ui",
    "test:watch": "vitest"
  }
}
```
3. Add configuration to `tsconfig.json`
```json
{
  "compilerOptions": {
    "types": ["@testing-library/jest-dom"]
  }
}
```
4. Add configuration to `vite.config.ts`
```ts
import { svelteTesting } from '@testing-library/svelte/vite';

export default defineConfig({
  test: {
    environment: "jsdom",
    setupFiles: ["./vitest-setup.js"],
  }
});
```
5. Create `vitest-setup.js` in project root and add configuration
```js
import '@testing-library/jest-dom/vitest'
```
6. Write tests
7. Execute tests
```bash
bun run test:ui
```

#pagebreak()
== Cypress
#link("https://docs.cypress.io/app/get-started/why-cypress")[https://docs.cypress.io/app/get-started/why-cypress]

1. Install the packages
```bash
bun install cypress
```
2. Add configuration to `tsconfig.json`
```json
{
  "compilerOptions": {
    "types": [
			"cypress"
		]
  },
	"include": ["**/*.*"]
}
```
3. Add configuration to `vite.config.ts`
```ts
import { svelteTesting } from '@testing-library/svelte/vite';

export default defineConfig({
  test: {
    environment: "jsdom",
    setupFiles: ["./vitest-setup.js"],
  }
});
```
4. Start Cypress
```bash
bunx cypress open
```
