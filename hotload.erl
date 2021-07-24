-module(hotload).
-export([server/1, upgrade/1]).

server(State) ->
    receive
        update ->
            NewState = ?MODULE:upgrade(State),
            ?MODULE:server(NewState); %% Loop in the new version of the module.
        SomeMessage ->
            %% Do something here.
            server(State) %% Say in the same version no matter what
    end.

upgrade(OldState) ->
    %% Transform and return the state here




