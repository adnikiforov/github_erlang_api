-module(github_erlang_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1, start/0]).

%% ===================================================================
%% Application callbacks
%% ===================================================================
start() -> start(ok, ok).

start(_StartType, _StartArgs) ->
  lager:start(),
  application:start(crypto),
  application:start(ssl),
  ssl:start(),
  ibrowse:start(),
  github_erlang_sup:start_link().

stop(_State) ->
  ok.