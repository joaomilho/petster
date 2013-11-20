%% Migration: pets

UpSQL = "
  CREATE TABLE pets(
    id serial unique,
    name text not null,
    species text not null
  );
".

DownSQL = "DROP TABLE pets;".

{create_pets,
  fun(up)   -> boss_db:execute(UpSQL);
     (down) -> boss_db:execute(DownSQL)
  end}.

