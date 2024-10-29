Prelim

```console
$ export CC=$(which clang)
$ export CXX=$(which clang++)
$ MIX_ENV=bench mix run bench/fetch_all.exs
Operating System: macOS
CPU Information: Apple M2
Number of Available Cores: 8
Available memory: 8 GB
Elixir 1.17.1
Erlang 27.0
JIT enabled: true

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
reduction time: 0 ns
parallel: 1
inputs: 100 rows, 100000 rows, 100000000 rows
Estimated total run time: 1 min 3 s

##### With input 100 rows #####
Name                              ips        average  deviation         median         99th %
0_duxdb                     1388.66 K        0.72 μs   ±163.45%        0.71 μs        0.79 μs
1_duckdbex_fetch_chunks      603.52 K        1.66 μs    ±24.78%        1.63 μs        1.83 μs
1_duckdbex_fetch_all         585.70 K        1.71 μs    ±25.32%        1.67 μs        1.88 μs

Comparison:
0_duxdb                     1388.66 K
1_duckdbex_fetch_chunks      603.52 K - 2.30x slower +0.94 μs
1_duckdbex_fetch_all         585.70 K - 2.37x slower +0.99 μs

##### With input 100000 rows #####
Name                              ips        average  deviation         median         99th %
0_duxdb                     1363.76 K        0.73 μs   ±213.93%        0.71 μs        0.88 μs
1_duckdbex_fetch_chunks      600.67 K        1.66 μs    ±26.74%        1.63 μs        1.88 μs
1_duckdbex_fetch_all         589.08 K        1.70 μs    ±25.34%        1.67 μs        1.88 μs

Comparison:
0_duxdb                     1363.76 K
1_duckdbex_fetch_chunks      600.67 K - 2.27x slower +0.93 μs
1_duckdbex_fetch_all         589.08 K - 2.32x slower +0.96 μs

##### With input 100000000 rows #####
Name                              ips        average  deviation         median         99th %
0_duxdb                     1331.30 K        0.75 μs   ±640.48%        0.75 μs        0.88 μs
1_duckdbex_fetch_chunks      612.71 K        1.63 μs    ±33.39%        1.63 μs        1.83 μs
1_duckdbex_fetch_all         538.32 K        1.86 μs   ±128.22%        1.71 μs        5.54 μs

Comparison:
0_duxdb                     1331.30 K
1_duckdbex_fetch_chunks      612.71 K - 2.17x slower +0.88 μs
1_duckdbex_fetch_all         538.32 K - 2.47x slower +1.11 μs
```
