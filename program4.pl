parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
female(pam).
male(tom).
male(bob).
female(liz).
male(pat).
female(ann).
male(jim).
mother(X,Y) :- parent(X,Y), female(X).
father(X,Y) :- parent(X,Y), male(X).
haschild(X) :- parent(X,_).
sister(X,Y) :-parent(Z,X), parent(Z,Y), female(X),X\==Y.
brother(X,Y) :- parent(Z,X), parent(Z,Y), male(X), X\==Y.
grandparent(X,Y):- parent(X,Z), parent(Z,Y). 
grandfather(X,Y):- parent(X,Z), parent(Z,Y), male(X).
grandmother(X,Y):- parent(X,Z), parent(Z,Y), female(X).
wife(X,Y) :- parent(X,Z), parent(Y,Z), female(X),male(Y).
uncle(X,Y) :- brother(X,Z), parent(Z,Y).
predecessor(X,Y):- parent(X,Y).


% TO TRACE THE ANSWER WE WRITE trace. AND TEH USE THE COMMAND grandfather(X,Y). and we get 
% the below OUTPUT 

% {trace}
% | ?- grandparent(X,Y).
%       1    1  Call: grandparent(_23,_24) ? 
%       2    2  Call: parent(_23,_102) ? 
%       2    2  Exit: parent(pam,bob) ? 
%       3    2  Call: parent(bob,_24) ? 
%       3    2  Exit: parent(bob,ann) ? 
%       1    1  Exit: grandparent(pam,ann) ? 

% X = pam
% Y = ann ? 

% (16 ms) yes