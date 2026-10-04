# Especula o sobrevive

Juego satírico y diario sobre la vivienda en España, con dos modos:

- **Especulador:** sube alquileres, echa a gente, haz trampas y escala en el ranking. Se puntúa en *ladrillos*: tu fortuna más la desgracia que causas.
- **Fin de mes:** una nómina, un alquiler y un buzón lleno de imprevistos. Se puntúa en *respiros*.

Disponible en castellano, galego, català y euskara.

## Archivos

- `index.html`: el juego entero (imágenes, sonido, música y traducciones dentro).
- `supabase.sql`: la tabla del ranking online.

## Activar el ranking online

1. En Supabase, abre el proyecto «xogos».
2. Ve a **SQL Editor → New query**, pega el contenido de `supabase.sql` y pulsa **Run**.
3. Ve a **Authentication → Sign In / Providers** y activa **Allow anonymous sign-ins**.
4. Ve a **Project Settings → API** y copia la **Project URL** y la clave **anon public**.
5. En `index.html`, busca `const ONLINE={url:'',key:''` y pega ahí las dos cosas entre las comillas.
6. Sube el `index.html` al repositorio. El ranking online funciona en la web publicada (Vercel), no abriendo el archivo en el ordenador.

Mientras haya pocos jugadores, el ranking se rellena con jugadores ficticios que siempre quedan en el 55 % inferior de lo posible.

## Datos reales

Las cifras de la pantalla «Lo que hay detrás» vienen del Consejo de la Juventud de España, el CGPJ, el Ministerio del Interior, el Tribunal de Cuentas, el Banco de España, Provivienda, el INE, idealista y Atlas Real Estate Analytics.
