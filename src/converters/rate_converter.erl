%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Convert github rate limits data into records
%%% @end
%%% Created : 04. дек 2014 13:10
%%%-------------------------------------------------------------------
-module(rate_converter).
-author("a.d.nikiforov@gmail.com").

-include("github_objects.hrl").
-behaviour(converter_behavior).

-export([convert/1]).

convert(Data) ->
  [{<<"resources">>,
    [{<<"core">>, CoreData},
      {<<"search">>, SearchData}]},
    {<<"rate">>, RateData}] = jsx:decode(list_to_binary(Data)),
  #github_rate_limits{
    resources = {
      convert_core_data(CoreData),
      convert_search_data(SearchData)
    },
    rate = convert_rate_data(RateData)
  }.

convert_core_data(Data) ->
  [{<<"limit">>, CoreLim},
    {<<"remaining">>, CoreRem},
    {<<"reset">>, CoreReset}] = Data,
  #github_rate_limits_core{
    limit = CoreLim,
    remaining = CoreRem,
    reset = CoreReset
  }.

convert_search_data(Data) ->
  [{<<"limit">>, SearchLim},
    {<<"remaining">>, SearchRem},
    {<<"reset">>, SearchReset}] = Data,
  #github_rate_limits_search{
    limit = SearchLim,
    remaining = SearchRem,
    reset = SearchReset
  }.

convert_rate_data(Data) ->
  [{<<"limit">>, RateLim},
    {<<"remaining">>, RateRem},
    {<<"reset">>, RateReset}] = Data,
  #github_rate_limits_rate{
    limit = RateLim,
    remaining = RateRem,
    reset = RateReset
  }.