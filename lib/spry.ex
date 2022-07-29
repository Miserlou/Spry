require IEx;

defmodule Spry do
  @moduledoc """
  Documentation for `Spry`.
  """
  def suspend(options \\ []) do
    default = [exclude: []]
    options = Keyword.merge(default, options)
    exclude = options[:exclude]

    all_pids = :application.info[:running]
    suspended = Enum.reduce all_pids, [], fn process, suspended ->
      name = elem(process, 0)
      pid = elem(process, 1)

      suspended = cond do

        pid == :undefined ->
          suspended

        name == :iex ->
          suspended

        # Don't suspend our own project - might not be necessary!
        # name == Mix.Project.get!().project[:app] ->
          # suspended

        # Don't suspend ourself
        pid == self() ->
          suspended

        pid in exclude or name in exclude ->
          suspended

        true ->
          :erlang.suspend_process(pid)
          suspended ++ [pid]
      end
      suspended
    end

    suspended
  end

  def resume(suspended) do
    Enum.map suspended, fn pid ->
      :erlang.resume_process(pid)
    end
  end

  def spry(options \\ []) do
    suspended = Spry.suspend(options)
    require IEx; IEx.pry()
    Spry.resume(suspended)
  end

end
