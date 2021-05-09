# Friends

Learning how to work with the [closure_table](https://github.com/florinpatrascu/closure_table).

## Quick start
```elixir
$ mix do deps.get, compile
$ mix ecto.setup
```

Jump into the IEx shell.
```elixir
iex> {:ok, tree} = MyCTE.tree(5, depth: 2)
{:ok,
 %{
   nodes: %{
     1 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 1,
       name: "Bob"
     },
     2 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 2,
       name: "Matthew"
     },
     3 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 3,
       name: "Kimberley"
     },
     4 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 4,
       name: "Daniel"
     },
     5 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 5,
       name: "Elizabeth"
     },
     6 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 6,
       name: "Peta"
     },
     7 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 7,
       name: "Abigail"
     },
     8 => %Friends.Nodes{
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 8,
       name: "Jenny"
     },
     9 => %Friends.Nodes{ 
       __meta__: #Ecto.Schema.Metadata<:loaded, "nodes">,
       id: 9,
       name: "Alex"
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

iex> CTE.Utils.print_tree(tree, 5, callback: &({&1, "#{&2[&1].name}: #{&2[&1].skill}"}))
Elizabeth: Networking
├── Matthew: Building
│  └── Bob: Beatboxing
├── Alex: Technology
│  └── Abigail: Styling
└── Daniel: Analysis
   ├── Kimberley: Writing
   ├── Peta: Research
   └── Jenny: Coordination
[]
```