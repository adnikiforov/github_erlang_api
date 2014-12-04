%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Repos request implementation
%%% @end
%%% Created : 04. Dec 2014 12:05
%%%-------------------------------------------------------------------
-module(github_repos).
-author("a.d.nikiforov@gmail.com").

-include("github_resources.hrl").

-export([get_user_repos/0]).

get_user_repos() ->
  RequestUrl = ?GITHUB_BASE_URL ++ ?GITHUB_GET_USER_REPOS_LIST,
  request_utils:make_request(RequestUrl, repo_short_converter).