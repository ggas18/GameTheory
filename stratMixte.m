function [ x,y,val] = stratMixte( Ajeux )
%Cette fonction permet de trouver les stratégies d'équilibre
%pour un jeu à deux joueurs et à somme nulle
%ENTREE: Ajeux: La matrice des payoffs du premier joueur.

nx=size(Ajeux,1); % le nombre de stratégie possible du premier
% joueur.
ny=size(Ajeux,2); % le nombre de stratégie possible du deuxième
% joueur.

fx=[zeros(1,nx)  1];
fy=[zeros(1,ny)  1];

Ax=[-Ajeux'  ones(ny,1)];

Ay=[Ajeux   -ones(nx,1)];

bx=zeros(ny,1);
by=zeros(nx,1);

AeqX=[ones(1,nx) 0];
AeqY=[ones(1,ny) 0];

beq=1;

lb=zeros(ny,1);
ub=inf*ones(ny,1);
eq_x=linprog(-fx,Ax,bx,AeqX,beq,lb,ub);

eq_y=linprog(fy,Ay,by,AeqY,beq,lb,ub);

x=eq_x(1:end-1);
y=eq_y(1:end-1);
val=eq_x(end);

end

