
:- set(i,2).
:- set(verbose,1).

:- modeb(*, pere(+, -)).
:- modeb(1, pere(-, +)).
:- modeb(*, mere(+, -)).
:- modeb(1, mere(-, +)).
:- modeb(*, fille(-)).

:- determination(fille_de/2, pere/2).
:- determination(fille_de/2, mere/2).
:- determination(fille_de/2, fille/1).




pere(tom, eve).
pere(tom, lisa).
pere(tom, bob).
mere(ann, mary).
mere(mary, rosy).
fille(mary).
fille(eve).
fille(ann).
fille(rosy).
fille(lisa).