<img src="https://i.imgur.com/rhSGPbb.png" height="250px" />

# Spry
[![GitHub](https://img.shields.io/github/stars/Miserlou/Spry?style=social)](https://github.com/Miserlou/Spry)
[![Hex.pm](https://img.shields.io/hexpm/v/spry.svg)](https://hex.pm/packages/spry)

**Spry** is a (slightly) beefed up version of Elixir's `IEx.pry()`.

Spry was born out of annoyance at the state of debugging Elixir when lots of processes are interacting - a `pry` session would be interrupted and messed up by timeouts and other processes spewing garbage into the console, particularly for LiveView applications with background processes.

Spry works by suspending every other process it can before `pry`ing, then resuming those processes once the IEX session is over. For example, in a LiveView application, if another client requests a page while a `spry` session is open, the page won't render until the session is over.

## Status
Alpha! This project is in development. It's a debugging tool and shouldn't be used in production anyway.

## Installation

The package can be installed by adding `spry` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:spry, "~> 0.2.0"}
  ]
end
```

## Usage

Usage is simple:

```elixir
require Spry
Spry.spry()
```

When you `continue()`, `spry` will then resume all of the processes it suspended.

If there are things you want to exclude from suspension, can exclude them by name or PID:

```elixir
require Spry
Spry.spry(%{exclude: ["important_process", other_important_process_pid]})
```

## TODO

- Test in multi-node (Horde) environment
- Figure out how to bypass that goddamn `Allow?` interrogation.
- Allow argument to supply list of names/pids to omit

## License

MIT License

Copyright (c) 2022 Rich Jones

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
