# sudokuSolver.swift

Solves Sudoku so I don't have to, in Swift!

## How to Solve Puzzles

> Disclaimer: I have only tested this program in MacOS.

First, open Terminal and clone this repository in a convenient directory.

```sh
cd Desktop
git clone https://github.com/maxtremaine/sudokuSolver.swift.git
```

Next, update the file in IO/start.sudoku to reflect your puzzle to solve.

```
  abc def ghi
1 ___|___|___
2 _3_|1_6|2_7
3 6__|_3_|51_
  -----------
4 32_|__9|___
5 __8|__5|7__
6 ___|8__|_53
  -----------
7 _47|_9_|__8
8 8_1|7_2|_9_
9 ___|___|___
```

Alright, now you're ready to solve. Go back to the Terminal.

```sh
swift run
```

Your solved puzzle will be in IO/finish.sudoku.