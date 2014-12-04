%%%-------------------------------------------------------------------
%%% @author adnikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Github v3 API objects (records)
%%% @end
%%% Created : 4. Dec 2014 0:40
%%%-------------------------------------------------------------------
-author("a.d.nikiforov@gmail.com").
-export_type([github_rate_limit/0]).

%% Rate limits record
%% @see https://developer.github.com/v3/rate_limit/
-record(github_rate_limits_core, {
  limit :: non_neg_integer(),
  remaining :: non_neg_integer(),
  reset :: integer()
}).
-record(github_rate_limits_search, {
  limit :: non_neg_integer(),
  remaining :: non_neg_integer(),
  reset :: integer()
}).
-record(github_rate_limits_rate, {
  limit :: non_neg_integer(),
  remaining :: non_neg_integer(),
  reset :: integer()
}).
-record(github_rate_limits, {
  resources = {
    #github_rate_limits_core{},
    #github_rate_limits_search{}
  },
  rate = #github_rate_limits_rate{}
}).

-type github_rate_limit() :: #github_rate_limits{}.