candidate_number(25865).

q1(ailp_start_position(_P)).
q2a(new_pos(p(1,1), e, _P)).
q2b(136).
q3([s,e,w,n]).
q4a([p(2,2),p(2,3),p(2,4)]).
q4b([p(2,2),p(2,3),p(2,4),p(3,4)]).
q4c([p(2, 2), p(2, 3), p(2, 4), p(3, 4), p(4, 4), p(4, 3), p(3, 3), p(3, 2), p(4, 2), p(4, 1), p(3, 1), p(2, 1), p(1, 1), p(1, 2), p(1, 3), p(1, 4)]).
q4d([p(2, 2), p(2, 3), p(2, 4), p(1, 4), p(1, 3), p(1, 2), p(1, 1), p(2, 1), p(3, 1), p(3, 2), p(3, 3), p(3, 4), p(4, 4), p(4, 3), p(4, 2), p(4, 1)]).

next_corner(p(X,Y), D, p(X1,Y1)) :-
  ( D = s -> X1 =  X,    Y1 is Y+3
  ; D = n -> X1 =  X,    Y1 is Y-3
  ; D = e -> X1 is X+3,  Y1 =  Y
  ; D = w -> X1 is X-3,  Y1 =  Y
  ; D = sw -> X1 is X-3, Y1 is Y+3
  ; D = nw -> X1 is X-3, Y1 is Y-3
  ; D = ne -> X1 is X+3, Y1 is Y-3
  ; D = se -> X1 is X+3, Y1 is Y+3
  ),
  X1 >= 1, Y1 >=1,
  ailp_grid_size(N),
  X1 =< N, Y1 =< N.

q5_start(p(1,1)).
% q5_start(p(4,1)).
% q5_start(p(1,4)).
% q5_start(p(4,4)).

d(s).
d(e).
d(w).
d(n).
d(sw).
d(nw).
d(ne).
d(se).

q5_corner_move :-
  q5_start(P),
  ailp_show_move(_,P),
  q5_corner_move(P,[P]).
q5_corner_move(P,Ps) :-
  d(D),
  next_corner(P,D,P1),
  \+ memberchk(P1, Ps),
  ailp_show_move(P,P1),
  q5_corner_move(P1,[P1|Ps]).

next_corner2(p(X,Y), D, p(X1,Y1)) :-
  ailp_grid_size(N),
  N1 is N-1,
  ( D = s -> X1 =  X,    Y1 is Y+N1
  ; D = n -> X1 =  X,    Y1 is Y-N1
  ; D = e -> X1 is X+N1,  Y1 =  Y
  ; D = w -> X1 is X-N1,  Y1 =  Y
  ; D = sw -> X1 is X-N1, Y1 is Y+N1
  ; D = nw -> X1 is X-N1, Y1 is Y-N1
  ; D = ne -> X1 is X+N1, Y1 is Y-N1
  ; D = se -> X1 is X+N1, Y1 is Y+N1
  ),
  X1 >= 1, Y1 >=1,
  X1 =< N, Y1 =< N.


q5_corner_move2 :-
  q5_start(P),
  ailp_show_move(_,P),
  q5_corner_move2(P,[P]).
q5_corner_move2(P,Ps) :-
  d(D),
  next_corner2(P,D,P1),
  \+ memberchk(P1, Ps),
  ailp_show_move(P,P1),
  q5_corner_move2(P1,[P1|Ps]).

% q6_spiral(L) :-
