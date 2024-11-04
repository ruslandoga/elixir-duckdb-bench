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
Name                                 ips        average  deviation         median         99th %
duxdb                             9.17 K      109.01 μs    ±19.81%      106.37 μs      147.04 μs
duckdbex.fetch_chunk (all)        7.38 K      135.44 μs    ±12.54%      134.43 μs      175.58 μs
duckdbex.fetch_all                6.40 K      156.18 μs    ±24.41%      148.44 μs      212.55 μs

Comparison: 
duxdb                             9.17 K
duckdbex.fetch_chunk (all)        7.38 K - 1.24x slower +26.43 μs
duckdbex.fetch_all                6.40 K - 1.43x slower +47.17 μs

Memory usage statistics:

Name                          Memory usage
duxdb                              5.10 KB
duckdbex.fetch_chunk (all)         1.48 KB - 0.29x memory usage -3.61719 KB
duckdbex.fetch_all                 1.51 KB - 0.30x memory usage -3.59375 KB

**All measurements for memory usage were the same**

##### With input 100000 rows #####
Name                                 ips        average  deviation         median         99th %
duxdb                              67.24       14.87 ms     ±5.57%       14.69 ms       16.86 ms
duckdbex.fetch_chunk (all)         21.82       45.82 ms     ±2.33%       45.41 ms       49.86 ms
duckdbex.fetch_all                 21.55       46.41 ms     ±7.35%       44.17 ms       52.90 ms

Comparison: 
duxdb                              67.24
duckdbex.fetch_chunk (all)         21.82 - 3.08x slower +30.95 ms
duckdbex.fetch_all                 21.55 - 3.12x slower +31.54 ms

Memory usage statistics:

Name                          Memory usage
duxdb                             10.19 MB
duckdbex.fetch_chunk (all)        10.59 MB - 1.04x memory usage +0.40 MB
duckdbex.fetch_all              0.00147 MB - 0.00x memory usage -10.18738 MB

**All measurements for memory usage were the same**
```
