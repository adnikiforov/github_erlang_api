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