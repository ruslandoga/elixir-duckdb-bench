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
duckdbex.fetch_chunk (all)        8.41 K      118.96 μs    ±14.54%      117.65 μs      164.34 μs
duxdb                             8.09 K      123.54 μs    ±10.22%      121.99 μs      162.48 μs
duckdbex.fetch_all                6.10 K      163.87 μs    ±14.43%      170.19 μs      208.77 μs

Comparison: 
duckdbex.fetch_chunk (all)        8.41 K
duxdb                             8.09 K - 1.04x slower +4.58 μs
duckdbex.fetch_all                6.10 K - 1.38x slower +44.92 μs

Memory usage statistics:

Name                          Memory usage
duckdbex.fetch_chunk (all)         1.48 KB
duxdb                              5.10 KB - 3.44x memory usage +3.62 KB
duckdbex.fetch_all                 1.51 KB - 1.02x memory usage +0.0234 KB

**All measurements for memory usage were the same**

##### With input 100000 rows #####
Name                                 ips        average  deviation         median         99th %
duxdb                              69.15       14.46 ms     ±5.00%       14.45 ms       16.34 ms
duckdbex.fetch_chunk (all)         21.78       45.91 ms     ±2.83%       45.74 ms       51.04 ms
duckdbex.fetch_all                 21.64       46.22 ms     ±7.89%       43.76 ms       54.58 ms

Comparison: 
duxdb                              69.15
duckdbex.fetch_chunk (all)         21.78 - 3.18x slower +31.45 ms
duckdbex.fetch_all                 21.64 - 3.20x slower +31.76 ms

Memory usage statistics:

Name                          Memory usage
duxdb                             10.19 MB
duckdbex.fetch_chunk (all)        10.59 MB - 1.04x memory usage +0.40 MB
duckdbex.fetch_all              0.00147 MB - 0.00x memory usage -10.18739 MB

**All measurements for memory usage were the same**
```
