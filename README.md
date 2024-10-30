Prelim results from [CI](./.github/workflows/bench.yml)

```console
Operating System: Linux
CPU Information: AMD EPYC 7763 64-Core Processor
Number of Available Cores: 4
Available memory: 15.61 GB
Elixir 1.17.3
Erlang 27.1.2
JIT enabled: true

##### With input 100 rows #####
Name                           ips        average  deviation         median         99th %
0_duxdb                     8.90 K      112.38 μs    ±18.93%      106.84 μs      240.15 μs
1_duckdbex_fetch_all        5.74 K      174.27 μs     ±9.18%      173.56 μs      212.12 μs

Comparison: 
0_duxdb                     8.90 K
1_duckdbex_fetch_all        5.74 K - 1.55x slower +61.90 μs

##### With input 100000 rows #####
Name                           ips        average  deviation         median         99th %
0_duxdb                      65.80       15.20 ms     ±5.59%       15.13 ms       17.46 ms
1_duckdbex_fetch_all         21.60       46.30 ms     ±7.57%       44.06 ms       56.67 ms

Comparison: 
0_duxdb                      65.80
1_duckdbex_fetch_all         21.60 - 3.05x slower +31.10 ms
```
