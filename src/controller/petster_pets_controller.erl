-module(petster_pets_controller, [Request]).
-compile(export_all).

index('GET', []) ->
  Pets = boss_db:find(pet, []),
  {ok, [{pets, Pets}]}.

create('POST', []) ->
  Name = Request:param("name"),
  Species = Request:param("species"),

  Pet = pet:new(id, Name, Species),
  Pet:save(),

  {redirect, "/"}.
