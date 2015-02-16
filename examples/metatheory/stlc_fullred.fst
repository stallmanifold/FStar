(*
   Copyright 2008-2014 Catalin Hritcu, Nikhil Swamy, Microsoft Research and Inria

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)

module StlcFullRed

open StlcConstrDeBruijnParallelSub

type rstep : exp -> exp -> Type =
  | SBeta : t:ty ->
            e1:exp ->
            e2:exp ->
            rstep (EApp (EAbs t e1) e2) (subst_beta e2 e1)
  | SApp1 : #e1:exp ->
            e2:exp ->
            #e1':exp ->
            rstep e1 e1' ->
            rstep (EApp e1 e2) (EApp e1' e2)
  | SApp2 : e1:exp ->
            #e2:exp ->
            #e2':exp ->
            rstep e2 e2' ->
            rstep (EApp e1 e2) (EApp e1 e2')

(* Defining my own constructive existential *)
type ex : #a:Type -> (a -> Type) -> Type =
  | ExIntro : #a:Type -> #p:(a -> Type) -> x:a -> p x -> ex p

val progress : #e:exp{not (is_value e)} -> #t:ty -> h:rtyping empty e t ->
               Tot (ex (fun e' -> rstep e e')) (decreases h)
let rec progress _ _ h =
  match h with
  | TyApp #g #e1 #e2 #t11 #t12 h1 h2 ->
     match e1 with
     | EAbs t e1' -> ExIntro (subst_beta e2 e1') (SBeta t e1' e2)
     | _          -> (match progress h1 with
                      | ExIntro e1' h1' -> ExIntro (EApp e1' e2) (SApp1 e2 h1'))

val substitution_preserves_typing :
      x:var -> #e:exp -> #v:exp -> #t_x:ty -> #t:ty -> #g:env ->
      h1:rtyping g v t_x ->
      h2:rtyping (extend g x t_x) e t ->
      Tot (rtyping g (subst_beta_gen x v e) t) (decreases e)
let rec substitution_preserves_typing x e v t_x t g h1 h2 =
  match h2 with
  | TyVar y ->
     if x=y then h1
     else if y<x then context_invariance h2 g
     else             TyVar (y-1)
  | TyAbs #g' t_y #e' #t' h21 ->
     (let h21' = typing_extensional h21 (extend (extend g 0 t_y) (x+1) t_x) in
      TyAbs t_y (substitution_preserves_typing (x+1) h1 h21'))

(* Not sure I understand this
Have: (rtyping (extend (extend g 0 t_y) (x + 1) t_x) e' t')
TS:   (rtyping (extend g (x + 1) t_x) e' t'){(%[e'] << %[e])}
*)











  | TyApp #g' #e1 #e2 #t11 #t12 h21 h22 ->
     (* CH: implicits don't work here, why? *)
    (TyApp #g #(subst_beta_gen x v e1) #(subst_beta_gen x v e2) #t11 #t12
       (substitution_preserves_typing x h1 h21)
       (substitution_preserves_typing x h1 h22))

val preservation : #e:exp -> #e':exp -> hs:rstep e e' ->
                   #g:env -> #t:ty -> ht:(rtyping g e t) ->
                   Tot (rtyping g e' t) (decreases ht)
let rec preservation e e' hs g t ht =
  let TyApp #g #e1 #e2 #t11 #t12 h1 h2 = ht in
    match hs with
    | SBeta t e1' e2' -> let TyAbs t_x hbody = h1 in
                         substitution_preserves_typing 0 h2 hbody
    | SApp1 e2' hs1   -> TyApp (preservation hs1 h1) h2
    | SApp2 e1' hs2   -> TyApp h1 (preservation hs2 h2)
