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
Name                 ips        average  deviation         median         99th %
0_duxdb           8.85 K      112.98 μs    ±31.25%      108.59 μs      167.22 μs
1_duckdbex        5.75 K      174.04 μs    ±21.27%      166.12 μs      244.01 μs

Comparison: 
0_duxdb           8.85 K
1_duckdbex        5.75 K - 1.54x slower +61.06 μs

Memory usage statistics:

Name          Memory usage
0_duxdb            5.10 KB
1_duckdbex         1.51 KB - 0.30x memory usage -3.59375 KB

**All measurements for memory usage were the same**

##### With input 100000 rows #####
Name                 ips        average  deviation         median         99th %
0_duxdb            69.72       14.34 ms     ±6.31%       14.12 ms       18.25 ms
1_duckdbex         22.08       45.29 ms     ±7.44%       42.90 ms       52.27 ms

Comparison: 
0_duxdb            69.72
1_duckdbex         22.08 - 3.16x slower +30.95 ms

Memory usage statistics:

Name          Memory usage
0_duxdb           10.19 MB
1_duckdbex      0.00147 MB - 0.00x memory usage -10.18739 MB

**All measurements for memory usage were the same**
```
