alias Friends.Repo
alias Friends.MyCTE

Repo.delete_all(Friends.Nodes)
Repo.delete_all(Friends.Paths)

"""
INSERT INTO "public"."nodes" ("id", "name") VALUES ('1', 'Bob');
INSERT INTO "public"."nodes" ("id", "name") VALUES ('3', 'Kimberley');
INSERT INTO "public"."nodes" ("id", "name") VALUES ('4', 'Daniel');
INSERT INTO "public"."nodes" ("id", "name") VALUES ('5', 'Elizabeth');
INSERT INTO "public"."nodes" ("id", "name") VALUES ('2', 'Matthew');
INSERT INTO "public"."nodes" ("id", "name") VALUES ('6', 'Peta');
INSERT INTO "public"."nodes" ("id", "name") VALUES ('7', 'Abigail');
INSERT INTO "public"."nodes" ("id", "name") VALUES ('8', 'Jenny');
INSERT INTO "public"."nodes" ("id", "name") VALUES ('9', 'Alex');
"""
|> String.split("\n")
|> Enum.each(&Repo.query/1)

[
  [5,5],
  [5,2],
  [5,9],
  [5,4],
  [2,1],
  [4,3],
  [4,6],
  [9,7],
  [4,8]
]
|> Enum.each(fn [ancestor, leaf] -> MyCTE.insert(leaf, ancestor) end)
