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
```

TODO: Figure out the callback... latest attempt...

```elixir
iex> CTE.Utils.print_tree(tree, 5, callback: &("#{&2[&1].name}"))
** (MatchError) no match of right hand side value: "Elizabeth"
    (closure_table 1.0.10) lib/cte/utils.ex:104: anonymous fn/4 in CTE.Utils.print_tree/3
    (closure_table 1.0.10) lib/cte/utils.ex:123: anonymous fn/3 in CTE.Utils.print_tree/6
    (elixir 1.11.4) lib/enum.ex:1109: anonymous fn/3 in Enum.flat_map_reduce/3
    (elixir 1.11.4) lib/enum.ex:3776: Enumerable.List.reduce/3
    (elixir 1.11.4) lib/enum.ex:1108: Enum.flat_map_reduce/3
    (closure_table 1.0.10) lib/cte/utils.ex:122: CTE.Utils.print_tree/6
    (closure_table 1.0.10) lib/cte/utils.ex:112: CTE.Utils._print_tree/3
```