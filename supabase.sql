-- Ranking de "Especula o sobrevive" (prefijo viv_) en el proyecto "xogos"
-- Se puede ejecutar varias veces sin romper nada.
-- Supabase → SQL Editor → New query → pegar todo → Run

create table if not exists public.viv_ranking (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid(),
  alias text not null check (char_length(alias) between 2 and 20),
  modo text not null check (modo in ('e','f')),
  temporada text not null,
  puntos integer not null check (puntos between -100000 and 1000000),
  dia integer not null check (dia between 1 and 31),
  updated_at timestamptz not null default now(),
  unique (user_id, modo, temporada)
);

-- Columnas nuevas: fortuna (o meses llegados) y personaje
alter table public.viv_ranking add column if not exists extra bigint not null default 0;
alter table public.viv_ranking add column if not exists avatar text;

alter table public.viv_ranking enable row level security;

drop policy if exists "viv_ranking_leer" on public.viv_ranking;
create policy "viv_ranking_leer" on public.viv_ranking
  for select using (true);

drop policy if exists "viv_ranking_insertar" on public.viv_ranking;
create policy "viv_ranking_insertar" on public.viv_ranking
  for insert to authenticated with check (auth.uid() = user_id);

drop policy if exists "viv_ranking_actualizar" on public.viv_ranking;
create policy "viv_ranking_actualizar" on public.viv_ranking
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);

create index if not exists viv_ranking_orden on public.viv_ranking (modo, temporada, puntos desc);
create index if not exists viv_ranking_fecha on public.viv_ranking (modo, temporada, updated_at desc);
