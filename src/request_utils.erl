%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Some common internals
%%% @end
%%% Created : 04. Dec 2014 11:55
%%%-------------------------------------------------------------------
-module(request_utils).
-author("a.d.nikiforov@gmail.com").

-include("internal_resources.hrl").
-export([make_request/2]).

%% @doc Make request by specified Url and convert response using Converter
-spec make_request(nonempty_string(), module()) -> term().
make_request(Url, Converter) ->
  case ibrowse:send_req(Url, [?DEFAULT_UA], get) of
    {ok, "200", _Headers, Body} -> erlang:apply(Converter, convert, [Body]);
    {ok, Code, _Headers, Body} -> lager:error("Error code ~p ~p", [Code, Body]), error
  end.