%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Rate limits request implementation
%%% @end
%%% Created : 04. Dec 2014 11:05
%%%-------------------------------------------------------------------
-module(github_rate_limits).
-author("a.d.nikiforov@gmail.com").

-include("github_resources.hrl").
-include("github_objects.hrl").

-export([get_rate_limits/0]).


-spec get_rate_limits() -> github_rate_limit() | atom().
get_rate_limits() ->
  RequestURL = ?GITHUB_BASE_URL ++ ?GITHUB_RATE_LIMITS_GET,
  case ibrowse:send_req(RequestURL, [{"User-Agent", "UA"}], get) of
    {ok, "200", _Headers, Body} -> convert_response(Body);
    {ok, Code, _Headers, Body} -> lager:error("Error: " ++ Code ++ " " ++ Body), error
  end.

-spec convert_response(list()) -> github_rate_limit().
convert_response(Body) ->
  [{<<"resources">>,
    [{<<"core">>,
      [{<<"limit">>, CoreLim},
        {<<"remaining">>, CoreRem},
        {<<"reset">>, CoreReset}]},
      {<<"search">>,
        [{<<"limit">>, SearchLim},
          {<<"remaining">>, SearchRem},
          {<<"reset">>, SearchReset}]}]},
    {<<"rate">>,
      [{<<"limit">>, RateLim},
        {<<"remaining">>, RateRem},
        {<<"reset">>, RateReset}]}] = jsx:decode(list_to_binary(Body)),

  #github_rate_limits{
    resources = {
      #github_rate_limits_core{
        limit = CoreLim,
        remaining = CoreRem,
        reset = CoreReset
      },
      #github_rate_limits_search{
        limit = SearchLim,
        remaining = SearchRem,
        reset = SearchReset
      }
    },
    rate = #github_rate_limits_rate{
      limit = RateLim,
      remaining = RateRem,
      reset = RateReset
    }
  }.
