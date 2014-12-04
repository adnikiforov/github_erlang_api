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

-export([get_limits/0]).

-spec get_limits() -> github_rate_limit() | atom().
get_limits() ->
  RequestURL = ?GITHUB_BASE_URL ++ ?GITHUB_RATE_LIMITS_GET,
  request_utils:make_request(RequestURL, rate_converter).