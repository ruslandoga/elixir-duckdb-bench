Prelim

```console
$ MIX_ENV=bench mix run bench/fetch_all.exs
Operating System: macOS
CPU Information: Apple M2
Number of Available Cores: 8
Available memory: 8 GB
Elixir 1.17.1
Erlang 27.0
JIT enabled: true

##### With input 100 rows #####
Name                           ips        average  deviation         median         99th %
0_duxdb                    21.78 K       45.91 μs    ±27.18%       45.46 μs       84.08 μs
1_duckdbex_fetch_all        9.59 K      104.28 μs    ±45.57%       85.33 μs      314.01 μs

Comparison:
0_duxdb                    21.78 K
1_duckdbex_fetch_all        9.59 K - 2.27x slower +58.37 μs

##### With input 100000 rows #####
Name                           ips        average  deviation         median         99th %
0_duxdb                      69.52       14.38 ms     ±2.93%       14.37 ms       14.79 ms
1_duckdbex_fetch_all         22.94       43.60 ms     ±7.07%       41.51 ms       49.02 ms

Comparison:
0_duxdb                      69.52
1_duckdbex_fetch_all         22.94 - 3.03x slower +29.21 ms
```
