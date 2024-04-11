insert into JEUNESSE 
(contenu , duree )
select  distinct d.show_id , d.duration 
from data_netflouze.v_thematic v join data_netflouze.datanetflouze d
on v.show_id = d.show_id
where
(d.type = 'TV Show' 
and
(substr(val , instr(val ,'Kid'),3) = 'Kid' or
substr(val , instr(val ,'Teen'),4) = 'Teen'
))

or

(
d.type = 'Movie' 
and
(substr(val , instr(val ,'Children'),8) = 'Children' or
substr(val , instr(val ,'Family'),6) = 'Family'
)
)
;


 
insert into serie  
(contenu , nb_saison )
select  distinct d.show_id , d.duration 
from data_netflouze.v_thematic v join data_netflouze.datanetflouze d
on v.show_id = d.show_id
where
d.type = 'TV Show' 
and
instr(val ,'Kid')=0 
and
instr(val ,'Teen') =0
;



insert into divertissement  
(contenu , duree )
select  distinct d.show_id , d.duration 
from data_netflouze.v_thematic v join data_netflouze.datanetflouze d
on v.show_id = d.show_id
where
(d.type = 'Movie' 
and
(substr(val , instr(val ,'Stand-Up Comedy'),15) = 'Stand-Up Comedy' or
substr(val , instr(val ,'Stand-Up Comedy |&| Talk Shows'),28) = 'Stand-Up Comedy |&| Talk Shows'
))

;




insert into cinema   
(contenu , duree )
select  distinct d.show_id , d.duration 
from 
data_netflouze.v_thematic v join data_netflouze.datanetflouze d
on v.show_id = d.show_id
where
d.type = 'Movie'
and
instr(val ,'Children') =0 
and
instr(val ,'Family')=0
and 
instr(val ,'Stand-Up Comedy')=0 
and
 instr(val ,'Stand-Up Comedy |&| Talk Shows')=0
;



 insert 
 into CONTENU 
(
id,
titre, 
description,
theme , 
mots_cles, 
lienba , 
evalutation ,
age_id,
paysprod,
anneeprod
)
select 
d.show_id , 
d.title , 
d.DESCRIPTION ,
SUBSTR(d.LISTED_IN, 1, INSTR(d.LISTED_IN, '') - 1) ,
  SUBSTR(d.LISTED_IN, INSTR(d.LISTED_IN, '', 1, 1) + 1),
  null , 
  null, 
  null,
   SUBSTR(d.LISTED_IN, INSTR(d.LISTED_IN, ' ', 1, 1) + 1),
    SUBSTR(d.LISTED_IN, 1, INSTR(d.LISTED_IN, ' ') - 1) 

from data_netflouze.datanetflouze d
; 




 insert into personne (prenom_nom)
 select  distinct val 
 from data_netflouze.v_director 
 where  val is not null 
 union 
  select  distinct val 
 from data_netflouze.v_cast 
 where val is not null
  ;



insert into realise (contenu  , personne )
select  distinct v.show_id , v.val 
from data_netflouze.v_director   v join data_netflouze.datanetflouze d
on v.show_id = d.show_id 
;




insert into jouedans  (contenu  , personne )
select  distinct v.show_id , v.val 
from data_netflouze.v_cast   v join data_netflouze.datanetflouze d
on v.show_id = d.show_id 
;