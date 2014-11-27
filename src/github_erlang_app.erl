-module(github_erlang_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
  application:start(crypto),
  application:start(ssl),
  ssl:start(),
  ibrowse:start(),
  github_erlang_sup:start_link().

stop(_State) ->
  ok.