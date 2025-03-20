# Vita49

[Flex TCP/UDP API Docs](http://wiki.flexradio.com/index.php?title=SmartSDR_TCP/IP_API#Response_Format)

FlexRadio utilizes VITA 49's context packets to deliver status updates, metadata, or control information. These are usually sent as readable ASCII text, structured in key-value pairs separated by = signs.

Unlike signal data packets (which are binary), context/status messages from FlexRadio typically look like this:

```ini
frequency=7.074000
mode=USB
antenna=ANT1
```

These messages are often chunked or sliced by newline (\n) or other delimiters, which might be why you're seeing these equal-sign formatted messages in segments.

[Flex TCP/UDP API Docs](http://wiki.flexradio.com/index.php?title=SmartSDR_TCP/IP_API#Response_Format)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `vita49` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:vita49, "~> 0.2.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/vita49](https://hexdocs.pm/vita49).
