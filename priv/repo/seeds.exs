alias Friends.Repo
alias Friends.MyCTE

Repo.delete_all(Friends.Nodes)
Repo.delete_all(Friends.Paths)

"""
INSERT INTO "public"."nodes" ("id", "name", "skill") VALUES ('1', 'Bob', 'Beatboxing');
INSERT INTO "public"."nodes" ("id", "name", "skill") VALUES ('3', 'Kimberley', 'Writing');
INSERT INTO "public"."nodes" ("id", "name", "skill") VALUES ('4', 'Daniel', 'Analysis');
INSERT INTO "public"."nodes" ("id", "name", "skill") VALUES ('5', 'Elizabeth', 'Networking');
INSERT INTO "public"."nodes" ("id", "name", "skill") VALUES ('2', 'Matthew', 'Building');
INSERT INTO "public"."nodes" ("id", "name", "skill") VALUES ('6', 'Peta', 'Research');
INSERT INTO "public"."nodes" ("id", "name", "skill") VALUES ('7', 'Abigail', 'Styling');
INSERT INTO "public"."nodes" ("id", "name", "skill") VALUES ('8', 'Jenny', 'Coordination');
INSERT INTO "public"."nodes" ("id", "name", "skill") VALUES ('9', 'Alex', 'Technology');
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
