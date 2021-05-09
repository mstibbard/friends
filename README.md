# Friends

Learning how to work with the [closure_table](https://github.com/florinpatrascu/closure_table).

## Quick start
```elixir
$ mix do deps.get, compile
$ mix ecto.setup
```

Note: `.iex.exs` is aliasing and importing a few functions to enable below queries.

Jump into the IEx shell.
```elixir
iex> {:ok, tree} = MyCTE.tree(5, depth: 2)
{:ok,
 %{
   nodes: %{
     1 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 1,
       name: "Bob",
       skill: "Beatboxing"
     },
     2 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 2,
       name: "Matthew",
       skill: "Building"
     },
     3 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 3,
       name: "Kimberley",
       skill: "Writing"
     },
     4 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 4,
       name: "Daniel",
       skill: "Analysis"
     },
     5 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 5,
       name: "Elizabeth",
       skill: "Networking"
     },
     6 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 6,
       name: "Peta",
       skill: "Research"
     },
     7 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 7,
       name: "Abigail",
       skill: "Styling"
     },
     8 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 8,
       name: "Jenny",
       skill: "Coordination"
     },
     9 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 9,
       name: "Alex",
       skill: "Technology"
     }
   },
   paths: [
     [5, 5, 0],
     [5, 2, 1],
     [2, 2, 0],
     [5, 9, 1],
     [9, 9, 0],
     [5, 4, 1],
     [4, 4, 0],
     [5, 1, 2],
     [2, 1, 1],
     [1, 1, 0],
     [5, 3, 2],
     [4, 3, 1],
     [3, 3, 0],
     [5, 6, 2],
     [4, 6, 1],
     [6, 6, 0],
     [5, 7, 2],
     [9, 7, 1],
     [7, 7, 0],
     [5, 8, 2],
     [4, 8, 1],
     [8, 8, 0]
   ]
 }}

iex> CTE.Utils.print_tree(tree, 5, callback: &({&1, &2[&1].name}))
Elizabeth
├── Matthew
│  └── Bob
├── Alex
│  └── Abigail
└── Daniel
   ├── Kimberley
   ├── Peta
   └── Jenny
[]

iex> CTE.Utils.print_tree(tree, 5, callback: &({&1, "#{&2[&1].name} (#{&2[&1].id}): #{&2[&1].skill}"}))
Elizabeth (5): Networking
├── Matthew (2): Building
│  └── Bob (1): Beatboxing
├── Alex (9): Technology
│  └── Abigail (7): Styling
└── Daniel (4): Analysis
   ├── Kimberley (3): Writing
   ├── Peta (6): Research
   └── Jenny (8): Coordination
[]

iex> CTE.Utils.print_tree(tree, 5, callback: &({&1, {&2[&1].name, &2[&1].skill}}), raw: true)
[
  {0, {"Elizabeth", "Networking"}},
  {1, {"Matthew", "Building"}},
  {2, {"Bob", "Beatboxing"}},
  {1, {"Alex", "Technology"}},
  {2, {"Abigail", "Styling"}},
  {1, {"Daniel", "Analysis"}},
  {2, {"Kimberley", "Writing"}},
  {2, {"Peta", "Research"}},
  {2, {"Jenny", "Coordination"}}
]

iex> MyCTE.descendants(5)
{:ok, [2, 4, 9, 7, 8, 6, 3, 1]}

iex> MyCTE.ancestors(8)
{:ok, [5, 4]}

iex> MyCTE.ancestors(8, nodes: true)
{:ok,
 [
   %Friends.Nodes{
     __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
     id: 5,
     name: "Elizabeth",
     skill: "Networking"
   },
   %Friends.Nodes{
     __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
     id: 4,
     name: "Daniel",
     skill: "Analysis"
   }
 ]}

iex> MyCTE.move(4, 2)
{:ok, {6, nil}}

iex> {:ok, tree} = MyCTE.tree(5, depth: 4)
...

iex> CTE.Utils.print_tree(tree, 5, callback: &({&1, "#{&2[&1].name} (#{&2[&1].id}): #{&2[&1].skill}"}))
Elizabeth (5): Networking
├── Matthew (2): Building
│  ├── Bob (1): Beatboxing
│  └── Daniel (4): Analysis
│     ├── Kimberley (3): Writing
│     ├── Peta (6): Research
│     └── Jenny (8): Coordination
└── Alex (9): Technology
   └── Abigail (7): Styling
[]
```