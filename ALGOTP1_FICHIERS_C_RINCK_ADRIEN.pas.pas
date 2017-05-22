{Algortihme Conjugaison
But:Conjuguer et ranger dans des fichiers une liste de verbes prédéfini
Entree:Un verbe a l'infinitif
Sortie:Le groupe du verbe, et sa conjugaison
Type VbGrp1=Enregistrement
	Sujet:Chaine
	infinitif:Chaine
	Terminaison:Chaine
FinType
Type ConjugGrp1=Tableau[1..6] de VbGrp1 
var
	Verbes:Text
	VerbeConjuguer:Text
Procedure Assignation (var Verbes:Text)
Debut
	Réécrire(Verbes)
	Ecrire(Verbes,"Rire")
	writeln(Verbes,"Recevoir");
	writeln(Verbes,"Aller");
	writeln(Verbes,"Bouillir");
	writeln(Verbes,"Envoyer");
	writeln(Verbes,"Peindre");
	writeln(Verbes,"Habiter");
	writeln(Verbes,"Payer");
	writeln(Verbes,"Mourir");
	writeln(Verbes,"Hair");
	writeln(Verbes,"Vouloir');
	writeln(Verbes,"Finir");
	writeln(Verbes,"S''amuser");
FinProcedure

Procedure AssignationVrbGrp1 (var Vb:ConjugGrp1)
begin
	Vb[1].Sujet<-"Je"
	Vb[2].Sujet<-"Tu"
	Vb[3].Sujet<-"Il"
	Vb[4].Sujet<-"Nous"
	Vb[5].Sujet<-"Vous"
	Vb[6].Sujet<-"Ils"
	Vb[1].Terminaison<-"e"
	Vb[2].Terminaison<-"es"
	Vb[3].Terminaison<-"e"
	Vb[4].Terminaison<-"ons"
	Vb[5].Terminaison<-"ez"
	Vb[6].Terminaison<-"ent"
FinProcedure

Procedure ConjugPremierGrp (Taille:Entier,Choix:Chaine,Vb:ConjugGrp1)
var	
	i:entier
debut
	Pour i <-1 A 6 Faire
		Vb[i].Infinitif<-Extract(Choix,0,Taille)
	Pour i <-1 A 6 Faire 
		Ecrire(Vb[i].Sujet+' '+Vb[i].infinitif+Vb[i].Terminaison)
FinProcedure

Procedure DefGroupes (var Grp:entier,Choix:Chaine,Taille:entier)
debut	
	si Extract(Choix,Taille,2)="er" Alors
		Grp<-1
	si Choix="aller" alors
		Grp<-0
Fin

Procedure AssignationFichierVbConjug(var VerbeConjuguer:Text,Vb:ConjugGrp1,Choix:Chaine,Taille:entier)
var	
	i:entier
debut 
	Assigner(Verbeonjuguer,"VbConjug.txt")
	Réécrire(VerbeConjuguer)
	Pour i<-1 A 6 Faire 
		Vb[i].Infinitif<-Extract(Choix,0,Taille)
	Pour i<-1 A 6 Faire
		Ecrire(VerbeConjuguer,Vb[i].Sujet+' '+Vb[i].Infinitif+Vb[i].Terminaison)
	Fermer(VerbeConjuguer)
FinProcedure

Var 
	Vb:ConjugGrp1
	fin,Choix,Test:Chaine
	i,taille,grp:entier
debut	
	Assigner(Verbes,'MesVerbes.txt')
	Assignation(Verbes)
	AssignationVrbGrp1(Vb)
	Ecrire("Quel verbe voulez vous conjuguez ?")
	Lire(Choix)
	Taille<-Longueur(Choix)
	Taille<-Taille-2
	DefGroupes(Grp,Choix,Taille)
	Si Grp=1 Alors
		debut	
			ConjugPremierGrp(Taille,Choix,Vb)
			AssignationFichierVbConjug(VerbeConjuguer,Vb,Choix,Taille)
		FinSi
	Fermer(Verbes)
Fin}





Program Conjugaison;
uses crt;
Type VbGrp1=Record
	Sujet:string;
	infinitif:string;
	Terminaison:string;
end;
Type ConjugGrp1=Array[1..6] of VbGrp1;
var
	Verbes:Text;
	VerbeConjuguer:Text;
	
//---------- Stockage des 13 verbes à l'infinitif dans un fichier "MesVerbes" ----------//
Procedure Assignation (var Verbes:Text);
Begin	
	Rewrite(Verbes);
	writeln(Verbes,'Rire');
	writeln(Verbes,'Recevoir');
	writeln(Verbes,'Aller');
	writeln(Verbes,'Bouillir');
	writeln(Verbes,'Envoyer');
	writeln(Verbes,'Peindre');
	writeln(Verbes,'Habiter');
	writeln(Verbes,'Payer');
	writeln(Verbes,'Mourir');
	writeln(Verbes,'Hair');
	writeln(Verbes,'Vouloir');
	writeln(Verbes,'Finir');
	writeln(Verbes,'S''amuser');
End;

//---------- Assignation des Sujet et terminaison des verbes du premier groupe ----------//
Procedure AssignationVrbGrp1 (var Vb:ConjugGrp1);
begin
	Vb[1].Sujet:='Je';
	Vb[2].Sujet:='Tu';
	Vb[3].Sujet:='Il,elle,on';
	Vb[4].Sujet:='Nous';
	Vb[5].Sujet:='Vous';
	Vb[6].Sujet:='Ils,elles';
	Vb[1].Terminaison:='e';
	Vb[2].Terminaison:='es';
	Vb[3].Terminaison:='e';
	Vb[4].Terminaison:='ons';
	Vb[5].Terminaison:='ez';
	Vb[6].Terminaison:='ent';
end;
//---------- Procedure d'affichage des verbes ----------//
{Procedure AffichageVbInf(var Verbes:Text);
begin	
	Reset(Verbes);
	While not EOF do
		begin
			Writeln(Verbes);
		end;
end;}

//---------- Conjugaison Verbes 1er Groupe ----------//
Procedure ConjugPremierGrp (Taille:integer;Choix:String;Vb:ConjugGrp1);
var	
	i:integer;
begin
	for i:=1 to 6 do
		Vb[i].Infinitif:=copy(Choix,0,Taille);
	for i:=1 to 6 do
		begin	
			Writeln(Vb[i].Sujet+' '+Vb[i].Infinitif+Vb[i].Terminaison);
		end;
end;

//---------- Definition des groupes ----------//
Procedure DefGroupes(var Grp:integer;Choix:string;taille:integer);
begin
	if copy(Choix,Taille+1,2)='er' then
		Grp:=1;
	if Choix='aller' then	
		Grp:=0;
end;

//---------- Assignation de la conjugaison dans un fichier ----------//
Procedure AssignationFichierVbConjug(var VerbeConjuguer:Text;Vb:ConjugGrp1;Choix:string;Taille:integer);
var
        i:integer;
begin
	Assign(VerbeConjuguer,'VbConjug.txt');
	Rewrite(VerbeConjuguer);
	for i:=1 to 6 do
		Vb[i].Infinitif:=copy(Choix,0,Taille);
	For i:=1 to 6 do
		begin
			Writeln(VerbeConjuguer,Vb[i].Sujet+' '+Vb[i].Infinitif+Vb[i].Terminaison);
		end;
	Close(VerbeConjuguer);
end;

//----------- Main ----------//
Var
	Vb:ConjugGrp1;
	fin:string;
    i,taille,Grp:integer;
	Choix,test:string;
begin
	Assign(Verbes,'MesVerbes.txt');
	Assignation(Verbes);
	AssignationVrbGrp1(Vb);
	writeln('Quel verbes voulez-vous conjuguez ?');
	Readln(Choix);
	Taille:=Length(Choix);
	Taille:=Taille-2;
	DefGroupes(Grp,Choix,taille);
	if Grp=1 then
	begin
		ConjugPremierGrp(Taille,Choix,Vb);
		AssignationFichierVbConjug(VerbeConjuguer,Vb,Choix,Taille);
	end;
	Readln;
	close(Verbes);
End.
	
