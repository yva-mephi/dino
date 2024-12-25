import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { createHtmlPlugin } from 'vite-plugin-html'

// https://vite.dev/config/
export default defineConfig({
  base: '/dino/', // Укажите базовый путь вашего репозитория
  plugins: [
    react(),
    createHtmlPlugin({
      inject: {
        injectOptions: {
          head: `
            <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' 'unsafe-inline';">
          `,
        },
      },
    }),
  ],
})