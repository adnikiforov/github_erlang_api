%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Converters abstract behavior
%%% @end
%%% Created : 04. дек 2014 13:44
%%%-------------------------------------------------------------------
-module(converter_behavior).
-author("a.d.nikiforov@gmail.com").

-callback convert(Data :: nonempty_string()) -> term() | list(term()).