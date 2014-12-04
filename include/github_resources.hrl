%%%-------------------------------------------------------------------
%%% @author adnikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Github v3 API resources (URLs)
%%% @end
%%% Created : 28. Nov 2014 0:40
%%%-------------------------------------------------------------------
-author("a.d.nikiforov@gmail.com").

%% Absolute URL base
-define(GITHUB_BASE_URL, "https://api.github.com/").

%% Rate limits
%% @see https://developer.github.com/v3/rate_limit/
-define(GITHUB_RATE_LIMITS_GET, "rate_limit").

%% Repos
%% @see https://developer.github.com/v3/repos/
-define(GITHUB_GET_USER_REPOS_LIST, {"users/:username/repos"}).
-define(GITHUB_GET_ORG_REPOS_LIST, "users/:org/repos").
-define(GITHUB_GET_PUB_REPOS_LIST, "repositories").
-define(GITHUB_GET_REPO, "repos/:owner/:repo").
-define(GITHUB_GET_REPO_CONTRIBUTORS, "repos/:owner/:repo/contributors").
-define(GITHUB_GET_REPO_LANGUAGES, "repos/:owner/:repo/languages").
-define(GITHUB_GET_REPO_TEAMS, "repos/:owner/:repo/teams").
-define(GITHUB_GET_REPO_TAGS, "repos/:owner/:repo/tags").
-define(GITHUB_GET_REPO_BRANCHES, "repos/:owner/:repo/branches").
-define(GITHUB_GET_REPO_BRANCH, "repos/:owner/:repo/branches/:branch").