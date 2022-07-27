defmodule Spry do
  @moduledoc """
  Documentation for `Spry`.
  """

  defp spry() do
    require IEx;
    IEx.configure(inspect: [limit: :infinity])

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
        true ->
          :erlang.suspend_process(pid)
          suspended ++ [pid]
      end
      suspended
    end

    IEx.pry()

    Enum.map suspended, fn pid ->
      :erlang.resume_process(pid)
    end

  end
end
