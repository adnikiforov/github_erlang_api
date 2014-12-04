%%%-------------------------------------------------------------------
%%% @author adnikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Github v3 API objects (records)
%%% @end
%%% Created : 4. Dec 2014 0:40
%%%-------------------------------------------------------------------
-author("a.d.nikiforov@gmail.com").
-export_type([github_rate_limit/0, github_repo_short/0]).

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

%% Repos
%% @see https://developer.github.com/v3/repos/

-record(github_owner, {
  login :: nonempty_string(),
  id :: non_neg_integer(),
  avatar_url :: string(),
  gravatar_url :: string(),
  url :: nonempty_string(),
  html_url :: nonempty_string(),
  followers_url :: nonempty_string(),
  following_url :: nonempty_string(),
  gists_url :: nonempty_string(),
  starred_url :: nonempty_string(),
  subscriptions_url :: nonempty_string(),
  organizations_url :: nonempty_string(),
  repos_url :: nonempty_string(),
  events_url :: nonempty_string(),
  received_events_url :: nonempty_string(),
  type :: nonempty_string(),
  site_admin :: boolean()
}).

-record(github_repo_short, {
  id :: non_neg_integer(),
  name :: nonempty_string(),
  full_name :: nonempty_string(),
  owner = #github_owner{},
  private :: boolean(),
  html_url :: nonempty_string(),
  description :: nonempty_string(),
  fork :: boolean(),
  url :: nonempty_string(),
  forks_url :: nonempty_string(),
  keys_url :: nonempty_string(),
  collaborators_url :: nonempty_string(),
  teams_url :: nonempty_string(),
  hooks_url :: nonempty_string(),
  issue_events_url :: nonempty_string(),
  events_url :: nonempty_string(),
  assignees_url :: nonempty_string(),
  branches_url :: nonempty_string(),
  tags_url :: nonempty_string(),
  blobs_url :: nonempty_string(),
  git_tags_url :: nonempty_string(),
  git_refs_url :: nonempty_string(),
  trees_url :: nonempty_string(),
  statuses_url :: nonempty_string(),
  languages_url :: nonempty_string(),
  stargazers_url :: nonempty_string(),
  contributors_url :: nonempty_string(),
  subscribers_url :: nonempty_string(),
  subscription_url :: nonempty_string(),
  commits_url :: nonempty_string(),
  git_commits_url :: nonempty_string(),
  comments_url :: nonempty_string(),
  issue_comment_url :: nonempty_string(),
  contents_url :: nonempty_string(),
  compare_url :: nonempty_string(),
  merges_url :: nonempty_string(),
  archive_url :: nonempty_string(),
  downloads_url :: nonempty_string(),
  issues_url :: nonempty_string(),
  pulls_url :: nonempty_string(),
  milestones_url :: nonempty_string(),
  notifications_url :: nonempty_string(),
  labels_url :: nonempty_string(),
  releases_url :: nonempty_string(),
  created_at :: calendar:datetime(),
  updated_at :: calendar:datetime(),
  pushed_at :: calendar:datetime(),
  git_url :: nonempty_string(),
  ssh_url :: nonempty_string(),
  clone_url :: nonempty_string(),
  svn_url :: nonempty_string(),
  homepage :: nonempty_string()|none(),
  size :: non_neg_integer(),
  stargazers_count :: non_neg_integer(),
  language :: nonempty_string()|none(),
  has_issues :: boolean(),
  has_downloads :: boolean(),
  has_wiki :: boolean(),
  has_pages :: boolean(),
  forks_count :: non_neg_integer(),
  mirror_url :: nonempty_string()|none(),
  open_issues_count :: non_neg_integer(),
  forks :: non_neg_integer(),
  open_issues :: non_neg_integer(),
  watchers :: non_neg_integer(),
  default_branch :: nonempty_string()
}).

-type github_repo_short() :: #github_repo_short{}.