open Prims
type lcomp_with_binder =
  (FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option *
    FStar_TypeChecker_Common.lcomp)
let (report : FStar_TypeChecker_Env.env -> Prims.string Prims.list -> unit) =
  fun env  ->
    fun errs  ->
      let uu____22 = FStar_TypeChecker_Env.get_range env  in
      let uu____23 = FStar_TypeChecker_Err.failed_to_prove_specification errs
         in
      FStar_Errors.log_issue uu____22 uu____23
  
let (new_implicit_var :
  Prims.string ->
    FStar_Range.range ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * (FStar_Syntax_Syntax.ctx_uvar *
            FStar_Range.range) Prims.list * FStar_TypeChecker_Common.guard_t))
  =
  fun reason  ->
    fun r  ->
      fun env  ->
        fun k  ->
          FStar_TypeChecker_Env.new_implicit_var_aux reason r env k
            FStar_Syntax_Syntax.Strict FStar_Pervasives_Native.None
  
let (close_guard_implicits :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders ->
      FStar_TypeChecker_Common.guard_t -> FStar_TypeChecker_Common.guard_t)
  =
  fun env  ->
    fun xs  ->
      fun g  ->
        let uu____84 =
          let uu____86 = FStar_Options.eager_subtyping ()  in
          FStar_All.pipe_left Prims.op_Negation uu____86  in
        if uu____84
        then g
        else
          (let uu____93 =
             FStar_All.pipe_right g.FStar_TypeChecker_Common.deferred
               (FStar_List.partition
                  (fun uu____145  ->
                     match uu____145 with
                     | (uu____152,p) ->
                         FStar_TypeChecker_Rel.flex_prob_closing env xs p))
              in
           match uu____93 with
           | (solve_now,defer) ->
               ((let uu____187 =
                   FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                     (FStar_Options.Other "Rel")
                    in
                 if uu____187
                 then
                   (FStar_Util.print_string "SOLVE BEFORE CLOSING:\n";
                    FStar_List.iter
                      (fun uu____204  ->
                         match uu____204 with
                         | (s,p) ->
                             let uu____214 =
                               FStar_TypeChecker_Rel.prob_to_string env p  in
                             FStar_Util.print2 "%s: %s\n" s uu____214)
                      solve_now;
                    FStar_Util.print_string " ...DEFERRED THE REST:\n";
                    FStar_List.iter
                      (fun uu____229  ->
                         match uu____229 with
                         | (s,p) ->
                             let uu____239 =
                               FStar_TypeChecker_Rel.prob_to_string env p  in
                             FStar_Util.print2 "%s: %s\n" s uu____239) defer;
                    FStar_Util.print_string "END\n")
                 else ());
                (let g1 =
                   FStar_TypeChecker_Rel.solve_deferred_constraints env
                     (let uu___48_247 = g  in
                      {
<<<<<<< HEAD
                        FStar_TypeChecker_Common.guard_f =
                          (uu___46_247.FStar_TypeChecker_Common.guard_f);
                        FStar_TypeChecker_Common.deferred = solve_now;
                        FStar_TypeChecker_Common.univ_ineqs =
                          (uu___46_247.FStar_TypeChecker_Common.univ_ineqs);
                        FStar_TypeChecker_Common.implicits =
                          (uu___46_247.FStar_TypeChecker_Common.implicits)
=======
                        FStar_TypeChecker_Env.guard_f =
                          (uu___48_247.FStar_TypeChecker_Env.guard_f);
                        FStar_TypeChecker_Env.deferred = solve_now;
                        FStar_TypeChecker_Env.univ_ineqs =
                          (uu___48_247.FStar_TypeChecker_Env.univ_ineqs);
                        FStar_TypeChecker_Env.implicits =
<<<<<<< HEAD
                          (uu___47_247.FStar_TypeChecker_Env.implicits)
>>>>>>> snap
=======
                          (uu___48_247.FStar_TypeChecker_Env.implicits)
>>>>>>> snap
                      })
                    in
                 let g2 =
                   let uu___51_249 = g1  in
                   {
<<<<<<< HEAD
                     FStar_TypeChecker_Common.guard_f =
                       (uu___49_249.FStar_TypeChecker_Common.guard_f);
                     FStar_TypeChecker_Common.deferred = defer;
                     FStar_TypeChecker_Common.univ_ineqs =
                       (uu___49_249.FStar_TypeChecker_Common.univ_ineqs);
                     FStar_TypeChecker_Common.implicits =
                       (uu___49_249.FStar_TypeChecker_Common.implicits)
=======
                     FStar_TypeChecker_Env.guard_f =
                       (uu___51_249.FStar_TypeChecker_Env.guard_f);
                     FStar_TypeChecker_Env.deferred = defer;
                     FStar_TypeChecker_Env.univ_ineqs =
                       (uu___51_249.FStar_TypeChecker_Env.univ_ineqs);
                     FStar_TypeChecker_Env.implicits =
<<<<<<< HEAD
                       (uu___50_249.FStar_TypeChecker_Env.implicits)
>>>>>>> snap
=======
                       (uu___51_249.FStar_TypeChecker_Env.implicits)
>>>>>>> snap
                   }  in
                 g2)))
  
let (check_uvars : FStar_Range.range -> FStar_Syntax_Syntax.typ -> unit) =
  fun r  ->
    fun t  ->
      let uvs = FStar_Syntax_Free.uvars t  in
      let uu____264 =
        let uu____266 = FStar_Util.set_is_empty uvs  in
        Prims.op_Negation uu____266  in
      if uu____264
      then
        let us =
          let uu____271 =
            let uu____275 = FStar_Util.set_elements uvs  in
            FStar_List.map
              (fun u  ->
                 FStar_Syntax_Print.uvar_to_string
                   u.FStar_Syntax_Syntax.ctx_uvar_head) uu____275
             in
          FStar_All.pipe_right uu____271 (FStar_String.concat ", ")  in
        (FStar_Options.push ();
         FStar_Options.set_option "hide_uvar_nums" (FStar_Options.Bool false);
         FStar_Options.set_option "print_implicits" (FStar_Options.Bool true);
         (let uu____294 =
            let uu____300 =
              let uu____302 = FStar_Syntax_Print.term_to_string t  in
              FStar_Util.format2
                "Unconstrained unification variables %s in type signature %s; please add an annotation"
                us uu____302
               in
            (FStar_Errors.Error_UncontrainedUnificationVar, uu____300)  in
          FStar_Errors.log_issue r uu____294);
         FStar_Options.pop ())
      else ()
  
let (extract_let_rec_annotation :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.letbinding ->
      (FStar_Syntax_Syntax.univ_names * FStar_Syntax_Syntax.typ * Prims.bool))
  =
  fun env  ->
    fun uu____325  ->
      match uu____325 with
      | { FStar_Syntax_Syntax.lbname = lbname;
          FStar_Syntax_Syntax.lbunivs = univ_vars1;
          FStar_Syntax_Syntax.lbtyp = t;
          FStar_Syntax_Syntax.lbeff = uu____336;
          FStar_Syntax_Syntax.lbdef = e;
          FStar_Syntax_Syntax.lbattrs = uu____338;
          FStar_Syntax_Syntax.lbpos = uu____339;_} ->
          let rng = FStar_Syntax_Syntax.range_of_lbname lbname  in
          let t1 = FStar_Syntax_Subst.compress t  in
          (match t1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_unknown  ->
               let uu____374 = FStar_Syntax_Subst.open_univ_vars univ_vars1 e
                  in
               (match uu____374 with
                | (univ_vars2,e1) ->
                    let env1 =
                      FStar_TypeChecker_Env.push_univ_vars env univ_vars2  in
                    let r = FStar_TypeChecker_Env.get_range env1  in
                    let rec aux e2 =
                      let e3 = FStar_Syntax_Subst.compress e2  in
                      match e3.FStar_Syntax_Syntax.n with
                      | FStar_Syntax_Syntax.Tm_meta (e4,uu____412) -> aux e4
                      | FStar_Syntax_Syntax.Tm_ascribed (e4,t2,uu____419) ->
                          FStar_Pervasives_Native.fst t2
                      | FStar_Syntax_Syntax.Tm_abs (bs,body,uu____474) ->
                          let res = aux body  in
                          let c =
                            match res with
                            | FStar_Util.Inl t2 ->
                                let uu____510 = FStar_Options.ml_ish ()  in
                                if uu____510
                                then FStar_Syntax_Util.ml_comp t2 r
                                else FStar_Syntax_Syntax.mk_Total t2
                            | FStar_Util.Inr c -> c  in
                          let t2 =
                            FStar_Syntax_Syntax.mk
                              (FStar_Syntax_Syntax.Tm_arrow (bs, c))
                              FStar_Pervasives_Native.None
                              c.FStar_Syntax_Syntax.pos
                             in
                          ((let uu____532 =
                              FStar_TypeChecker_Env.debug env1
                                FStar_Options.High
                               in
                            if uu____532
                            then
                              let uu____535 = FStar_Range.string_of_range r
                                 in
                              let uu____537 =
                                FStar_Syntax_Print.term_to_string t2  in
                              FStar_Util.print2 "(%s) Using type %s\n"
                                uu____535 uu____537
                            else ());
                           FStar_Util.Inl t2)
                      | uu____542 -> FStar_Util.Inl FStar_Syntax_Syntax.tun
                       in
                    let t2 =
                      let uu____544 = aux e1  in
                      match uu____544 with
                      | FStar_Util.Inr c ->
                          let uu____550 =
                            FStar_Syntax_Util.is_tot_or_gtot_comp c  in
                          if uu____550
                          then FStar_Syntax_Util.comp_result c
                          else
                            (let uu____555 =
                               let uu____561 =
                                 let uu____563 =
                                   FStar_Syntax_Print.comp_to_string c  in
                                 FStar_Util.format1
                                   "Expected a 'let rec' to be annotated with a value type; got a computation type %s"
                                   uu____563
                                  in
                               (FStar_Errors.Fatal_UnexpectedComputationTypeForLetRec,
                                 uu____561)
                                in
                             FStar_Errors.raise_error uu____555 rng)
                      | FStar_Util.Inl t2 -> t2  in
                    (univ_vars2, t2, true))
           | uu____572 ->
               let uu____573 =
                 FStar_Syntax_Subst.open_univ_vars univ_vars1 t1  in
               (match uu____573 with
                | (univ_vars2,t2) -> (univ_vars2, t2, false)))
  
let rec (decorated_pattern_as_term :
  FStar_Syntax_Syntax.pat ->
    (FStar_Syntax_Syntax.bv Prims.list * FStar_Syntax_Syntax.term))
  =
  fun pat  ->
    let mk1 f =
      FStar_Syntax_Syntax.mk f FStar_Pervasives_Native.None
        pat.FStar_Syntax_Syntax.p
       in
    let pat_as_arg uu____637 =
      match uu____637 with
      | (p,i) ->
          let uu____657 = decorated_pattern_as_term p  in
          (match uu____657 with
           | (vars,te) ->
               let uu____680 =
                 let uu____685 = FStar_Syntax_Syntax.as_implicit i  in
                 (te, uu____685)  in
               (vars, uu____680))
       in
    match pat.FStar_Syntax_Syntax.v with
    | FStar_Syntax_Syntax.Pat_constant c ->
        let uu____699 = mk1 (FStar_Syntax_Syntax.Tm_constant c)  in
        ([], uu____699)
    | FStar_Syntax_Syntax.Pat_wild x ->
        let uu____703 = mk1 (FStar_Syntax_Syntax.Tm_name x)  in
        ([x], uu____703)
    | FStar_Syntax_Syntax.Pat_var x ->
        let uu____707 = mk1 (FStar_Syntax_Syntax.Tm_name x)  in
        ([x], uu____707)
    | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
        let uu____730 =
          let uu____749 =
            FStar_All.pipe_right pats (FStar_List.map pat_as_arg)  in
          FStar_All.pipe_right uu____749 FStar_List.unzip  in
        (match uu____730 with
         | (vars,args) ->
             let vars1 = FStar_List.flatten vars  in
             let uu____887 =
               let uu____888 =
                 let uu____889 =
                   let uu____906 = FStar_Syntax_Syntax.fv_to_tm fv  in
                   (uu____906, args)  in
                 FStar_Syntax_Syntax.Tm_app uu____889  in
               mk1 uu____888  in
             (vars1, uu____887))
    | FStar_Syntax_Syntax.Pat_dot_term (x,e) -> ([], e)
  
let (comp_univ_opt :
  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option)
  =
  fun c  ->
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Total (uu____945,uopt) -> uopt
    | FStar_Syntax_Syntax.GTotal (uu____955,uopt) -> uopt
    | FStar_Syntax_Syntax.Comp c1 ->
        (match c1.FStar_Syntax_Syntax.comp_univs with
         | [] -> FStar_Pervasives_Native.None
         | hd1::uu____969 -> FStar_Pervasives_Native.Some hd1)
  
let (lcomp_univ_opt :
  FStar_TypeChecker_Common.lcomp ->
    (FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option *
      FStar_TypeChecker_Common.guard_t))
  =
  fun lc  ->
    let uu____984 =
      FStar_All.pipe_right lc FStar_TypeChecker_Common.lcomp_comp  in
    FStar_All.pipe_right uu____984
      (fun uu____1012  ->
         match uu____1012 with | (c,g) -> ((comp_univ_opt c), g))
  
let (destruct_wp_comp :
  FStar_Syntax_Syntax.comp_typ ->
    (FStar_Syntax_Syntax.universe * FStar_Syntax_Syntax.typ *
      FStar_Syntax_Syntax.typ))
  = fun c  -> FStar_Syntax_Util.destruct_comp c 
let (lift_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp_typ ->
      FStar_TypeChecker_Env.mlift ->
        (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun c  ->
      fun lift  ->
        let uu____1075 =
          FStar_All.pipe_right
            (let uu___166_1077 = c  in
             {
               FStar_Syntax_Syntax.comp_univs =
                 (uu___166_1077.FStar_Syntax_Syntax.comp_univs);
               FStar_Syntax_Syntax.effect_name =
                 (uu___166_1077.FStar_Syntax_Syntax.effect_name);
               FStar_Syntax_Syntax.result_typ =
                 (uu___166_1077.FStar_Syntax_Syntax.result_typ);
               FStar_Syntax_Syntax.effect_args =
                 (uu___166_1077.FStar_Syntax_Syntax.effect_args);
               FStar_Syntax_Syntax.flags = []
             }) FStar_Syntax_Syntax.mk_Comp
           in
        FStar_All.pipe_right uu____1075
          (lift.FStar_TypeChecker_Env.mlift_wp env)
  
let (join_effects :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident -> FStar_Ident.lident -> FStar_Ident.lident)
  =
  fun env  ->
    fun l1  ->
      fun l2  ->
        let uu____1098 =
          let uu____1105 = FStar_TypeChecker_Env.norm_eff_name env l1  in
          let uu____1106 = FStar_TypeChecker_Env.norm_eff_name env l2  in
          FStar_TypeChecker_Env.join env uu____1105 uu____1106  in
        match uu____1098 with | (m,uu____1108,uu____1109) -> m
  
let (join_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.lcomp ->
      FStar_TypeChecker_Common.lcomp -> FStar_Ident.lident)
  =
  fun env  ->
    fun c1  ->
      fun c2  ->
        let uu____1126 =
          (FStar_TypeChecker_Common.is_total_lcomp c1) &&
            (FStar_TypeChecker_Common.is_total_lcomp c2)
           in
        if uu____1126
        then FStar_Parser_Const.effect_Tot_lid
        else
          join_effects env c1.FStar_TypeChecker_Common.eff_name
            c2.FStar_TypeChecker_Common.eff_name
  
let (lift_comps :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
          Prims.bool ->
            (FStar_Ident.lident * FStar_Syntax_Syntax.comp *
              FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun c1  ->
      fun c2  ->
        fun b  ->
          fun b_maybe_free_in_c2  ->
            let c11 = FStar_TypeChecker_Env.unfold_effect_abbrev env c1  in
            let c21 = FStar_TypeChecker_Env.unfold_effect_abbrev env c2  in
            let uu____1181 =
              FStar_TypeChecker_Env.join env
                c11.FStar_Syntax_Syntax.effect_name
                c21.FStar_Syntax_Syntax.effect_name
               in
            match uu____1181 with
            | (m,lift1,lift2) ->
                let uu____1199 = lift_comp env c11 lift1  in
                (match uu____1199 with
                 | (c12,g1) ->
                     let uu____1214 =
                       if Prims.op_Negation b_maybe_free_in_c2
                       then lift_comp env c21 lift2
                       else
                         (let x_a =
                            match b with
                            | FStar_Pervasives_Native.None  ->
                                FStar_Syntax_Syntax.null_binder
                                  (FStar_Syntax_Util.comp_result c12)
                            | FStar_Pervasives_Native.Some x ->
                                FStar_Syntax_Syntax.mk_binder x
                             in
                          let env_x =
                            FStar_TypeChecker_Env.push_binders env [x_a]  in
                          let uu____1253 = lift_comp env_x c21 lift2  in
                          match uu____1253 with
                          | (c22,g2) ->
                              let uu____1264 =
                                FStar_TypeChecker_Env.close_guard env 
                                  [x_a] g2
                                 in
                              (c22, uu____1264))
                        in
                     (match uu____1214 with
                      | (c22,g2) ->
                          let uu____1287 =
                            FStar_TypeChecker_Env.conj_guard g1 g2  in
                          (m, c12, c22, uu____1287)))
  
let (is_pure_effect :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> Prims.bool) =
  fun env  ->
    fun l  ->
      let l1 = FStar_TypeChecker_Env.norm_eff_name env l  in
      FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid
  
let (is_pure_or_ghost_effect :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> Prims.bool) =
  fun env  ->
    fun l  ->
      let l1 = FStar_TypeChecker_Env.norm_eff_name env l  in
      (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid) ||
        (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_GHOST_lid)
  
let (mk_comp_l :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  =
  fun mname  ->
    fun u_result  ->
      fun result  ->
        fun wp  ->
          fun flags  ->
            let uu____1348 =
              let uu____1349 =
                let uu____1360 = FStar_Syntax_Syntax.as_arg wp  in
                [uu____1360]  in
              {
                FStar_Syntax_Syntax.comp_univs = [u_result];
                FStar_Syntax_Syntax.effect_name = mname;
                FStar_Syntax_Syntax.result_typ = result;
                FStar_Syntax_Syntax.effect_args = uu____1349;
                FStar_Syntax_Syntax.flags = flags
              }  in
            FStar_Syntax_Syntax.mk_Comp uu____1348
  
let (mk_comp :
  FStar_Syntax_Syntax.eff_decl ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  = fun md  -> mk_comp_l md.FStar_Syntax_Syntax.mname 
let (lax_mk_tot_or_comp_l :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  =
  fun mname  ->
    fun u_result  ->
      fun result  ->
        fun flags  ->
          let uu____1444 =
            FStar_Ident.lid_equals mname FStar_Parser_Const.effect_Tot_lid
             in
          if uu____1444
          then
            FStar_Syntax_Syntax.mk_Total' result
              (FStar_Pervasives_Native.Some u_result)
          else mk_comp_l mname u_result result FStar_Syntax_Syntax.tun flags
  
let (is_function : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t  ->
    let uu____1456 =
      let uu____1457 = FStar_Syntax_Subst.compress t  in
      uu____1457.FStar_Syntax_Syntax.n  in
    match uu____1456 with
    | FStar_Syntax_Syntax.Tm_arrow uu____1461 -> true
    | uu____1477 -> false
  
let (label :
  Prims.string ->
    FStar_Range.range -> FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun reason  ->
    fun r  ->
      fun f  ->
        FStar_Syntax_Syntax.mk
          (FStar_Syntax_Syntax.Tm_meta
             (f, (FStar_Syntax_Syntax.Meta_labeled (reason, r, false))))
          FStar_Pervasives_Native.None f.FStar_Syntax_Syntax.pos
  
let (label_opt :
  FStar_TypeChecker_Env.env ->
    (unit -> Prims.string) FStar_Pervasives_Native.option ->
      FStar_Range.range -> FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun env  ->
    fun reason  ->
      fun r  ->
        fun f  ->
          match reason with
          | FStar_Pervasives_Native.None  -> f
          | FStar_Pervasives_Native.Some reason1 ->
              let uu____1547 =
                let uu____1549 = FStar_TypeChecker_Env.should_verify env  in
                FStar_All.pipe_left Prims.op_Negation uu____1549  in
              if uu____1547
              then f
              else (let uu____1556 = reason1 ()  in label uu____1556 r f)
  
let (label_guard :
  FStar_Range.range ->
    Prims.string ->
      FStar_TypeChecker_Common.guard_t -> FStar_TypeChecker_Common.guard_t)
  =
  fun r  ->
    fun reason  ->
      fun g  ->
        match g.FStar_TypeChecker_Common.guard_f with
        | FStar_TypeChecker_Common.Trivial  -> g
        | FStar_TypeChecker_Common.NonTrivial f ->
<<<<<<< HEAD
<<<<<<< HEAD
            let uu___243_1577 = g  in
            let uu____1578 =
              let uu____1579 = label reason r f  in
              FStar_TypeChecker_Common.NonTrivial uu____1579  in
            {
              FStar_TypeChecker_Common.guard_f = uu____1578;
              FStar_TypeChecker_Common.deferred =
                (uu___243_1577.FStar_TypeChecker_Common.deferred);
              FStar_TypeChecker_Common.univ_ineqs =
                (uu___243_1577.FStar_TypeChecker_Common.univ_ineqs);
              FStar_TypeChecker_Common.implicits =
                (uu___243_1577.FStar_TypeChecker_Common.implicits)
=======
            let uu___241_1627 = g  in
=======
            let uu___242_1627 = g  in
>>>>>>> snap
            let uu____1628 =
              let uu____1629 = label reason r f  in
              FStar_TypeChecker_Common.NonTrivial uu____1629  in
            {
              FStar_TypeChecker_Env.guard_f = uu____1628;
              FStar_TypeChecker_Env.deferred =
                (uu___242_1627.FStar_TypeChecker_Env.deferred);
              FStar_TypeChecker_Env.univ_ineqs =
                (uu___242_1627.FStar_TypeChecker_Env.univ_ineqs);
              FStar_TypeChecker_Env.implicits =
<<<<<<< HEAD
                (uu___241_1627.FStar_TypeChecker_Env.implicits)
>>>>>>> snap
=======
                (uu___242_1627.FStar_TypeChecker_Env.implicits)
>>>>>>> snap
            }
  
let (close_wp_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun bvs  ->
      fun c  ->
        let uu____1600 = FStar_Syntax_Util.is_ml_comp c  in
        if uu____1600
        then c
        else
          (let uu____1605 =
             env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ())  in
           if uu____1605
           then c
           else
             (let close_wp u_res md res_t bvs1 wp0 =
                let uu____1646 =
                  FStar_Syntax_Util.get_match_with_close_wps
                    md.FStar_Syntax_Syntax.match_wps
                   in
                match uu____1646 with
                | (uu____1655,uu____1656,close1) ->
                    FStar_List.fold_right
                      (fun x  ->
                         fun wp  ->
                           let bs =
                             let uu____1679 = FStar_Syntax_Syntax.mk_binder x
                                in
                             [uu____1679]  in
                           let us =
                             let uu____1701 =
                               let uu____1704 =
                                 env.FStar_TypeChecker_Env.universe_of env
                                   x.FStar_Syntax_Syntax.sort
                                  in
                               [uu____1704]  in
                             u_res :: uu____1701  in
                           let wp1 =
                             FStar_Syntax_Util.abs bs wp
                               (FStar_Pervasives_Native.Some
                                  (FStar_Syntax_Util.mk_residual_comp
                                     FStar_Parser_Const.effect_Tot_lid
                                     FStar_Pervasives_Native.None
                                     [FStar_Syntax_Syntax.TOTAL]))
                              in
                           let uu____1710 =
                             let uu____1715 =
                               FStar_TypeChecker_Env.inst_effect_fun_with us
                                 env md close1
                                in
                             let uu____1716 =
                               let uu____1717 =
                                 FStar_Syntax_Syntax.as_arg res_t  in
                               let uu____1726 =
                                 let uu____1737 =
                                   FStar_Syntax_Syntax.as_arg
                                     x.FStar_Syntax_Syntax.sort
                                    in
                                 let uu____1746 =
                                   let uu____1757 =
                                     FStar_Syntax_Syntax.as_arg wp1  in
                                   [uu____1757]  in
                                 uu____1737 :: uu____1746  in
                               uu____1717 :: uu____1726  in
                             FStar_Syntax_Syntax.mk_Tm_app uu____1715
                               uu____1716
                              in
                           uu____1710 FStar_Pervasives_Native.None
                             wp0.FStar_Syntax_Syntax.pos) bvs1 wp0
                 in
              let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
              let uu____1799 = destruct_wp_comp c1  in
              match uu____1799 with
              | (u_res_t,res_t,wp) ->
                  let md =
                    FStar_TypeChecker_Env.get_effect_decl env
                      c1.FStar_Syntax_Syntax.effect_name
                     in
                  let wp1 = close_wp u_res_t md res_t bvs wp  in
                  mk_comp md u_res_t c1.FStar_Syntax_Syntax.result_typ wp1
                    c1.FStar_Syntax_Syntax.flags))
  
let (close_wp_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_TypeChecker_Common.lcomp -> FStar_TypeChecker_Common.lcomp)
  =
  fun env  ->
    fun bvs  ->
      fun lc  ->
        let bs =
          FStar_All.pipe_right bvs
            (FStar_List.map FStar_Syntax_Syntax.mk_binder)
           in
        FStar_All.pipe_right lc
          (FStar_TypeChecker_Common.apply_lcomp (close_wp_comp env bvs)
             (fun g  ->
                let uu____1839 =
                  FStar_All.pipe_right g
                    (FStar_TypeChecker_Env.close_guard env bs)
                   in
                FStar_All.pipe_right uu____1839
                  (close_guard_implicits env bs)))
  
let (close_layered_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_Syntax_Syntax.term Prims.list ->
        FStar_TypeChecker_Common.lcomp -> FStar_TypeChecker_Common.lcomp)
  =
  fun env  ->
    fun bvs  ->
      fun tms  ->
        fun lc  ->
          let bs =
            FStar_All.pipe_right bvs
              (FStar_List.map FStar_Syntax_Syntax.mk_binder)
             in
          let substs =
            FStar_List.map2
              (fun bv  -> fun tm  -> FStar_Syntax_Syntax.NT (bv, tm)) bvs tms
             in
          FStar_All.pipe_right lc
            (FStar_TypeChecker_Common.apply_lcomp
               (FStar_Syntax_Subst.subst_comp substs)
               (fun g  ->
                  let uu____1888 =
                    FStar_All.pipe_right g
                      (FStar_TypeChecker_Env.close_guard env bs)
                     in
                  FStar_All.pipe_right uu____1888
                    (close_guard_implicits env bs)))
  
let (close_wp_comp_if_refinement_t :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.bv ->
        FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun t  ->
      fun x  ->
        fun c  ->
          let t1 =
            FStar_TypeChecker_Normalize.normalize_refinement
              FStar_TypeChecker_Normalize.whnf_steps env t
             in
          match t1.FStar_Syntax_Syntax.n with
          | FStar_Syntax_Syntax.Tm_refine
              ({ FStar_Syntax_Syntax.ppname = uu____1911;
                 FStar_Syntax_Syntax.index = uu____1912;
                 FStar_Syntax_Syntax.sort =
                   { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                     FStar_Syntax_Syntax.pos = uu____1914;
                     FStar_Syntax_Syntax.vars = uu____1915;_};_},uu____1916)
              when
              FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid ->
              close_wp_comp env [x] c
          | uu____1924 -> c
  
let (should_not_inline_lc : FStar_TypeChecker_Common.lcomp -> Prims.bool) =
  fun lc  ->
    FStar_All.pipe_right lc.FStar_TypeChecker_Common.cflags
      (FStar_Util.for_some
         (fun uu___0_1936  ->
            match uu___0_1936 with
            | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  -> true
            | uu____1939 -> false))
  
let (should_return :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
      FStar_TypeChecker_Common.lcomp -> Prims.bool)
  =
  fun env  ->
    fun eopt  ->
      fun lc  ->
        let lc_is_unit_or_effectful =
          let uu____1964 =
            let uu____1967 =
              FStar_All.pipe_right lc.FStar_TypeChecker_Common.res_typ
                FStar_Syntax_Util.arrow_formals_comp
               in
            FStar_All.pipe_right uu____1967 FStar_Pervasives_Native.snd  in
          FStar_All.pipe_right uu____1964
            (fun c  ->
               (let uu____2023 =
                  FStar_TypeChecker_Env.is_reifiable_comp env c  in
                Prims.op_Negation uu____2023) &&
                 ((FStar_All.pipe_right (FStar_Syntax_Util.comp_result c)
                     FStar_Syntax_Util.is_unit)
                    ||
                    (let uu____2027 =
                       FStar_Syntax_Util.is_pure_or_ghost_comp c  in
                     Prims.op_Negation uu____2027)))
           in
        match eopt with
        | FStar_Pervasives_Native.None  -> false
        | FStar_Pervasives_Native.Some e ->
            (((FStar_TypeChecker_Common.is_pure_or_ghost_lcomp lc) &&
                (Prims.op_Negation lc_is_unit_or_effectful))
               &&
               (let uu____2038 = FStar_Syntax_Util.head_and_args' e  in
                match uu____2038 with
                | (head1,uu____2055) ->
                    let uu____2076 =
                      let uu____2077 = FStar_Syntax_Util.un_uinst head1  in
                      uu____2077.FStar_Syntax_Syntax.n  in
                    (match uu____2076 with
                     | FStar_Syntax_Syntax.Tm_fvar fv ->
                         let uu____2082 =
                           let uu____2084 = FStar_Syntax_Syntax.lid_of_fv fv
                              in
                           FStar_TypeChecker_Env.is_irreducible env
                             uu____2084
                            in
                         Prims.op_Negation uu____2082
                     | uu____2085 -> true)))
              &&
              (let uu____2088 = should_not_inline_lc lc  in
               Prims.op_Negation uu____2088)
  
let (return_value :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.typ ->
        FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun u_t_opt  ->
      fun t  ->
        fun v1  ->
          let c =
            let uu____2116 =
              let uu____2118 =
                FStar_TypeChecker_Env.lid_exists env
                  FStar_Parser_Const.effect_GTot_lid
                 in
              FStar_All.pipe_left Prims.op_Negation uu____2118  in
            if uu____2116
            then FStar_Syntax_Syntax.mk_Total t
            else
              (let uu____2125 = FStar_Syntax_Util.is_unit t  in
               if uu____2125
               then
                 FStar_Syntax_Syntax.mk_Total' t
                   (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.U_zero)
               else
                 (let m =
                    FStar_TypeChecker_Env.get_effect_decl env
                      FStar_Parser_Const.effect_PURE_lid
                     in
                  let u_t =
                    match u_t_opt with
                    | FStar_Pervasives_Native.None  ->
                        env.FStar_TypeChecker_Env.universe_of env t
                    | FStar_Pervasives_Native.Some u_t -> u_t  in
                  let wp =
                    let uu____2134 =
                      env.FStar_TypeChecker_Env.lax &&
                        (FStar_Options.ml_ish ())
                       in
                    if uu____2134
                    then FStar_Syntax_Syntax.tun
                    else
                      (let uu____2139 =
                         FStar_TypeChecker_Env.wp_signature env
                           FStar_Parser_Const.effect_PURE_lid
                          in
                       match uu____2139 with
                       | (a,kwp) ->
                           let k =
                             FStar_Syntax_Subst.subst
                               [FStar_Syntax_Syntax.NT (a, t)] kwp
                              in
                           let uu____2149 =
                             let uu____2150 =
                               let uu____2155 =
                                 FStar_TypeChecker_Env.inst_effect_fun_with
                                   [u_t] env m m.FStar_Syntax_Syntax.ret_wp
                                  in
                               let uu____2156 =
                                 let uu____2157 =
                                   FStar_Syntax_Syntax.as_arg t  in
                                 let uu____2166 =
                                   let uu____2177 =
                                     FStar_Syntax_Syntax.as_arg v1  in
                                   [uu____2177]  in
                                 uu____2157 :: uu____2166  in
                               FStar_Syntax_Syntax.mk_Tm_app uu____2155
                                 uu____2156
                                in
                             uu____2150 FStar_Pervasives_Native.None
                               v1.FStar_Syntax_Syntax.pos
                              in
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.NoFullNorm] env uu____2149)
                     in
                  mk_comp m u_t t wp [FStar_Syntax_Syntax.RETURN]))
             in
          (let uu____2211 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "Return")
              in
           if uu____2211
           then
             let uu____2216 =
               FStar_Range.string_of_range v1.FStar_Syntax_Syntax.pos  in
             let uu____2218 = FStar_Syntax_Print.term_to_string v1  in
             let uu____2220 =
               FStar_TypeChecker_Normalize.comp_to_string env c  in
             FStar_Util.print3 "(%s) returning %s at comp type %s\n"
               uu____2216 uu____2218 uu____2220
           else ());
          c
  
let (mk_layered_bind :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.comp_typ ->
        FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
          FStar_Syntax_Syntax.comp_typ ->
            FStar_Syntax_Syntax.cflag Prims.list ->
              FStar_Range.range ->
                (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun m  ->
      fun ct1  ->
        fun b  ->
          fun ct2  ->
            fun flags  ->
              fun r1  ->
                (let uu____2278 =
                   FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                     (FStar_Options.Other "LayeredEffects")
                    in
                 if uu____2278
                 then
                   let uu____2283 =
                     let uu____2285 = FStar_Syntax_Syntax.mk_Comp ct1  in
                     FStar_Syntax_Print.comp_to_string uu____2285  in
                   let uu____2286 =
                     let uu____2288 = FStar_Syntax_Syntax.mk_Comp ct2  in
                     FStar_Syntax_Print.comp_to_string uu____2288  in
                   FStar_Util.print2 "Binding c1:%s and c2:%s {\n" uu____2283
                     uu____2286
                 else ());
                (let ed = FStar_TypeChecker_Env.get_effect_decl env m  in
                 let uu____2293 =
                   let uu____2304 =
                     FStar_List.hd ct1.FStar_Syntax_Syntax.comp_univs  in
                   let uu____2305 =
                     FStar_List.map FStar_Pervasives_Native.fst
                       ct1.FStar_Syntax_Syntax.effect_args
                      in
                   (uu____2304, (ct1.FStar_Syntax_Syntax.result_typ),
                     uu____2305)
                    in
                 match uu____2293 with
                 | (u1,t1,is1) ->
                     let uu____2339 =
                       let uu____2350 =
                         FStar_List.hd ct2.FStar_Syntax_Syntax.comp_univs  in
                       let uu____2351 =
                         FStar_List.map FStar_Pervasives_Native.fst
                           ct2.FStar_Syntax_Syntax.effect_args
                          in
                       (uu____2350, (ct2.FStar_Syntax_Syntax.result_typ),
                         uu____2351)
                        in
                     (match uu____2339 with
                      | (u2,t2,is2) ->
                          let uu____2385 =
                            FStar_TypeChecker_Env.inst_tscheme_with
                              ed.FStar_Syntax_Syntax.bind_wp [u1; u2]
                             in
                          (match uu____2385 with
                           | (uu____2394,bind_t) ->
                               let bind_t_shape_error s =
                                 let uu____2409 =
                                   let uu____2411 =
                                     FStar_Syntax_Print.term_to_string bind_t
                                      in
                                   FStar_Util.format2
                                     "bind %s does not have proper shape (reason:%s)"
                                     uu____2411 s
                                    in
                                 (FStar_Errors.Fatal_UnexpectedEffect,
                                   uu____2409)
                                  in
                               let uu____2415 =
                                 let uu____2460 =
                                   let uu____2461 =
                                     FStar_Syntax_Subst.compress bind_t  in
                                   uu____2461.FStar_Syntax_Syntax.n  in
                                 match uu____2460 with
                                 | FStar_Syntax_Syntax.Tm_arrow (bs,c) when
                                     (FStar_List.length bs) >=
                                       (Prims.of_int (4))
                                     ->
                                     let uu____2537 =
                                       FStar_Syntax_Subst.open_comp bs c  in
                                     (match uu____2537 with
                                      | (a_b::b_b::bs1,c1) ->
                                          let uu____2622 =
                                            let uu____2649 =
                                              FStar_List.splitAt
                                                ((FStar_List.length bs1) -
                                                   (Prims.of_int (2))) bs1
                                               in
                                            FStar_All.pipe_right uu____2649
                                              (fun uu____2734  ->
                                                 match uu____2734 with
                                                 | (l1,l2) ->
                                                     let uu____2815 =
                                                       FStar_List.hd l2  in
                                                     let uu____2828 =
                                                       let uu____2835 =
                                                         FStar_List.tl l2  in
                                                       FStar_List.hd
                                                         uu____2835
                                                        in
                                                     (l1, uu____2815,
                                                       uu____2828))
                                             in
                                          (match uu____2622 with
                                           | (rest_bs,f_b,g_b) ->
                                               let uu____2963 =
                                                 FStar_Syntax_Util.comp_to_comp_typ
                                                   c1
                                                  in
                                               (a_b, b_b, rest_bs, f_b, g_b,
                                                 uu____2963)))
                                 | uu____2996 ->
                                     let uu____2997 =
                                       bind_t_shape_error
                                         "Either not an arrow or not enough binders"
                                        in
                                     FStar_Errors.raise_error uu____2997 r1
                                  in
                               (match uu____2415 with
                                | (a_b,b_b,rest_bs,f_b,g_b,bind_ct) ->
                                    let uu____3122 =
                                      let uu____3129 =
                                        let uu____3130 =
                                          let uu____3131 =
                                            let uu____3138 =
                                              FStar_All.pipe_right a_b
                                                FStar_Pervasives_Native.fst
                                               in
                                            (uu____3138, t1)  in
                                          FStar_Syntax_Syntax.NT uu____3131
                                           in
                                        let uu____3149 =
                                          let uu____3152 =
                                            let uu____3153 =
                                              let uu____3160 =
                                                FStar_All.pipe_right b_b
                                                  FStar_Pervasives_Native.fst
                                                 in
                                              (uu____3160, t2)  in
                                            FStar_Syntax_Syntax.NT uu____3153
                                             in
                                          [uu____3152]  in
                                        uu____3130 :: uu____3149  in
                                      FStar_TypeChecker_Env.uvars_for_binders
                                        env rest_bs uu____3129
                                        (fun b1  ->
                                           let uu____3175 =
                                             FStar_Syntax_Print.binder_to_string
                                               b1
                                              in
                                           let uu____3177 =
                                             FStar_Range.string_of_range r1
                                              in
                                           FStar_Util.format3
                                             "implicit var for binder %s of %s:bind at %s"
                                             uu____3175
                                             (ed.FStar_Syntax_Syntax.mname).FStar_Ident.str
                                             uu____3177) r1
                                       in
                                    (match uu____3122 with
                                     | (rest_bs_uvars,g_uvars) ->
                                         let subst1 =
                                           FStar_List.map2
                                             (fun b1  ->
                                                fun t  ->
                                                  let uu____3214 =
                                                    let uu____3221 =
                                                      FStar_All.pipe_right b1
                                                        FStar_Pervasives_Native.fst
                                                       in
                                                    (uu____3221, t)  in
                                                  FStar_Syntax_Syntax.NT
                                                    uu____3214) (a_b :: b_b
                                             :: rest_bs) (t1 :: t2 ::
                                             rest_bs_uvars)
                                            in
                                         let f_guard =
                                           let f_sort_is =
                                             let uu____3248 =
                                               let uu____3249 =
                                                 let uu____3252 =
                                                   let uu____3253 =
                                                     FStar_All.pipe_right f_b
                                                       FStar_Pervasives_Native.fst
                                                      in
                                                   uu____3253.FStar_Syntax_Syntax.sort
                                                    in
                                                 FStar_Syntax_Subst.compress
                                                   uu____3252
                                                  in
                                               uu____3249.FStar_Syntax_Syntax.n
                                                in
                                             match uu____3248 with
                                             | FStar_Syntax_Syntax.Tm_app
                                                 (uu____3264,uu____3265::is)
                                                 ->
                                                 let uu____3307 =
                                                   FStar_All.pipe_right is
                                                     (FStar_List.map
                                                        FStar_Pervasives_Native.fst)
                                                    in
                                                 FStar_All.pipe_right
                                                   uu____3307
                                                   (FStar_List.map
                                                      (FStar_Syntax_Subst.subst
                                                         subst1))
                                             | uu____3340 ->
                                                 let uu____3341 =
                                                   bind_t_shape_error
                                                     "f's type is not a repr type"
                                                    in
                                                 FStar_Errors.raise_error
                                                   uu____3341 r1
                                              in
                                           FStar_List.fold_left2
                                             (fun g  ->
                                                fun i1  ->
                                                  fun f_i1  ->
                                                    let uu____3357 =
                                                      FStar_TypeChecker_Rel.teq
                                                        env i1 f_i1
                                                       in
                                                    FStar_TypeChecker_Env.conj_guard
                                                      g uu____3357)
                                             FStar_TypeChecker_Env.trivial_guard
                                             is1 f_sort_is
                                            in
                                         let g_guard =
                                           let x_a =
                                             match b with
                                             | FStar_Pervasives_Native.None 
                                                 ->
                                                 FStar_Syntax_Syntax.null_binder
                                                   ct1.FStar_Syntax_Syntax.result_typ
                                             | FStar_Pervasives_Native.Some x
                                                 ->
                                                 FStar_Syntax_Syntax.mk_binder
                                                   x
                                              in
                                           let g_sort_is =
                                             let uu____3376 =
                                               let uu____3377 =
                                                 let uu____3380 =
                                                   let uu____3381 =
                                                     FStar_All.pipe_right g_b
                                                       FStar_Pervasives_Native.fst
                                                      in
                                                   uu____3381.FStar_Syntax_Syntax.sort
                                                    in
                                                 FStar_Syntax_Subst.compress
                                                   uu____3380
                                                  in
                                               uu____3377.FStar_Syntax_Syntax.n
                                                in
                                             match uu____3376 with
                                             | FStar_Syntax_Syntax.Tm_arrow
                                                 (bs,c) ->
                                                 let uu____3414 =
                                                   FStar_Syntax_Subst.open_comp
                                                     bs c
                                                    in
                                                 (match uu____3414 with
                                                  | (bs1,c1) ->
                                                      let bs_subst =
                                                        let uu____3424 =
                                                          let uu____3431 =
                                                            let uu____3432 =
                                                              FStar_List.hd
                                                                bs1
                                                               in
                                                            FStar_All.pipe_right
                                                              uu____3432
                                                              FStar_Pervasives_Native.fst
                                                             in
                                                          let uu____3453 =
                                                            let uu____3456 =
                                                              FStar_All.pipe_right
                                                                x_a
                                                                FStar_Pervasives_Native.fst
                                                               in
                                                            FStar_All.pipe_right
                                                              uu____3456
                                                              FStar_Syntax_Syntax.bv_to_name
                                                             in
                                                          (uu____3431,
                                                            uu____3453)
                                                           in
                                                        FStar_Syntax_Syntax.NT
                                                          uu____3424
                                                         in
                                                      let c2 =
                                                        FStar_Syntax_Subst.subst_comp
                                                          [bs_subst] c1
                                                         in
                                                      let uu____3470 =
                                                        let uu____3471 =
                                                          FStar_Syntax_Subst.compress
                                                            (FStar_Syntax_Util.comp_result
                                                               c2)
                                                           in
                                                        uu____3471.FStar_Syntax_Syntax.n
                                                         in
                                                      (match uu____3470 with
                                                       | FStar_Syntax_Syntax.Tm_app
                                                           (uu____3476,uu____3477::is)
                                                           ->
                                                           let uu____3519 =
                                                             FStar_All.pipe_right
                                                               is
                                                               (FStar_List.map
                                                                  FStar_Pervasives_Native.fst)
                                                              in
                                                           FStar_All.pipe_right
                                                             uu____3519
                                                             (FStar_List.map
                                                                (FStar_Syntax_Subst.subst
                                                                   subst1))
                                                       | uu____3552 ->
                                                           let uu____3553 =
                                                             bind_t_shape_error
                                                               "g's type is not a repr type"
                                                              in
                                                           FStar_Errors.raise_error
                                                             uu____3553 r1))
                                             | uu____3562 ->
                                                 let uu____3563 =
                                                   bind_t_shape_error
                                                     "g's type is not an arrow"
                                                    in
                                                 FStar_Errors.raise_error
                                                   uu____3563 r1
                                              in
                                           let env_g =
                                             FStar_TypeChecker_Env.push_binders
                                               env [x_a]
                                              in
                                           let uu____3585 =
                                             FStar_List.fold_left2
                                               (fun g  ->
                                                  fun i1  ->
                                                    fun g_i1  ->
                                                      let uu____3593 =
                                                        FStar_TypeChecker_Rel.teq
                                                          env_g i1 g_i1
                                                         in
                                                      FStar_TypeChecker_Env.conj_guard
                                                        g uu____3593)
                                               FStar_TypeChecker_Env.trivial_guard
                                               is2 g_sort_is
                                              in
                                           FStar_All.pipe_right uu____3585
                                             (FStar_TypeChecker_Env.close_guard
                                                env [x_a])
                                            in
                                         let is =
                                           let uu____3609 =
                                             let uu____3610 =
                                               FStar_Syntax_Subst.compress
                                                 bind_ct.FStar_Syntax_Syntax.result_typ
                                                in
                                             uu____3610.FStar_Syntax_Syntax.n
                                              in
                                           match uu____3609 with
                                           | FStar_Syntax_Syntax.Tm_app
                                               (uu____3615,uu____3616::is) ->
                                               let uu____3658 =
                                                 FStar_All.pipe_right is
                                                   (FStar_List.map
                                                      FStar_Pervasives_Native.fst)
                                                  in
                                               FStar_All.pipe_right
                                                 uu____3658
                                                 (FStar_List.map
                                                    (FStar_Syntax_Subst.subst
                                                       subst1))
                                           | uu____3691 ->
                                               let uu____3692 =
                                                 bind_t_shape_error
                                                   "return type is not a repr type"
                                                  in
                                               FStar_Errors.raise_error
                                                 uu____3692 r1
                                            in
                                         let c =
                                           let uu____3702 =
                                             let uu____3703 =
                                               FStar_List.map
                                                 FStar_Syntax_Syntax.as_arg
                                                 is
                                                in
                                             {
                                               FStar_Syntax_Syntax.comp_univs
                                                 =
                                                 (ct2.FStar_Syntax_Syntax.comp_univs);
                                               FStar_Syntax_Syntax.effect_name
                                                 =
                                                 (ed.FStar_Syntax_Syntax.mname);
                                               FStar_Syntax_Syntax.result_typ
                                                 = t2;
                                               FStar_Syntax_Syntax.effect_args
                                                 = uu____3703;
                                               FStar_Syntax_Syntax.flags =
                                                 flags
                                             }  in
                                           FStar_Syntax_Syntax.mk_Comp
                                             uu____3702
                                            in
                                         ((let uu____3723 =
                                             FStar_All.pipe_left
                                               (FStar_TypeChecker_Env.debug
                                                  env)
                                               (FStar_Options.Other
                                                  "LayeredEffects")
                                              in
                                           if uu____3723
                                           then
                                             let uu____3728 =
                                               FStar_Syntax_Print.comp_to_string
                                                 c
                                                in
                                             FStar_Util.print1
                                               "} c after bind: %s\n"
                                               uu____3728
                                           else ());
                                          (let uu____3733 =
                                             FStar_TypeChecker_Env.conj_guards
                                               [g_uvars; f_guard; g_guard]
                                              in
                                           (c, uu____3733))))))))
  
let (mk_non_layered_bind :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.comp_typ ->
        FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
          FStar_Syntax_Syntax.comp_typ ->
            FStar_Syntax_Syntax.cflag Prims.list ->
              FStar_Range.range -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun m  ->
      fun ct1  ->
        fun b  ->
          fun ct2  ->
            fun flags  ->
              fun r1  ->
                let uu____3778 =
                  let md = FStar_TypeChecker_Env.get_effect_decl env m  in
                  let uu____3804 = FStar_TypeChecker_Env.wp_signature env m
                     in
                  match uu____3804 with
                  | (a,kwp) ->
                      let uu____3835 = destruct_wp_comp ct1  in
                      let uu____3842 = destruct_wp_comp ct2  in
                      ((md, a, kwp), uu____3835, uu____3842)
                   in
                match uu____3778 with
                | ((md,a,kwp),(u_t1,t1,wp1),(u_t2,t2,wp2)) ->
                    let bs =
                      match b with
                      | FStar_Pervasives_Native.None  ->
                          let uu____3895 = FStar_Syntax_Syntax.null_binder t1
                             in
                          [uu____3895]
                      | FStar_Pervasives_Native.Some x ->
                          let uu____3915 = FStar_Syntax_Syntax.mk_binder x
                             in
                          [uu____3915]
                       in
                    let mk_lam wp =
                      FStar_Syntax_Util.abs bs wp
                        (FStar_Pervasives_Native.Some
                           (FStar_Syntax_Util.mk_residual_comp
                              FStar_Parser_Const.effect_Tot_lid
                              FStar_Pervasives_Native.None
                              [FStar_Syntax_Syntax.TOTAL]))
                       in
                    let r11 =
                      FStar_Syntax_Syntax.mk
                        (FStar_Syntax_Syntax.Tm_constant
                           (FStar_Const.Const_range r1))
                        FStar_Pervasives_Native.None r1
                       in
                    let wp_args =
                      let uu____3962 = FStar_Syntax_Syntax.as_arg r11  in
                      let uu____3971 =
                        let uu____3982 = FStar_Syntax_Syntax.as_arg t1  in
                        let uu____3991 =
                          let uu____4002 = FStar_Syntax_Syntax.as_arg t2  in
                          let uu____4011 =
                            let uu____4022 = FStar_Syntax_Syntax.as_arg wp1
                               in
                            let uu____4031 =
                              let uu____4042 =
                                let uu____4051 = mk_lam wp2  in
                                FStar_Syntax_Syntax.as_arg uu____4051  in
                              [uu____4042]  in
                            uu____4022 :: uu____4031  in
                          uu____4002 :: uu____4011  in
                        uu____3982 :: uu____3991  in
                      uu____3962 :: uu____3971  in
                    let wp =
                      let uu____4103 =
                        let uu____4108 =
                          FStar_TypeChecker_Env.inst_effect_fun_with
                            [u_t1; u_t2] env md
                            md.FStar_Syntax_Syntax.bind_wp
                           in
                        FStar_Syntax_Syntax.mk_Tm_app uu____4108 wp_args  in
                      uu____4103 FStar_Pervasives_Native.None
                        t2.FStar_Syntax_Syntax.pos
                       in
                    mk_comp md u_t2 t2 wp flags
  
let (mk_bind :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.comp ->
          FStar_Syntax_Syntax.cflag Prims.list ->
            FStar_Range.range ->
              (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun c1  ->
      fun b  ->
        fun c2  ->
          fun flags  ->
            fun r1  ->
              let uu____4156 = lift_comps env c1 c2 b true  in
              match uu____4156 with
              | (m,c11,c21,g_lift) ->
                  let uu____4174 =
                    let uu____4179 = FStar_Syntax_Util.comp_to_comp_typ c11
                       in
                    let uu____4180 = FStar_Syntax_Util.comp_to_comp_typ c21
                       in
                    (uu____4179, uu____4180)  in
                  (match uu____4174 with
                   | (ct1,ct2) ->
                       let uu____4187 =
                         let uu____4192 =
                           FStar_TypeChecker_Env.is_layered_effect env m  in
                         if uu____4192
                         then mk_layered_bind env m ct1 b ct2 flags r1
                         else
                           (let uu____4201 =
                              mk_non_layered_bind env m ct1 b ct2 flags r1
                               in
                            (uu____4201, FStar_TypeChecker_Env.trivial_guard))
                          in
                       (match uu____4187 with
                        | (c,g_bind) ->
                            let uu____4208 =
                              FStar_TypeChecker_Env.conj_guard g_lift g_bind
                               in
                            (c, uu____4208)))
  
let (lift_wp_and_bind_with :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.cflag Prims.list ->
          (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun wp1  ->
      fun c  ->
        fun flags  ->
          let r = FStar_TypeChecker_Env.get_range env  in
          let c_eff_name =
            let uu____4244 =
              FStar_All.pipe_right c FStar_Syntax_Util.comp_effect_name  in
            FStar_All.pipe_right uu____4244
              (FStar_TypeChecker_Env.norm_eff_name env)
             in
          let edge =
            let uu____4248 =
              FStar_TypeChecker_Env.monad_leq env
                FStar_Parser_Const.effect_PURE_lid c_eff_name
               in
            match uu____4248 with
            | FStar_Pervasives_Native.Some edge -> edge
            | FStar_Pervasives_Native.None  ->
                failwith
                  (Prims.op_Hat
                     "Impossible! lift_wp_and_bind_with: did not find a lift from PURE to "
                     c_eff_name.FStar_Ident.str)
             in
          let pure_c =
            let uu____4254 =
              let uu____4255 =
                let uu____4266 =
                  FStar_All.pipe_right wp1 FStar_Syntax_Syntax.as_arg  in
                [uu____4266]  in
              {
                FStar_Syntax_Syntax.comp_univs = [FStar_Syntax_Syntax.U_zero];
                FStar_Syntax_Syntax.effect_name =
                  FStar_Parser_Const.effect_PURE_lid;
                FStar_Syntax_Syntax.result_typ = FStar_Syntax_Syntax.t_unit;
                FStar_Syntax_Syntax.effect_args = uu____4255;
                FStar_Syntax_Syntax.flags = []
              }  in
            FStar_Syntax_Syntax.mk_Comp uu____4254  in
          let uu____4299 =
            (edge.FStar_TypeChecker_Env.mlift).FStar_TypeChecker_Env.mlift_wp
              env pure_c
             in
          match uu____4299 with
          | (m_c,g_lift) ->
              let uu____4310 =
                mk_bind env pure_c FStar_Pervasives_Native.None c flags r  in
              (match uu____4310 with
               | (bind_c,g_bind) ->
                   let uu____4321 =
                     FStar_TypeChecker_Env.conj_guard g_lift g_bind  in
                   (bind_c, uu____4321))
  
let (weaken_flags :
  FStar_Syntax_Syntax.cflag Prims.list ->
    FStar_Syntax_Syntax.cflag Prims.list)
  =
  fun flags  ->
    let uu____4334 =
      FStar_All.pipe_right flags
        (FStar_Util.for_some
           (fun uu___1_4340  ->
              match uu___1_4340 with
              | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  -> true
              | uu____4343 -> false))
       in
    if uu____4334
    then [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
    else
      FStar_All.pipe_right flags
        (FStar_List.collect
           (fun uu___2_4355  ->
              match uu___2_4355 with
              | FStar_Syntax_Syntax.TOTAL  ->
                  [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
              | FStar_Syntax_Syntax.RETURN  ->
                  [FStar_Syntax_Syntax.PARTIAL_RETURN;
                  FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
              | f -> [f]))
  
let (weaken_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.term ->
        (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun c  ->
      fun formula  ->
        let uu____4383 = FStar_Syntax_Util.is_ml_comp c  in
        if uu____4383
        then (c, FStar_TypeChecker_Env.trivial_guard)
        else
          (let ct = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
           let pure_assume_wp =
             let uu____4394 =
               FStar_Syntax_Syntax.lid_as_fv
                 FStar_Parser_Const.pure_assume_wp_lid
                 (FStar_Syntax_Syntax.Delta_constant_at_level Prims.int_one)
                 FStar_Pervasives_Native.None
                in
             FStar_Syntax_Syntax.fv_to_tm uu____4394  in
           let pure_assume_wp1 =
             let uu____4399 = FStar_TypeChecker_Env.get_range env  in
             let uu____4400 =
               let uu____4405 =
                 let uu____4406 =
                   FStar_All.pipe_left FStar_Syntax_Syntax.as_arg formula  in
                 [uu____4406]  in
               FStar_Syntax_Syntax.mk_Tm_app pure_assume_wp uu____4405  in
             uu____4400 FStar_Pervasives_Native.None uu____4399  in
           let uu____4439 = weaken_flags ct.FStar_Syntax_Syntax.flags  in
           lift_wp_and_bind_with env pure_assume_wp1 c uu____4439)
  
let (weaken_precondition :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.lcomp ->
      FStar_TypeChecker_Common.guard_formula ->
        FStar_TypeChecker_Common.lcomp)
  =
  fun env  ->
    fun lc  ->
      fun f  ->
        let weaken uu____4467 =
          let uu____4468 = FStar_TypeChecker_Common.lcomp_comp lc  in
          match uu____4468 with
          | (c,g_c) ->
              let uu____4479 =
                env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ())
                 in
              if uu____4479
              then (c, g_c)
              else
                (match f with
                 | FStar_TypeChecker_Common.Trivial  -> (c, g_c)
                 | FStar_TypeChecker_Common.NonTrivial f1 ->
                     let uu____4493 = weaken_comp env c f1  in
                     (match uu____4493 with
                      | (c1,g_w) ->
                          let uu____4504 =
                            FStar_TypeChecker_Env.conj_guard g_c g_w  in
                          (c1, uu____4504)))
           in
        let uu____4505 = weaken_flags lc.FStar_TypeChecker_Common.cflags  in
        FStar_TypeChecker_Common.mk_lcomp
          lc.FStar_TypeChecker_Common.eff_name
          lc.FStar_TypeChecker_Common.res_typ uu____4505 weaken
  
let (strengthen_comp :
  FStar_TypeChecker_Env.env ->
    (unit -> Prims.string) FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.formula ->
          FStar_Syntax_Syntax.cflag Prims.list ->
            (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun reason  ->
      fun c  ->
        fun f  ->
          fun flags  ->
            if env.FStar_TypeChecker_Env.lax
            then (c, FStar_TypeChecker_Env.trivial_guard)
            else
              (let r = FStar_TypeChecker_Env.get_range env  in
               let pure_assert_wp =
                 let uu____4562 =
                   FStar_Syntax_Syntax.lid_as_fv
                     FStar_Parser_Const.pure_assert_wp_lid
                     (FStar_Syntax_Syntax.Delta_constant_at_level
                        Prims.int_one) FStar_Pervasives_Native.None
                    in
                 FStar_Syntax_Syntax.fv_to_tm uu____4562  in
               let pure_assert_wp1 =
                 let uu____4567 =
                   let uu____4572 =
                     let uu____4573 =
                       let uu____4582 = label_opt env reason r f  in
                       FStar_All.pipe_left FStar_Syntax_Syntax.as_arg
                         uu____4582
                        in
                     [uu____4573]  in
                   FStar_Syntax_Syntax.mk_Tm_app pure_assert_wp uu____4572
                    in
                 uu____4567 FStar_Pervasives_Native.None r  in
               lift_wp_and_bind_with env pure_assert_wp1 c flags)
  
let (strengthen_precondition :
  (unit -> Prims.string) FStar_Pervasives_Native.option ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term ->
        FStar_TypeChecker_Common.lcomp ->
          FStar_TypeChecker_Common.guard_t ->
            (FStar_TypeChecker_Common.lcomp *
              FStar_TypeChecker_Common.guard_t))
  =
  fun reason  ->
    fun env  ->
      fun e_for_debugging_only  ->
        fun lc  ->
          fun g0  ->
            let uu____4652 =
              FStar_TypeChecker_Env.is_trivial_guard_formula g0  in
            if uu____4652
            then (lc, g0)
            else
              (let flags =
                 let uu____4664 =
                   let uu____4672 =
                     FStar_TypeChecker_Common.is_tot_or_gtot_lcomp lc  in
                   if uu____4672
                   then (true, [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION])
                   else (false, [])  in
                 match uu____4664 with
                 | (maybe_trivial_post,flags) ->
                     let uu____4702 =
                       FStar_All.pipe_right
                         lc.FStar_TypeChecker_Common.cflags
                         (FStar_List.collect
                            (fun uu___3_4710  ->
                               match uu___3_4710 with
                               | FStar_Syntax_Syntax.RETURN  ->
                                   [FStar_Syntax_Syntax.PARTIAL_RETURN]
                               | FStar_Syntax_Syntax.PARTIAL_RETURN  ->
                                   [FStar_Syntax_Syntax.PARTIAL_RETURN]
                               | FStar_Syntax_Syntax.SOMETRIVIAL  when
                                   Prims.op_Negation maybe_trivial_post ->
                                   [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
                               | FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION 
                                   when Prims.op_Negation maybe_trivial_post
                                   ->
                                   [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
                               | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  ->
                                   [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
                               | uu____4713 -> []))
                        in
                     FStar_List.append flags uu____4702
                  in
               let strengthen uu____4723 =
                 let uu____4724 = FStar_TypeChecker_Common.lcomp_comp lc  in
                 match uu____4724 with
                 | (c,g_c) ->
                     if env.FStar_TypeChecker_Env.lax
                     then (c, g_c)
                     else
                       (let g01 = FStar_TypeChecker_Rel.simplify_guard env g0
                           in
                        let uu____4743 = FStar_TypeChecker_Env.guard_form g01
                           in
                        match uu____4743 with
                        | FStar_TypeChecker_Common.Trivial  -> (c, g_c)
                        | FStar_TypeChecker_Common.NonTrivial f ->
                            ((let uu____4750 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  FStar_Options.Extreme
                                 in
                              if uu____4750
                              then
                                let uu____4754 =
                                  FStar_TypeChecker_Normalize.term_to_string
                                    env e_for_debugging_only
                                   in
                                let uu____4756 =
                                  FStar_TypeChecker_Normalize.term_to_string
                                    env f
                                   in
                                FStar_Util.print2
                                  "-------------Strengthening pre-condition of term %s with guard %s\n"
                                  uu____4754 uu____4756
                              else ());
                             (let uu____4761 =
                                strengthen_comp env reason c f flags  in
                              match uu____4761 with
                              | (c1,g_s) ->
                                  let uu____4772 =
                                    FStar_TypeChecker_Env.conj_guard g_c g_s
                                     in
                                  (c1, uu____4772))))
                  in
               let uu____4773 =
                 let uu____4774 =
                   FStar_TypeChecker_Env.norm_eff_name env
                     lc.FStar_TypeChecker_Common.eff_name
                    in
                 FStar_TypeChecker_Common.mk_lcomp uu____4774
                   lc.FStar_TypeChecker_Common.res_typ flags strengthen
                  in
<<<<<<< HEAD
               (uu____4773,
                 (let uu___588_4776 = g0  in
=======
               (uu____2830,
<<<<<<< HEAD
                 (let uu___414_2833 = g0  in
>>>>>>> snap
=======
                 (let uu___415_2833 = g0  in
>>>>>>> snap
                  {
                    FStar_TypeChecker_Common.guard_f =
                      FStar_TypeChecker_Common.Trivial;
<<<<<<< HEAD
                    FStar_TypeChecker_Common.deferred =
                      (uu___588_4776.FStar_TypeChecker_Common.deferred);
                    FStar_TypeChecker_Common.univ_ineqs =
                      (uu___588_4776.FStar_TypeChecker_Common.univ_ineqs);
                    FStar_TypeChecker_Common.implicits =
                      (uu___588_4776.FStar_TypeChecker_Common.implicits)
=======
                    FStar_TypeChecker_Env.deferred =
                      (uu___415_2833.FStar_TypeChecker_Env.deferred);
                    FStar_TypeChecker_Env.univ_ineqs =
                      (uu___415_2833.FStar_TypeChecker_Env.univ_ineqs);
                    FStar_TypeChecker_Env.implicits =
<<<<<<< HEAD
                      (uu___414_2833.FStar_TypeChecker_Env.implicits)
>>>>>>> snap
=======
                      (uu___415_2833.FStar_TypeChecker_Env.implicits)
>>>>>>> snap
                  })))
  
let (lcomp_has_trivial_postcondition :
  FStar_TypeChecker_Common.lcomp -> Prims.bool) =
  fun lc  ->
    (FStar_TypeChecker_Common.is_tot_or_gtot_lcomp lc) ||
      (FStar_Util.for_some
         (fun uu___4_4785  ->
            match uu___4_4785 with
            | FStar_Syntax_Syntax.SOMETRIVIAL  -> true
            | FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION  -> true
            | uu____4789 -> false) lc.FStar_TypeChecker_Common.cflags)
  
let (maybe_add_with_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option ->
      FStar_TypeChecker_Common.lcomp ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun env  ->
    fun uopt  ->
      fun lc  ->
        fun e  ->
          let uu____4818 =
            (FStar_TypeChecker_Common.is_lcomp_partial_return lc) ||
              env.FStar_TypeChecker_Env.lax
             in
          if uu____4818
          then e
          else
            (let uu____4825 =
               (lcomp_has_trivial_postcondition lc) &&
                 (let uu____4828 =
                    FStar_TypeChecker_Env.try_lookup_lid env
                      FStar_Parser_Const.with_type_lid
                     in
                  FStar_Option.isSome uu____4828)
                in
             if uu____4825
             then
               let u =
                 match uopt with
                 | FStar_Pervasives_Native.Some u -> u
                 | FStar_Pervasives_Native.None  ->
                     env.FStar_TypeChecker_Env.universe_of env
                       lc.FStar_TypeChecker_Common.res_typ
                  in
               FStar_Syntax_Util.mk_with_type u
                 lc.FStar_TypeChecker_Common.res_typ e
             else e)
  
let (bind :
  FStar_Range.range ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
        FStar_TypeChecker_Common.lcomp ->
          lcomp_with_binder -> FStar_TypeChecker_Common.lcomp)
  =
  fun r1  ->
    fun env  ->
      fun e1opt  ->
        fun lc1  ->
          fun uu____4881  ->
            match uu____4881 with
            | (b,lc2) ->
                let debug1 f =
                  let uu____4901 =
                    (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
                      ||
                      (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "bind"))
                     in
                  if uu____4901 then f () else ()  in
                let lc11 =
                  FStar_TypeChecker_Normalize.ghost_to_pure_lcomp env lc1  in
                let lc21 =
                  FStar_TypeChecker_Normalize.ghost_to_pure_lcomp env lc2  in
                let joined_eff = join_lcomp env lc11 lc21  in
                let bind_flags =
                  let uu____4914 =
                    (should_not_inline_lc lc11) ||
                      (should_not_inline_lc lc21)
                     in
                  if uu____4914
                  then [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
                  else
                    (let flags =
                       let uu____4924 =
                         FStar_TypeChecker_Common.is_total_lcomp lc11  in
                       if uu____4924
                       then
                         let uu____4929 =
                           FStar_TypeChecker_Common.is_total_lcomp lc21  in
                         (if uu____4929
                          then [FStar_Syntax_Syntax.TOTAL]
                          else
                            (let uu____4936 =
                               FStar_TypeChecker_Common.is_tot_or_gtot_lcomp
                                 lc21
                                in
                             if uu____4936
                             then [FStar_Syntax_Syntax.SOMETRIVIAL]
                             else []))
                       else
                         (let uu____4945 =
                            (FStar_TypeChecker_Common.is_tot_or_gtot_lcomp
                               lc11)
                              &&
                              (FStar_TypeChecker_Common.is_tot_or_gtot_lcomp
                                 lc21)
                             in
                          if uu____4945
                          then [FStar_Syntax_Syntax.SOMETRIVIAL]
                          else [])
                        in
                     let uu____4952 = lcomp_has_trivial_postcondition lc21
                        in
                     if uu____4952
                     then FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION :: flags
                     else flags)
                   in
                let bind_it uu____4968 =
                  let uu____4969 =
                    env.FStar_TypeChecker_Env.lax &&
                      (FStar_Options.ml_ish ())
                     in
                  if uu____4969
                  then
                    let u_t =
                      env.FStar_TypeChecker_Env.universe_of env
                        lc21.FStar_TypeChecker_Common.res_typ
                       in
                    let uu____4977 =
                      lax_mk_tot_or_comp_l joined_eff u_t
                        lc21.FStar_TypeChecker_Common.res_typ []
                       in
                    (uu____4977, FStar_TypeChecker_Env.trivial_guard)
                  else
<<<<<<< HEAD
                    (let uu____4980 =
                       FStar_TypeChecker_Common.lcomp_comp lc11  in
                     match uu____4980 with
                     | (c1,g_c1) ->
                         let uu____4991 =
                           FStar_TypeChecker_Common.lcomp_comp lc21  in
                         (match uu____4991 with
                          | (c2,g_c2) ->
                              (debug1
                                 (fun uu____5011  ->
                                    let uu____5012 =
                                      FStar_Syntax_Print.comp_to_string c1
                                       in
                                    let uu____5014 =
                                      match b with
                                      | FStar_Pervasives_Native.None  ->
                                          "none"
                                      | FStar_Pervasives_Native.Some x ->
                                          FStar_Syntax_Print.bv_to_string x
                                       in
                                    let uu____5019 =
                                      FStar_Syntax_Print.comp_to_string c2
                                       in
                                    FStar_Util.print3
                                      "(1) bind: \n\tc1=%s\n\tx=%s\n\tc2=%s\n(1. end bind)\n"
                                      uu____5012 uu____5014 uu____5019);
                               (let aux uu____5037 =
                                  let uu____5038 =
                                    FStar_Syntax_Util.is_trivial_wp c1  in
                                  if uu____5038
                                  then
                                    match b with
=======
                    (let c1 = FStar_Syntax_Syntax.lcomp_comp lc11  in
                     let c2 = FStar_Syntax_Syntax.lcomp_comp lc21  in
                     debug1
                       (fun uu____3039  ->
                          let uu____3040 =
                            FStar_Syntax_Print.comp_to_string c1  in
                          let uu____3042 =
                            match b with
                            | FStar_Pervasives_Native.None  -> "none"
                            | FStar_Pervasives_Native.Some x ->
                                FStar_Syntax_Print.bv_to_string x
                             in
                          let uu____3047 =
                            FStar_Syntax_Print.comp_to_string c2  in
                          FStar_Util.print3
                            "(1) bind: \n\tc1=%s\n\tx=%s\n\tc2=%s\n(1. end bind)\n"
                            uu____3040 uu____3042 uu____3047);
                     (let aux uu____3065 =
                        let uu____3066 = FStar_Syntax_Util.is_trivial_wp c1
                           in
                        if uu____3066
                        then
                          match b with
                          | FStar_Pervasives_Native.None  ->
                              FStar_Util.Inl (c2, "trivial no binder")
                          | FStar_Pervasives_Native.Some uu____3097 ->
                              let uu____3098 =
                                FStar_Syntax_Util.is_ml_comp c2  in
                              (if uu____3098
                               then FStar_Util.Inl (c2, "trivial ml")
                               else
                                 FStar_Util.Inr
                                   "c1 trivial; but c2 is not ML")
                        else
                          (let uu____3130 =
                             (FStar_Syntax_Util.is_ml_comp c1) &&
                               (FStar_Syntax_Util.is_ml_comp c2)
                              in
                           if uu____3130
                           then FStar_Util.Inl (c2, "both ml")
                           else
                             FStar_Util.Inr
                               "c1 not trivial, and both are not ML")
                         in
                      let try_simplify uu____3175 =
                        let uu____3176 =
                          let uu____3178 =
                            FStar_TypeChecker_Env.try_lookup_effect_lid env
                              FStar_Parser_Const.effect_GTot_lid
                             in
                          FStar_Option.isNone uu____3178  in
                        if uu____3176
                        then
                          let uu____3192 =
                            (FStar_Syntax_Util.is_tot_or_gtot_comp c1) &&
                              (FStar_Syntax_Util.is_tot_or_gtot_comp c2)
                             in
                          (if uu____3192
                           then
                             FStar_Util.Inl
                               (c2, "Early in prims; we don't have bind yet")
                           else
                             (let uu____3215 =
                                FStar_TypeChecker_Env.get_range env  in
                              FStar_Errors.raise_error
                                (FStar_Errors.Fatal_NonTrivialPreConditionInPrims,
                                  "Non-trivial pre-conditions very early in prims, even before we have defined the PURE monad")
                                uu____3215))
                        else
                          (let uu____3230 =
                             FStar_Syntax_Util.is_total_comp c1  in
                           if uu____3230
                           then
                             let close1 x reason c =
                               let x1 =
                                 let uu___481_3272 = x  in
                                 {
                                   FStar_Syntax_Syntax.ppname =
                                     (uu___481_3272.FStar_Syntax_Syntax.ppname);
                                   FStar_Syntax_Syntax.index =
                                     (uu___481_3272.FStar_Syntax_Syntax.index);
                                   FStar_Syntax_Syntax.sort =
                                     (FStar_Syntax_Util.comp_result c1)
                                 }  in
                               let uu____3273 =
                                 let uu____3279 =
                                   close_comp_if_refinement_t env
                                     x1.FStar_Syntax_Syntax.sort x1 c
                                    in
                                 (uu____3279, reason)  in
                               FStar_Util.Inl uu____3273  in
                             match (e1opt, b) with
                             | (FStar_Pervasives_Native.Some
                                e,FStar_Pervasives_Native.Some x) ->
                                 let uu____3315 =
                                   FStar_All.pipe_right c2
                                     (FStar_Syntax_Subst.subst_comp
                                        [FStar_Syntax_Syntax.NT (x, e)])
                                    in
                                 FStar_All.pipe_right uu____3315
                                   (close1 x "c1 Tot")
                             | (uu____3329,FStar_Pervasives_Native.Some x) ->
                                 FStar_All.pipe_right c2
                                   (close1 x "c1 Tot only close")
                             | (uu____3352,uu____3353) -> aux ()
                           else
                             (let uu____3368 =
                                (FStar_Syntax_Util.is_tot_or_gtot_comp c1) &&
                                  (FStar_Syntax_Util.is_tot_or_gtot_comp c2)
                                 in
                              if uu____3368
                              then
                                let uu____3381 =
                                  let uu____3387 =
                                    FStar_Syntax_Syntax.mk_GTotal
                                      (FStar_Syntax_Util.comp_result c2)
                                     in
                                  (uu____3387, "both GTot")  in
                                FStar_Util.Inl uu____3381
                              else aux ()))
                         in
                      let uu____3398 = try_simplify ()  in
                      match uu____3398 with
                      | FStar_Util.Inl (c,reason) ->
                          (debug1
                             (fun uu____3424  ->
                                let uu____3425 =
                                  FStar_Syntax_Print.comp_to_string c  in
                                FStar_Util.print2
                                  "(2) bind: Simplified (because %s) to\n\t%s\n"
                                  reason uu____3425);
                           c)
                      | FStar_Util.Inr reason ->
                          (debug1
                             (fun uu____3439  ->
                                FStar_Util.print1
                                  "(2) bind: Not simplified because %s\n"
                                  reason);
                           (let mk_bind c11 b1 c21 =
                              let uu____3461 = lift_and_destruct env c11 c21
                                 in
                              match uu____3461 with
                              | ((md,a,kwp),(u_t1,t1,wp1),(u_t2,t2,wp2)) ->
                                  let bs =
                                    match b1 with
>>>>>>> snap
                                    | FStar_Pervasives_Native.None  ->
                                        FStar_Util.Inl
                                          (c2, "trivial no binder")
                                    | FStar_Pervasives_Native.Some uu____5069
                                        ->
                                        let uu____5070 =
                                          FStar_Syntax_Util.is_ml_comp c2  in
                                        (if uu____5070
                                         then
                                           FStar_Util.Inl (c2, "trivial ml")
                                         else
                                           FStar_Util.Inr
                                             "c1 trivial; but c2 is not ML")
                                  else
                                    (let uu____5102 =
                                       (FStar_Syntax_Util.is_ml_comp c1) &&
                                         (FStar_Syntax_Util.is_ml_comp c2)
                                        in
                                     if uu____5102
                                     then FStar_Util.Inl (c2, "both ml")
                                     else
                                       FStar_Util.Inr
                                         "c1 not trivial, and both are not ML")
                                   in
                                let try_simplify uu____5147 =
                                  let uu____5148 =
                                    let uu____5150 =
                                      FStar_TypeChecker_Env.try_lookup_effect_lid
                                        env
                                        FStar_Parser_Const.effect_GTot_lid
                                       in
                                    FStar_Option.isNone uu____5150  in
                                  if uu____5148
                                  then
                                    let uu____5164 =
                                      (FStar_Syntax_Util.is_tot_or_gtot_comp
                                         c1)
                                        &&
                                        (FStar_Syntax_Util.is_tot_or_gtot_comp
                                           c2)
                                       in
                                    (if uu____5164
                                     then
                                       FStar_Util.Inl
                                         (c2,
                                           "Early in prims; we don't have bind yet")
                                     else
                                       (let uu____5187 =
                                          FStar_TypeChecker_Env.get_range env
                                           in
                                        FStar_Errors.raise_error
                                          (FStar_Errors.Fatal_NonTrivialPreConditionInPrims,
                                            "Non-trivial pre-conditions very early in prims, even before we have defined the PURE monad")
                                          uu____5187))
                                  else
                                    (let uu____5202 =
                                       FStar_Syntax_Util.is_total_comp c1  in
                                     if uu____5202
                                     then
                                       let close1 x reason c =
                                         let uu____5243 =
                                           let uu____5245 =
                                             let uu____5246 =
                                               FStar_All.pipe_right c
                                                 FStar_Syntax_Util.comp_effect_name
                                                in
                                             FStar_All.pipe_right uu____5246
                                               (FStar_TypeChecker_Env.norm_eff_name
                                                  env)
                                              in
                                           FStar_All.pipe_right uu____5245
                                             (FStar_TypeChecker_Env.is_layered_effect
                                                env)
                                            in
                                         if uu____5243
                                         then FStar_Util.Inl (c, reason)
                                         else
                                           (let x1 =
                                              let uu___659_5271 = x  in
                                              {
                                                FStar_Syntax_Syntax.ppname =
                                                  (uu___659_5271.FStar_Syntax_Syntax.ppname);
                                                FStar_Syntax_Syntax.index =
                                                  (uu___659_5271.FStar_Syntax_Syntax.index);
                                                FStar_Syntax_Syntax.sort =
                                                  (FStar_Syntax_Util.comp_result
                                                     c1)
                                              }  in
                                            let uu____5272 =
                                              let uu____5278 =
                                                close_wp_comp_if_refinement_t
                                                  env
                                                  x1.FStar_Syntax_Syntax.sort
                                                  x1 c
                                                 in
                                              (uu____5278, reason)  in
                                            FStar_Util.Inl uu____5272)
                                          in
                                       match (e1opt, b) with
                                       | (FStar_Pervasives_Native.Some
                                          e,FStar_Pervasives_Native.Some x)
                                           ->
                                           let uu____5314 =
                                             FStar_All.pipe_right c2
                                               (FStar_Syntax_Subst.subst_comp
                                                  [FStar_Syntax_Syntax.NT
                                                     (x, e)])
                                              in
                                           FStar_All.pipe_right uu____5314
                                             (close1 x "c1 Tot")
                                       | (uu____5328,FStar_Pervasives_Native.Some
                                          x) ->
                                           FStar_All.pipe_right c2
                                             (close1 x "c1 Tot only close")
                                       | (uu____5351,uu____5352) -> aux ()
                                     else
                                       (let uu____5367 =
                                          (FStar_Syntax_Util.is_tot_or_gtot_comp
                                             c1)
                                            &&
                                            (FStar_Syntax_Util.is_tot_or_gtot_comp
                                               c2)
                                           in
                                        if uu____5367
                                        then
                                          let uu____5380 =
                                            let uu____5386 =
                                              FStar_Syntax_Syntax.mk_GTotal
                                                (FStar_Syntax_Util.comp_result
                                                   c2)
                                               in
                                            (uu____5386, "both GTot")  in
                                          FStar_Util.Inl uu____5380
                                        else aux ()))
                                   in
                                let uu____5397 = try_simplify ()  in
                                match uu____5397 with
                                | FStar_Util.Inl (c,reason) ->
                                    (debug1
                                       (fun uu____5427  ->
                                          let uu____5428 =
                                            FStar_Syntax_Print.comp_to_string
                                              c
                                             in
                                          FStar_Util.print2
                                            "(2) bind: Simplified (because %s) to\n\t%s\n"
                                            reason uu____5428);
                                     (let uu____5431 =
                                        FStar_TypeChecker_Env.conj_guard g_c1
                                          g_c2
                                         in
                                      (c, uu____5431)))
                                | FStar_Util.Inr reason ->
                                    (debug1
                                       (fun uu____5443  ->
                                          FStar_Util.print1
                                            "(2) bind: Not simplified because %s\n"
                                            reason);
                                     (let mk_bind1 c11 b1 c21 =
                                        let uu____5469 =
                                          mk_bind env c11 b1 c21 bind_flags
                                            r1
                                           in
                                        match uu____5469 with
                                        | (c,g_bind) ->
                                            let uu____5480 =
                                              let uu____5481 =
                                                FStar_TypeChecker_Env.conj_guard
                                                  g_c1 g_c2
                                                 in
                                              FStar_TypeChecker_Env.conj_guard
                                                uu____5481 g_bind
                                               in
                                            (c, uu____5480)
                                         in
                                      let mk_seq c11 b1 c21 =
                                        let c12 =
                                          FStar_TypeChecker_Env.unfold_effect_abbrev
                                            env c11
                                           in
                                        let c22 =
                                          FStar_TypeChecker_Env.unfold_effect_abbrev
                                            env c21
                                           in
                                        let uu____5508 =
                                          FStar_TypeChecker_Env.join env
                                            c12.FStar_Syntax_Syntax.effect_name
                                            c22.FStar_Syntax_Syntax.effect_name
                                           in
                                        match uu____5508 with
                                        | (m,uu____5520,lift2) ->
                                            let uu____5522 =
                                              lift_comp env c22 lift2  in
                                            (match uu____5522 with
                                             | (c23,g2) ->
                                                 let uu____5533 =
                                                   destruct_wp_comp c12  in
                                                 (match uu____5533 with
                                                  | (u1,t1,wp1) ->
                                                      let md_pure_or_ghost =
                                                        FStar_TypeChecker_Env.get_effect_decl
                                                          env
                                                          c12.FStar_Syntax_Syntax.effect_name
                                                         in
                                                      let vc1 =
                                                        let uu____5551 =
                                                          let uu____5556 =
                                                            let uu____5557 =
                                                              FStar_All.pipe_right
                                                                md_pure_or_ghost.FStar_Syntax_Syntax.trivial
                                                                FStar_Util.must
                                                               in
                                                            FStar_TypeChecker_Env.inst_effect_fun_with
                                                              [u1] env
                                                              md_pure_or_ghost
                                                              uu____5557
                                                             in
                                                          let uu____5560 =
                                                            let uu____5561 =
                                                              FStar_Syntax_Syntax.as_arg
                                                                t1
                                                               in
                                                            let uu____5570 =
                                                              let uu____5581
                                                                =
                                                                FStar_Syntax_Syntax.as_arg
                                                                  wp1
                                                                 in
                                                              [uu____5581]
                                                               in
                                                            uu____5561 ::
                                                              uu____5570
                                                             in
                                                          FStar_Syntax_Syntax.mk_Tm_app
                                                            uu____5556
                                                            uu____5560
                                                           in
                                                        uu____5551
                                                          FStar_Pervasives_Native.None
                                                          r1
                                                         in
                                                      let uu____5614 =
                                                        strengthen_comp env
                                                          FStar_Pervasives_Native.None
                                                          c23 vc1 bind_flags
                                                         in
                                                      (match uu____5614 with
                                                       | (c,g_s) ->
                                                           let uu____5629 =
                                                             FStar_TypeChecker_Env.conj_guards
                                                               [g_c1;
                                                               g_c2;
                                                               g2;
                                                               g_s]
                                                              in
                                                           (c, uu____5629))))
                                         in
                                      let uu____5630 =
                                        let t =
                                          FStar_Syntax_Util.comp_result c1
                                           in
                                        match comp_univ_opt c1 with
                                        | FStar_Pervasives_Native.None  ->
                                            let uu____5646 =
                                              env.FStar_TypeChecker_Env.universe_of
                                                env t
                                               in
                                            (uu____5646, t)
                                        | FStar_Pervasives_Native.Some u ->
                                            (u, t)
                                         in
                                      match uu____5630 with
                                      | (u_res_t1,res_t1) ->
                                          let uu____5662 =
                                            (FStar_Option.isSome b) &&
                                              (should_return env e1opt lc11)
                                             in
                                          if uu____5662
                                          then
                                            let e1 = FStar_Option.get e1opt
                                               in
                                            let x = FStar_Option.get b  in
                                            let uu____5671 =
                                              FStar_Syntax_Util.is_partial_return
                                                c1
                                               in
                                            (if uu____5671
                                             then
                                               (debug1
                                                  (fun uu____5685  ->
                                                     let uu____5686 =
                                                       FStar_TypeChecker_Normalize.term_to_string
                                                         env e1
                                                        in
                                                     let uu____5688 =
                                                       FStar_Syntax_Print.bv_to_string
                                                         x
                                                        in
                                                     FStar_Util.print2
                                                       "(3) bind (case a): Substituting %s for %s"
                                                       uu____5686 uu____5688);
                                                (let c21 =
                                                   FStar_Syntax_Subst.subst_comp
                                                     [FStar_Syntax_Syntax.NT
                                                        (x, e1)] c2
                                                    in
                                                 mk_bind1 c1 b c21))
                                             else
                                               (let uu____5696 =
                                                  ((FStar_Options.vcgen_optimize_bind_as_seq
                                                      ())
                                                     &&
                                                     (lcomp_has_trivial_postcondition
                                                        lc11))
                                                    &&
                                                    (let uu____5699 =
                                                       FStar_TypeChecker_Env.try_lookup_lid
                                                         env
                                                         FStar_Parser_Const.with_type_lid
                                                        in
                                                     FStar_Option.isSome
                                                       uu____5699)
                                                   in
                                                if uu____5696
                                                then
                                                  let e1' =
                                                    let uu____5724 =
                                                      FStar_Options.vcgen_decorate_with_type
                                                        ()
                                                       in
                                                    if uu____5724
                                                    then
                                                      FStar_Syntax_Util.mk_with_type
                                                        u_res_t1 res_t1 e1
                                                    else e1  in
                                                  (debug1
                                                     (fun uu____5736  ->
                                                        let uu____5737 =
                                                          FStar_TypeChecker_Normalize.term_to_string
                                                            env e1'
                                                           in
                                                        let uu____5739 =
                                                          FStar_Syntax_Print.bv_to_string
                                                            x
                                                           in
                                                        FStar_Util.print2
                                                          "(3) bind (case b): Substituting %s for %s"
                                                          uu____5737
                                                          uu____5739);
                                                   (let c21 =
                                                      FStar_Syntax_Subst.subst_comp
                                                        [FStar_Syntax_Syntax.NT
                                                           (x, e1')] c2
                                                       in
                                                    mk_seq c1 b c21))
                                                else
                                                  (debug1
                                                     (fun uu____5754  ->
                                                        let uu____5755 =
                                                          FStar_TypeChecker_Normalize.term_to_string
                                                            env e1
                                                           in
                                                        let uu____5757 =
                                                          FStar_Syntax_Print.bv_to_string
                                                            x
                                                           in
                                                        FStar_Util.print2
                                                          "(3) bind (case c): Adding equality %s = %s"
                                                          uu____5755
                                                          uu____5757);
                                                   (let c21 =
                                                      FStar_Syntax_Subst.subst_comp
                                                        [FStar_Syntax_Syntax.NT
                                                           (x, e1)] c2
                                                       in
                                                    let x_eq_e =
                                                      let uu____5764 =
                                                        FStar_Syntax_Syntax.bv_to_name
                                                          x
                                                         in
                                                      FStar_Syntax_Util.mk_eq2
                                                        u_res_t1 res_t1 e1
                                                        uu____5764
                                                       in
                                                    let uu____5765 =
                                                      let uu____5770 =
                                                        let uu____5771 =
                                                          let uu____5772 =
                                                            FStar_Syntax_Syntax.mk_binder
                                                              x
                                                             in
                                                          [uu____5772]  in
                                                        FStar_TypeChecker_Env.push_binders
                                                          env uu____5771
                                                         in
                                                      weaken_comp uu____5770
                                                        c21 x_eq_e
                                                       in
                                                    match uu____5765 with
                                                    | (c22,g_w) ->
                                                        let uu____5797 =
                                                          mk_bind1 c1 b c22
                                                           in
                                                        (match uu____5797
                                                         with
                                                         | (c,g_bind) ->
                                                             let uu____5808 =
                                                               FStar_TypeChecker_Env.conj_guard
                                                                 g_w g_bind
                                                                in
                                                             (c, uu____5808))))))
                                          else mk_bind1 c1 b c2))))))
                   in
                FStar_TypeChecker_Common.mk_lcomp joined_eff
                  lc21.FStar_TypeChecker_Common.res_typ bind_flags bind_it
  
let (weaken_guard :
  FStar_TypeChecker_Common.guard_formula ->
    FStar_TypeChecker_Common.guard_formula ->
      FStar_TypeChecker_Common.guard_formula)
  =
  fun g1  ->
    fun g2  ->
      match (g1, g2) with
      | (FStar_TypeChecker_Common.NonTrivial
         f1,FStar_TypeChecker_Common.NonTrivial f2) ->
          let g = FStar_Syntax_Util.mk_imp f1 f2  in
          FStar_TypeChecker_Common.NonTrivial g
      | uu____5825 -> g2
  
let (maybe_assume_result_eq_pure_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp -> FStar_TypeChecker_Common.lcomp)
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        let should_return1 =
          (((Prims.op_Negation env.FStar_TypeChecker_Env.lax) &&
              (FStar_TypeChecker_Env.lid_exists env
                 FStar_Parser_Const.effect_GTot_lid))
             && (should_return env (FStar_Pervasives_Native.Some e) lc))
            &&
            (let uu____5849 =
               FStar_TypeChecker_Common.is_lcomp_partial_return lc  in
             Prims.op_Negation uu____5849)
           in
        let flags =
          if should_return1
          then
            let uu____5857 = FStar_TypeChecker_Common.is_total_lcomp lc  in
            (if uu____5857
             then FStar_Syntax_Syntax.RETURN ::
               (lc.FStar_TypeChecker_Common.cflags)
             else FStar_Syntax_Syntax.PARTIAL_RETURN ::
<<<<<<< HEAD
               (lc.FStar_TypeChecker_Common.cflags))
          else lc.FStar_TypeChecker_Common.cflags  in
        let refine1 uu____5875 =
          let uu____5876 = FStar_TypeChecker_Common.lcomp_comp lc  in
          match uu____5876 with
          | (c,g_c) ->
              let u_t =
                match comp_univ_opt c with
                | FStar_Pervasives_Native.Some u_t -> u_t
                | FStar_Pervasives_Native.None  ->
                    env.FStar_TypeChecker_Env.universe_of env
                      (FStar_Syntax_Util.comp_result c)
                 in
              let uu____5889 = FStar_Syntax_Util.is_tot_or_gtot_comp c  in
              if uu____5889
              then
                let retc =
                  return_value env (FStar_Pervasives_Native.Some u_t)
                    (FStar_Syntax_Util.comp_result c) e
                   in
                let uu____5897 =
                  let uu____5899 = FStar_Syntax_Util.is_pure_comp c  in
                  Prims.op_Negation uu____5899  in
                (if uu____5897
                 then
                   let retc1 = FStar_Syntax_Util.comp_to_comp_typ retc  in
                   let retc2 =
                     let uu___773_5908 = retc1  in
                     {
                       FStar_Syntax_Syntax.comp_univs =
                         (uu___773_5908.FStar_Syntax_Syntax.comp_univs);
                       FStar_Syntax_Syntax.effect_name =
                         FStar_Parser_Const.effect_GHOST_lid;
                       FStar_Syntax_Syntax.result_typ =
                         (uu___773_5908.FStar_Syntax_Syntax.result_typ);
                       FStar_Syntax_Syntax.effect_args =
                         (uu___773_5908.FStar_Syntax_Syntax.effect_args);
                       FStar_Syntax_Syntax.flags = flags
                     }  in
                   let uu____5909 = FStar_Syntax_Syntax.mk_Comp retc2  in
                   (uu____5909, g_c)
                 else
                   (let uu____5912 =
                      FStar_Syntax_Util.comp_set_flags retc flags  in
                    (uu____5912, g_c)))
              else
                (let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c
=======
               (lc.FStar_Syntax_Syntax.cflags))
          else lc.FStar_Syntax_Syntax.cflags  in
        let refine1 uu____4007 =
          let c = FStar_Syntax_Syntax.lcomp_comp lc  in
          let u_t =
            match comp_univ_opt c with
            | FStar_Pervasives_Native.Some u_t -> u_t
            | FStar_Pervasives_Native.None  ->
                env.FStar_TypeChecker_Env.universe_of env
                  (FStar_Syntax_Util.comp_result c)
             in
          let uu____4011 = FStar_Syntax_Util.is_tot_or_gtot_comp c  in
          if uu____4011
          then
            let retc =
              return_value env (FStar_Pervasives_Native.Some u_t)
                (FStar_Syntax_Util.comp_result c) e
               in
            let uu____4017 =
              let uu____4019 = FStar_Syntax_Util.is_pure_comp c  in
              Prims.op_Negation uu____4019  in
            (if uu____4017
             then
               let retc1 = FStar_Syntax_Util.comp_to_comp_typ retc  in
               let retc2 =
                 let uu___600_4026 = retc1  in
                 {
                   FStar_Syntax_Syntax.comp_univs =
                     (uu___600_4026.FStar_Syntax_Syntax.comp_univs);
                   FStar_Syntax_Syntax.effect_name =
                     FStar_Parser_Const.effect_GHOST_lid;
                   FStar_Syntax_Syntax.result_typ =
                     (uu___600_4026.FStar_Syntax_Syntax.result_typ);
                   FStar_Syntax_Syntax.effect_args =
                     (uu___600_4026.FStar_Syntax_Syntax.effect_args);
                   FStar_Syntax_Syntax.flags = flags
                 }  in
               FStar_Syntax_Syntax.mk_Comp retc2
             else FStar_Syntax_Util.comp_set_flags retc flags)
          else
            (let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
             let t = c1.FStar_Syntax_Syntax.result_typ  in
             let c2 = FStar_Syntax_Syntax.mk_Comp c1  in
             let x =
               FStar_Syntax_Syntax.new_bv
                 (FStar_Pervasives_Native.Some (t.FStar_Syntax_Syntax.pos)) t
                in
             let xexp = FStar_Syntax_Syntax.bv_to_name x  in
             let ret1 =
               let uu____4039 =
                 let uu____4040 =
                   return_value env (FStar_Pervasives_Native.Some u_t) t xexp
>>>>>>> snap
                    in
                 let t = c1.FStar_Syntax_Syntax.result_typ  in
                 let c2 = FStar_Syntax_Syntax.mk_Comp c1  in
                 let x =
                   FStar_Syntax_Syntax.new_bv
                     (FStar_Pervasives_Native.Some
                        (t.FStar_Syntax_Syntax.pos)) t
                    in
                 let xexp = FStar_Syntax_Syntax.bv_to_name x  in
                 let ret1 =
                   let uu____5923 =
                     let uu____5924 =
                       return_value env (FStar_Pervasives_Native.Some u_t) t
                         xexp
                        in
                     FStar_Syntax_Util.comp_set_flags uu____5924
                       [FStar_Syntax_Syntax.PARTIAL_RETURN]
                      in
                   FStar_All.pipe_left FStar_TypeChecker_Common.lcomp_of_comp
                     uu____5923
                    in
                 let eq1 = FStar_Syntax_Util.mk_eq2 u_t t xexp e  in
                 let eq_ret =
                   weaken_precondition env ret1
                     (FStar_TypeChecker_Common.NonTrivial eq1)
                    in
                 let uu____5927 =
                   let uu____5932 =
                     let uu____5933 =
                       FStar_TypeChecker_Common.lcomp_of_comp c2  in
                     bind e.FStar_Syntax_Syntax.pos env
                       FStar_Pervasives_Native.None uu____5933
                       ((FStar_Pervasives_Native.Some x), eq_ret)
                      in
                   FStar_TypeChecker_Common.lcomp_comp uu____5932  in
                 match uu____5927 with
                 | (bind_c,g_bind) ->
                     let uu____5942 =
                       FStar_Syntax_Util.comp_set_flags bind_c flags  in
                     let uu____5943 =
                       FStar_TypeChecker_Env.conj_guard g_c g_bind  in
                     (uu____5942, uu____5943))
           in
        if Prims.op_Negation should_return1
        then lc
        else
          FStar_TypeChecker_Common.mk_lcomp
            lc.FStar_TypeChecker_Common.eff_name
            lc.FStar_TypeChecker_Common.res_typ flags refine1
  
let (maybe_return_e2_and_bind :
  FStar_Range.range ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
        FStar_TypeChecker_Common.lcomp ->
          FStar_Syntax_Syntax.term ->
            lcomp_with_binder -> FStar_TypeChecker_Common.lcomp)
  =
  fun r  ->
    fun env  ->
      fun e1opt  ->
        fun lc1  ->
          fun e2  ->
            fun uu____5979  ->
              match uu____5979 with
              | (x,lc2) ->
                  let lc21 =
                    let eff1 =
                      FStar_TypeChecker_Env.norm_eff_name env
                        lc1.FStar_TypeChecker_Common.eff_name
                       in
                    let eff2 =
                      FStar_TypeChecker_Env.norm_eff_name env
                        lc2.FStar_TypeChecker_Common.eff_name
                       in
                    let uu____5991 =
                      ((let uu____5995 = is_pure_or_ghost_effect env eff1  in
                        Prims.op_Negation uu____5995) ||
                         (should_not_inline_lc lc1))
                        && (is_pure_or_ghost_effect env eff2)
                       in
                    if uu____5991
                    then maybe_assume_result_eq_pure_term env e2 lc2
                    else lc2  in
                  bind r env e1opt lc1 (x, lc21)
  
let (fvar_const :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun lid  ->
      let uu____6013 =
        let uu____6014 = FStar_TypeChecker_Env.get_range env  in
        FStar_Ident.set_lid_range lid uu____6014  in
      FStar_Syntax_Syntax.fvar uu____6013 FStar_Syntax_Syntax.delta_constant
        FStar_Pervasives_Native.None
  
let (mk_layered_conjunction :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.eff_decl ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.typ ->
            FStar_Syntax_Syntax.comp_typ ->
              FStar_Syntax_Syntax.comp_typ ->
                (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun ed  ->
      fun u_a  ->
        fun a  ->
          fun p  ->
            fun ct1  ->
              fun ct2  ->
                let uu____6059 =
                  let uu____6064 =
                    let uu____6065 =
                      FStar_All.pipe_right ed.FStar_Syntax_Syntax.match_wps
                        FStar_Util.right
                       in
                    uu____6065.FStar_Syntax_Syntax.conjunction  in
                  FStar_TypeChecker_Env.inst_tscheme_with uu____6064 [u_a]
                   in
                match uu____6059 with
                | (uu____6074,conjunction) ->
                    let uu____6076 =
                      let uu____6085 =
                        FStar_List.map FStar_Pervasives_Native.fst
                          ct1.FStar_Syntax_Syntax.effect_args
                         in
                      let uu____6100 =
                        FStar_List.map FStar_Pervasives_Native.fst
                          ct2.FStar_Syntax_Syntax.effect_args
                         in
                      (uu____6085, uu____6100)  in
                    (match uu____6076 with
                     | (is1,is2) ->
                         let uu____6133 =
                           let uu____6178 =
                             let uu____6179 =
                               FStar_Syntax_Subst.compress conjunction  in
                             uu____6179.FStar_Syntax_Syntax.n  in
                           match uu____6178 with
                           | FStar_Syntax_Syntax.Tm_abs (bs,body,uu____6228)
                               when
                               (FStar_List.length bs) >= (Prims.of_int (4))
                               ->
                               let uu____6260 =
                                 FStar_Syntax_Subst.open_term bs body  in
                               (match uu____6260 with
                                | (a_b::bs1,body1) ->
                                    let uu____6332 =
                                      FStar_List.splitAt
                                        ((FStar_List.length bs1) -
                                           (Prims.of_int (3))) bs1
                                       in
                                    (match uu____6332 with
                                     | (rest_bs,f_b::g_b::p_b::[]) ->
                                         let uu____6480 =
                                           FStar_All.pipe_right body1
                                             FStar_Syntax_Util.unascribe
                                            in
                                         (a_b, rest_bs, f_b, g_b, p_b,
                                           uu____6480)))
                           | uu____6513 -> failwith "Impossible"  in
                         (match uu____6133 with
                          | (a_b,rest_bs,f_b,g_b,p_b,body) ->
                              let uu____6633 =
                                let uu____6640 =
                                  let uu____6641 =
                                    let uu____6642 =
                                      let uu____6649 =
                                        FStar_All.pipe_right a_b
                                          FStar_Pervasives_Native.fst
                                         in
                                      (uu____6649, a)  in
                                    FStar_Syntax_Syntax.NT uu____6642  in
                                  [uu____6641]  in
                                let uu____6660 =
                                  FStar_All.pipe_right env
                                    FStar_TypeChecker_Env.get_range
                                   in
                                FStar_TypeChecker_Env.uvars_for_binders env
                                  rest_bs uu____6640
                                  (fun b  ->
                                     let uu____6666 =
                                       FStar_Syntax_Print.binder_to_string b
                                        in
                                     let uu____6668 =
                                       FStar_Ident.string_of_lid
                                         ed.FStar_Syntax_Syntax.mname
                                        in
                                     let uu____6670 =
                                       let uu____6672 =
                                         FStar_All.pipe_right env
                                           FStar_TypeChecker_Env.get_range
                                          in
                                       FStar_All.pipe_right uu____6672
                                         FStar_Range.string_of_range
                                        in
                                     FStar_Util.format3
                                       "implicit var for binder %s of %s:conjunction at %s"
                                       uu____6666 uu____6668 uu____6670)
                                  uu____6660
                                 in
                              (match uu____6633 with
                               | (rest_bs_uvars,g_uvars) ->
                                   let substs =
                                     FStar_List.map2
                                       (fun b  ->
                                          fun t  ->
                                            let uu____6709 =
                                              let uu____6716 =
                                                FStar_All.pipe_right b
                                                  FStar_Pervasives_Native.fst
                                                 in
                                              (uu____6716, t)  in
                                            FStar_Syntax_Syntax.NT uu____6709)
                                       (a_b ::
                                       (FStar_List.append rest_bs [p_b])) (a
                                       ::
                                       (FStar_List.append rest_bs_uvars [p]))
                                      in
                                   let f_guard =
                                     let f_sort_is =
                                       let uu____6755 =
                                         let uu____6756 =
                                           let uu____6759 =
                                             let uu____6760 =
                                               FStar_All.pipe_right f_b
                                                 FStar_Pervasives_Native.fst
                                                in
                                             uu____6760.FStar_Syntax_Syntax.sort
                                              in
                                           FStar_Syntax_Subst.compress
                                             uu____6759
                                            in
                                         uu____6756.FStar_Syntax_Syntax.n  in
                                       match uu____6755 with
                                       | FStar_Syntax_Syntax.Tm_app
                                           (uu____6771,uu____6772::is) ->
                                           let uu____6814 =
                                             FStar_All.pipe_right is
                                               (FStar_List.map
                                                  FStar_Pervasives_Native.fst)
                                              in
                                           FStar_All.pipe_right uu____6814
                                             (FStar_List.map
                                                (FStar_Syntax_Subst.subst
                                                   substs))
                                       | uu____6847 -> failwith "Impossible!"
                                        in
                                     FStar_List.fold_left2
                                       (fun g  ->
                                          fun i1  ->
                                            fun f_i  ->
                                              let uu____6858 =
                                                FStar_TypeChecker_Rel.teq env
                                                  i1 f_i
                                                 in
                                              FStar_TypeChecker_Env.conj_guard
                                                g uu____6858)
                                       FStar_TypeChecker_Env.trivial_guard
                                       is1 f_sort_is
                                      in
                                   let g_guard =
                                     let g_sort_is =
                                       let uu____6863 =
                                         let uu____6864 =
                                           let uu____6867 =
                                             let uu____6868 =
                                               FStar_All.pipe_right g_b
                                                 FStar_Pervasives_Native.fst
                                                in
                                             uu____6868.FStar_Syntax_Syntax.sort
                                              in
                                           FStar_Syntax_Subst.compress
                                             uu____6867
                                            in
                                         uu____6864.FStar_Syntax_Syntax.n  in
                                       match uu____6863 with
                                       | FStar_Syntax_Syntax.Tm_app
                                           (uu____6879,uu____6880::is) ->
                                           let uu____6922 =
                                             FStar_All.pipe_right is
                                               (FStar_List.map
                                                  FStar_Pervasives_Native.fst)
                                              in
                                           FStar_All.pipe_right uu____6922
                                             (FStar_List.map
                                                (FStar_Syntax_Subst.subst
                                                   substs))
                                       | uu____6955 -> failwith "Impossible!"
                                        in
                                     FStar_List.fold_left2
                                       (fun g  ->
                                          fun i2  ->
                                            fun g_i  ->
                                              let uu____6966 =
                                                FStar_TypeChecker_Rel.teq env
                                                  i2 g_i
                                                 in
                                              FStar_TypeChecker_Env.conj_guard
                                                g uu____6966)
                                       FStar_TypeChecker_Env.trivial_guard
                                       is2 g_sort_is
                                      in
                                   let body1 =
                                     FStar_Syntax_Subst.subst substs body  in
                                   let is =
                                     let uu____6971 =
                                       let uu____6972 =
                                         FStar_Syntax_Subst.compress body1
                                          in
                                       uu____6972.FStar_Syntax_Syntax.n  in
                                     match uu____6971 with
                                     | FStar_Syntax_Syntax.Tm_app
                                         (uu____6977,a1::args) ->
                                         FStar_List.map
                                           FStar_Pervasives_Native.fst args
                                     | uu____7032 -> failwith "Impossible!"
                                      in
                                   let uu____7036 =
                                     let uu____7037 =
                                       let uu____7038 =
                                         FStar_All.pipe_right is
                                           (FStar_List.map
                                              FStar_Syntax_Syntax.as_arg)
                                          in
                                       {
                                         FStar_Syntax_Syntax.comp_univs =
                                           [u_a];
                                         FStar_Syntax_Syntax.effect_name =
                                           (ed.FStar_Syntax_Syntax.mname);
                                         FStar_Syntax_Syntax.result_typ = a;
                                         FStar_Syntax_Syntax.effect_args =
                                           uu____7038;
                                         FStar_Syntax_Syntax.flags = []
                                       }  in
                                     FStar_Syntax_Syntax.mk_Comp uu____7037
                                      in
                                   let uu____7061 =
                                     let uu____7062 =
                                       FStar_TypeChecker_Env.conj_guard
                                         g_uvars f_guard
                                        in
                                     FStar_TypeChecker_Env.conj_guard
                                       uu____7062 g_guard
                                      in
                                   (uu____7036, uu____7061))))
  
let (mk_non_layered_conjunction :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.eff_decl ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.typ ->
            FStar_Syntax_Syntax.comp_typ ->
              FStar_Syntax_Syntax.comp_typ ->
                (FStar_Syntax_Syntax.comp * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun ed  ->
      fun u_a  ->
        fun a  ->
          fun p  ->
            fun ct1  ->
              fun ct2  ->
                let uu____7107 =
                  FStar_Syntax_Util.get_match_with_close_wps
                    ed.FStar_Syntax_Syntax.match_wps
                   in
                match uu____7107 with
                | (if_then_else1,uu____7119,uu____7120) ->
                    let uu____7121 = destruct_wp_comp ct1  in
                    (match uu____7121 with
                     | (uu____7132,uu____7133,wp_t) ->
                         let uu____7135 = destruct_wp_comp ct2  in
                         (match uu____7135 with
                          | (uu____7146,uu____7147,wp_e) ->
                              let wp =
                                let uu____7152 =
                                  FStar_Range.union_ranges
                                    wp_t.FStar_Syntax_Syntax.pos
                                    wp_e.FStar_Syntax_Syntax.pos
                                   in
                                let uu____7153 =
                                  let uu____7158 =
                                    FStar_TypeChecker_Env.inst_effect_fun_with
                                      [u_a] env ed if_then_else1
                                     in
                                  let uu____7159 =
                                    let uu____7160 =
                                      FStar_Syntax_Syntax.as_arg a  in
                                    let uu____7169 =
                                      let uu____7180 =
                                        FStar_Syntax_Syntax.as_arg p  in
                                      let uu____7189 =
                                        let uu____7200 =
                                          FStar_Syntax_Syntax.as_arg wp_t  in
                                        let uu____7209 =
                                          let uu____7220 =
                                            FStar_Syntax_Syntax.as_arg wp_e
                                             in
                                          [uu____7220]  in
                                        uu____7200 :: uu____7209  in
                                      uu____7180 :: uu____7189  in
                                    uu____7160 :: uu____7169  in
                                  FStar_Syntax_Syntax.mk_Tm_app uu____7158
                                    uu____7159
                                   in
                                uu____7153 FStar_Pervasives_Native.None
                                  uu____7152
                                 in
                              let uu____7269 = mk_comp ed u_a a wp []  in
                              (uu____7269,
                                FStar_TypeChecker_Env.trivial_guard)))
  
let (bind_cases :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      (FStar_Syntax_Syntax.typ * FStar_Ident.lident *
        FStar_Syntax_Syntax.cflag Prims.list *
        (Prims.bool -> FStar_TypeChecker_Common.lcomp)) Prims.list ->
        FStar_TypeChecker_Common.lcomp)
  =
  fun env  ->
    fun res_t  ->
      fun lcases  ->
        let eff =
          FStar_List.fold_left
            (fun eff  ->
               fun uu____7339  ->
                 match uu____7339 with
                 | (uu____7353,eff_label,uu____7355,uu____7356) ->
                     join_effects env eff eff_label)
            FStar_Parser_Const.effect_PURE_lid lcases
           in
        let uu____7369 =
          let uu____7377 =
            FStar_All.pipe_right lcases
              (FStar_Util.for_some
                 (fun uu____7415  ->
                    match uu____7415 with
                    | (uu____7430,uu____7431,flags,uu____7433) ->
                        FStar_All.pipe_right flags
                          (FStar_Util.for_some
                             (fun uu___5_7450  ->
                                match uu___5_7450 with
                                | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  ->
                                    true
                                | uu____7453 -> false))))
             in
          if uu____7377
          then (true, [FStar_Syntax_Syntax.SHOULD_NOT_INLINE])
          else (false, [])  in
        match uu____7369 with
        | (should_not_inline_whole_match,bind_cases_flags) ->
            let bind_cases uu____7490 =
              let u_res_t = env.FStar_TypeChecker_Env.universe_of env res_t
                 in
              let uu____7492 =
                env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ())
                 in
              if uu____7492
              then
                let uu____7499 = lax_mk_tot_or_comp_l eff u_res_t res_t []
                   in
                (uu____7499, FStar_TypeChecker_Env.trivial_guard)
              else
                (let default_case =
                   let post_k =
                     let uu____7506 =
                       let uu____7515 = FStar_Syntax_Syntax.null_binder res_t
                          in
                       [uu____7515]  in
                     let uu____7534 =
                       FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0
                        in
                     FStar_Syntax_Util.arrow uu____7506 uu____7534  in
                   let kwp =
                     let uu____7540 =
                       let uu____7549 =
                         FStar_Syntax_Syntax.null_binder post_k  in
                       [uu____7549]  in
                     let uu____7568 =
                       FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0
                        in
                     FStar_Syntax_Util.arrow uu____7540 uu____7568  in
                   let post =
                     FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
                       post_k
                      in
                   let wp =
                     let uu____7575 =
                       let uu____7576 = FStar_Syntax_Syntax.mk_binder post
                          in
                       [uu____7576]  in
                     let uu____7595 =
                       let uu____7598 =
                         let uu____7605 = FStar_TypeChecker_Env.get_range env
                            in
                         label FStar_TypeChecker_Err.exhaustiveness_check
                           uu____7605
                          in
                       let uu____7606 =
                         fvar_const env FStar_Parser_Const.false_lid  in
                       FStar_All.pipe_left uu____7598 uu____7606  in
                     FStar_Syntax_Util.abs uu____7575 uu____7595
                       (FStar_Pervasives_Native.Some
                          (FStar_Syntax_Util.mk_residual_comp
                             FStar_Parser_Const.effect_Tot_lid
                             FStar_Pervasives_Native.None
                             [FStar_Syntax_Syntax.TOTAL]))
                      in
                   let md =
                     FStar_TypeChecker_Env.get_effect_decl env
                       FStar_Parser_Const.effect_PURE_lid
                      in
                   mk_comp md u_res_t res_t wp []  in
                 let maybe_return eff_label_then cthen =
                   let uu____7630 =
                     should_not_inline_whole_match ||
                       (let uu____7633 = is_pure_or_ghost_effect env eff  in
                        Prims.op_Negation uu____7633)
                      in
                   if uu____7630 then cthen true else cthen false  in
                 let uu____7640 =
                   FStar_List.fold_right
                     (fun uu____7693  ->
                        fun uu____7694  ->
                          match (uu____7693, uu____7694) with
                          | ((g,eff_label,uu____7748,cthen),(uu____7750,celse,g_comp))
                              ->
                              let uu____7791 =
                                let uu____7796 = maybe_return eff_label cthen
                                   in
                                FStar_TypeChecker_Common.lcomp_comp
                                  uu____7796
                                 in
                              (match uu____7791 with
                               | (cthen1,gthen) ->
                                   let uu____7807 =
                                     let uu____7816 =
                                       lift_comps env cthen1 celse
                                         FStar_Pervasives_Native.None false
                                        in
                                     match uu____7816 with
                                     | (m,cthen2,celse1,g_lift) ->
                                         let md =
                                           FStar_TypeChecker_Env.get_effect_decl
                                             env m
                                            in
                                         let uu____7839 =
                                           FStar_All.pipe_right cthen2
                                             FStar_Syntax_Util.comp_to_comp_typ
                                            in
                                         let uu____7840 =
                                           FStar_All.pipe_right celse1
                                             FStar_Syntax_Util.comp_to_comp_typ
                                            in
                                         (md, uu____7839, uu____7840, g_lift)
                                      in
                                   (match uu____7807 with
                                    | (md,ct_then,ct_else,g_lift) ->
                                        let fn =
                                          if
                                            md.FStar_Syntax_Syntax.is_layered
                                          then mk_layered_conjunction
                                          else mk_non_layered_conjunction  in
                                        let uu____7914 =
                                          fn env md u_res_t res_t g ct_then
                                            ct_else
                                           in
                                        (match uu____7914 with
                                         | (c,g_conjunction) ->
                                             let uu____7929 =
                                               let uu____7930 =
                                                 let uu____7931 =
                                                   FStar_TypeChecker_Env.conj_guard
                                                     g_comp gthen
                                                    in
                                                 FStar_TypeChecker_Env.conj_guard
                                                   uu____7931 g_lift
                                                  in
                                               FStar_TypeChecker_Env.conj_guard
                                                 uu____7930 g_conjunction
                                                in
                                             ((FStar_Pervasives_Native.Some
                                                 md), c, uu____7929)))))
                     lcases
                     (FStar_Pervasives_Native.None, default_case,
                       FStar_TypeChecker_Env.trivial_guard)
                    in
                 match uu____7640 with
                 | (md,comp,g_comp) ->
                     (match lcases with
                      | [] -> (comp, g_comp)
                      | uu____7965::[] -> (comp, g_comp)
                      | uu____8008 ->
                          let uu____8025 =
                            let uu____8027 =
                              FStar_All.pipe_right md FStar_Util.must  in
                            uu____8027.FStar_Syntax_Syntax.is_layered  in
                          if uu____8025
                          then (comp, g_comp)
                          else
                            (let comp1 =
                               FStar_TypeChecker_Env.comp_to_comp_typ env
                                 comp
                                in
                             let md1 =
                               FStar_TypeChecker_Env.get_effect_decl env
                                 comp1.FStar_Syntax_Syntax.effect_name
                                in
                             let uu____8039 = destruct_wp_comp comp1  in
                             match uu____8039 with
                             | (uu____8050,uu____8051,wp) ->
                                 let uu____8053 =
                                   FStar_Syntax_Util.get_match_with_close_wps
                                     md1.FStar_Syntax_Syntax.match_wps
                                    in
                                 (match uu____8053 with
                                  | (uu____8064,ite_wp,uu____8066) ->
                                      let wp1 =
                                        let uu____8070 =
                                          let uu____8075 =
                                            FStar_TypeChecker_Env.inst_effect_fun_with
                                              [u_res_t] env md1 ite_wp
                                             in
                                          let uu____8076 =
                                            let uu____8077 =
                                              FStar_Syntax_Syntax.as_arg
                                                res_t
                                               in
                                            let uu____8086 =
                                              let uu____8097 =
                                                FStar_Syntax_Syntax.as_arg wp
                                                 in
                                              [uu____8097]  in
                                            uu____8077 :: uu____8086  in
                                          FStar_Syntax_Syntax.mk_Tm_app
                                            uu____8075 uu____8076
                                           in
                                        uu____8070
                                          FStar_Pervasives_Native.None
                                          wp.FStar_Syntax_Syntax.pos
                                         in
                                      let uu____8130 =
                                        mk_comp md1 u_res_t res_t wp1
                                          bind_cases_flags
                                         in
                                      (uu____8130, g_comp)))))
               in
            FStar_TypeChecker_Common.mk_lcomp eff res_t bind_cases_flags
              bind_cases
  
let (check_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.comp ->
          (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.comp *
            FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun e  ->
      fun c  ->
        fun c'  ->
          let uu____8164 = FStar_TypeChecker_Rel.sub_comp env c c'  in
          match uu____8164 with
          | FStar_Pervasives_Native.None  ->
              if env.FStar_TypeChecker_Env.use_eq
              then
                let uu____8180 =
                  FStar_TypeChecker_Err.computed_computation_type_does_not_match_annotation_eq
                    env e c c'
                   in
                let uu____8186 = FStar_TypeChecker_Env.get_range env  in
                FStar_Errors.raise_error uu____8180 uu____8186
              else
                (let uu____8195 =
                   FStar_TypeChecker_Err.computed_computation_type_does_not_match_annotation
                     env e c c'
                    in
                 let uu____8201 = FStar_TypeChecker_Env.get_range env  in
                 FStar_Errors.raise_error uu____8195 uu____8201)
          | FStar_Pervasives_Native.Some g -> (e, c', g)
  
let (universe_of_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.universe)
  =
  fun env  ->
    fun u_res  ->
      fun c  ->
        let c_lid =
          let uu____8226 =
            FStar_All.pipe_right c FStar_Syntax_Util.comp_effect_name  in
          FStar_All.pipe_right uu____8226
            (FStar_TypeChecker_Env.norm_eff_name env)
           in
        let uu____8229 = FStar_Syntax_Util.is_pure_or_ghost_effect c_lid  in
        if uu____8229
        then u_res
        else
          (let is_total =
             let uu____8236 =
               FStar_TypeChecker_Env.lookup_effect_quals env c_lid  in
             FStar_All.pipe_right uu____8236
               (FStar_List.existsb
                  (fun q  -> q = FStar_Syntax_Syntax.TotalEffect))
              in
           if Prims.op_Negation is_total
           then FStar_Syntax_Syntax.U_zero
           else
             (let uu____8247 = FStar_TypeChecker_Env.effect_repr env c u_res
                 in
              match uu____8247 with
              | FStar_Pervasives_Native.None  ->
                  let uu____8250 =
                    let uu____8256 =
                      let uu____8258 = FStar_Syntax_Print.lid_to_string c_lid
                         in
                      FStar_Util.format1
                        "Effect %s is marked total but does not have a repr"
                        uu____8258
                       in
                    (FStar_Errors.Fatal_EffectCannotBeReified, uu____8256)
                     in
                  FStar_Errors.raise_error uu____8250
                    c.FStar_Syntax_Syntax.pos
              | FStar_Pervasives_Native.Some tm ->
                  env.FStar_TypeChecker_Env.universe_of env tm))
  
let (check_trivial_precondition :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      (FStar_Syntax_Syntax.comp_typ * FStar_Syntax_Syntax.formula *
        FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun c  ->
      let ct =
        FStar_All.pipe_right c
          (FStar_TypeChecker_Env.unfold_effect_abbrev env)
         in
      let md =
        FStar_TypeChecker_Env.get_effect_decl env
          ct.FStar_Syntax_Syntax.effect_name
         in
      let uu____8282 = destruct_wp_comp ct  in
      match uu____8282 with
      | (u_t,t,wp) ->
          let vc =
            let uu____8301 = FStar_TypeChecker_Env.get_range env  in
            let uu____8302 =
              let uu____8307 =
                let uu____8308 =
                  FStar_All.pipe_right md.FStar_Syntax_Syntax.trivial
                    FStar_Util.must
                   in
                FStar_TypeChecker_Env.inst_effect_fun_with [u_t] env md
                  uu____8308
                 in
              let uu____8311 =
                let uu____8312 = FStar_Syntax_Syntax.as_arg t  in
                let uu____8321 =
                  let uu____8332 = FStar_Syntax_Syntax.as_arg wp  in
                  [uu____8332]  in
                uu____8312 :: uu____8321  in
              FStar_Syntax_Syntax.mk_Tm_app uu____8307 uu____8311  in
            uu____8302 FStar_Pervasives_Native.None uu____8301  in
          let uu____8365 =
            FStar_All.pipe_left FStar_TypeChecker_Env.guard_of_guard_formula
              (FStar_TypeChecker_Common.NonTrivial vc)
             in
          (ct, vc, uu____8365)
  
let (maybe_coerce_bool_to_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp))
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        fun t  ->
          if env.FStar_TypeChecker_Env.is_pattern
          then (e, lc)
          else
            (let is_type1 t1 =
               let t2 = FStar_TypeChecker_Normalize.unfold_whnf env t1  in
               let uu____8406 =
                 let uu____8407 = FStar_Syntax_Subst.compress t2  in
                 uu____8407.FStar_Syntax_Syntax.n  in
               match uu____8406 with
               | FStar_Syntax_Syntax.Tm_type uu____8411 -> true
               | uu____8413 -> false  in
             let uu____8415 =
               let uu____8416 =
                 FStar_Syntax_Util.unrefine
                   lc.FStar_TypeChecker_Common.res_typ
                  in
               uu____8416.FStar_Syntax_Syntax.n  in
             match uu____8415 with
             | FStar_Syntax_Syntax.Tm_fvar fv when
                 (FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.bool_lid)
                   && (is_type1 t)
                 ->
                 let uu____8424 =
                   FStar_TypeChecker_Env.lookup_lid env
                     FStar_Parser_Const.b2t_lid
                    in
                 let b2t1 =
                   let uu____8434 =
                     FStar_Ident.set_lid_range FStar_Parser_Const.b2t_lid
                       e.FStar_Syntax_Syntax.pos
                      in
                   FStar_Syntax_Syntax.fvar uu____8434
                     (FStar_Syntax_Syntax.Delta_constant_at_level
                        Prims.int_one) FStar_Pervasives_Native.None
                    in
                 let lc1 =
                   let uu____8437 =
                     let uu____8438 =
                       let uu____8439 =
                         FStar_Syntax_Syntax.mk_Total
                           FStar_Syntax_Util.ktype0
                          in
                       FStar_All.pipe_left
                         FStar_TypeChecker_Common.lcomp_of_comp uu____8439
                        in
                     (FStar_Pervasives_Native.None, uu____8438)  in
                   bind e.FStar_Syntax_Syntax.pos env
                     (FStar_Pervasives_Native.Some e) lc uu____8437
                    in
                 let e1 =
                   let uu____8445 =
                     let uu____8450 =
                       let uu____8451 = FStar_Syntax_Syntax.as_arg e  in
                       [uu____8451]  in
                     FStar_Syntax_Syntax.mk_Tm_app b2t1 uu____8450  in
                   uu____8445 FStar_Pervasives_Native.None
                     e.FStar_Syntax_Syntax.pos
                    in
                 (e1, lc1)
             | uu____8476 -> (e, lc))
  
let (weaken_result_typ :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_TypeChecker_Common.lcomp ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.lcomp *
            FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        fun t  ->
          (let uu____8511 =
             FStar_TypeChecker_Env.debug env FStar_Options.High  in
           if uu____8511
           then
             let uu____8514 = FStar_Syntax_Print.term_to_string e  in
             let uu____8516 = FStar_TypeChecker_Common.lcomp_to_string lc  in
             let uu____8518 = FStar_Syntax_Print.term_to_string t  in
             FStar_Util.print3 "weaken_result_typ e=(%s) lc=(%s) t=(%s)\n"
               uu____8514 uu____8516 uu____8518
           else ());
          (let use_eq =
             env.FStar_TypeChecker_Env.use_eq ||
               (let uu____8528 =
                  FStar_TypeChecker_Env.effect_decl_opt env
                    lc.FStar_TypeChecker_Common.eff_name
                   in
                match uu____8528 with
                | FStar_Pervasives_Native.Some (ed,qualifiers) ->
                    FStar_All.pipe_right qualifiers
                      (FStar_List.contains FStar_Syntax_Syntax.Reifiable)
                | uu____8553 -> false)
              in
           let gopt =
             if use_eq
             then
               let uu____8579 =
                 FStar_TypeChecker_Rel.try_teq true env
                   lc.FStar_TypeChecker_Common.res_typ t
                  in
               (uu____8579, false)
             else
               (let uu____8589 =
                  FStar_TypeChecker_Rel.get_subtyping_predicate env
                    lc.FStar_TypeChecker_Common.res_typ t
                   in
                (uu____8589, true))
              in
           match gopt with
           | (FStar_Pervasives_Native.None ,uu____8602) ->
               if env.FStar_TypeChecker_Env.failhard
               then
                 let uu____8614 =
                   FStar_TypeChecker_Err.basic_type_error env
                     (FStar_Pervasives_Native.Some e) t
                     lc.FStar_TypeChecker_Common.res_typ
                    in
                 FStar_Errors.raise_error uu____8614
                   e.FStar_Syntax_Syntax.pos
               else
                 (FStar_TypeChecker_Rel.subtype_fail env e
                    lc.FStar_TypeChecker_Common.res_typ t;
                  (e,
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                    ((let uu___1020_8536 = lc  in
                      {
                        FStar_TypeChecker_Common.eff_name =
                          (uu___1020_8536.FStar_TypeChecker_Common.eff_name);
                        FStar_TypeChecker_Common.res_typ = t;
                        FStar_TypeChecker_Common.cflags =
                          (uu___1020_8536.FStar_TypeChecker_Common.cflags);
                        FStar_TypeChecker_Common.comp_thunk =
                          (uu___1020_8536.FStar_TypeChecker_Common.comp_thunk)
=======
                    ((let uu___764_5396 = lc  in
=======
                    ((let uu___765_5396 = lc  in
>>>>>>> snap
                      {
                        FStar_Syntax_Syntax.eff_name =
                          (uu___765_5396.FStar_Syntax_Syntax.eff_name);
                        FStar_Syntax_Syntax.res_typ = t;
                        FStar_Syntax_Syntax.cflags =
                          (uu___765_5396.FStar_Syntax_Syntax.cflags);
                        FStar_Syntax_Syntax.comp_thunk =
<<<<<<< HEAD
                          (uu___764_5396.FStar_Syntax_Syntax.comp_thunk)
>>>>>>> snap
=======
                    ((let uu___1053_8629 = lc  in
=======
                    ((let uu___1053_8630 = lc  in
>>>>>>> cp
                      {
                        FStar_TypeChecker_Common.eff_name =
                          (uu___1053_8630.FStar_TypeChecker_Common.eff_name);
                        FStar_TypeChecker_Common.res_typ = t;
                        FStar_TypeChecker_Common.cflags =
                          (uu___1053_8630.FStar_TypeChecker_Common.cflags);
                        FStar_TypeChecker_Common.comp_thunk =
<<<<<<< HEAD
                          (uu___1053_8629.FStar_TypeChecker_Common.comp_thunk)
>>>>>>> snap
=======
                          (uu___765_5396.FStar_Syntax_Syntax.comp_thunk)
>>>>>>> snap
=======
                          (uu___1053_8630.FStar_TypeChecker_Common.comp_thunk)
>>>>>>> cp
                      })), FStar_TypeChecker_Env.trivial_guard))
           | (FStar_Pervasives_Native.Some g,apply_guard1) ->
               let uu____8637 = FStar_TypeChecker_Env.guard_form g  in
               (match uu____8637 with
                | FStar_TypeChecker_Common.Trivial  ->
                    let strengthen_trivial uu____8653 =
                      let uu____8654 = FStar_TypeChecker_Common.lcomp_comp lc
                         in
                      match uu____8654 with
                      | (c,g_c) ->
                          let res_t = FStar_Syntax_Util.comp_result c  in
                          let set_result_typ1 c1 =
                            FStar_Syntax_Util.set_result_typ c1 t  in
                          let uu____8674 =
                            let uu____8676 = FStar_Syntax_Util.eq_tm t res_t
                               in
                            uu____8676 = FStar_Syntax_Util.Equal  in
                          if uu____8674
                          then
                            ((let uu____8683 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  FStar_Options.Extreme
                                 in
                              if uu____8683
                              then
                                let uu____8687 =
                                  FStar_Syntax_Print.term_to_string res_t  in
                                let uu____8689 =
                                  FStar_Syntax_Print.term_to_string t  in
                                FStar_Util.print2
                                  "weaken_result_type::strengthen_trivial: res_t:%s is same as t:%s\n"
                                  uu____8687 uu____8689
                              else ());
                             (let uu____8694 = set_result_typ1 c  in
                              (uu____8694, g_c)))
                          else
                            (let is_res_t_refinement =
                               let res_t1 =
                                 FStar_TypeChecker_Normalize.normalize_refinement
                                   FStar_TypeChecker_Normalize.whnf_steps env
                                   res_t
                                  in
                               match res_t1.FStar_Syntax_Syntax.n with
                               | FStar_Syntax_Syntax.Tm_refine uu____8701 ->
                                   true
                               | uu____8709 -> false  in
                             if is_res_t_refinement
                             then
                               let x =
                                 FStar_Syntax_Syntax.new_bv
                                   (FStar_Pervasives_Native.Some
                                      (res_t.FStar_Syntax_Syntax.pos)) res_t
                                  in
                               let cret =
                                 let uu____8718 =
                                   FStar_Syntax_Syntax.bv_to_name x  in
                                 return_value env (comp_univ_opt c) res_t
                                   uu____8718
                                  in
                               let lc1 =
                                 let uu____8720 =
                                   FStar_TypeChecker_Common.lcomp_of_comp c
                                    in
                                 let uu____8721 =
                                   let uu____8722 =
                                     FStar_TypeChecker_Common.lcomp_of_comp
                                       cret
                                      in
                                   ((FStar_Pervasives_Native.Some x),
                                     uu____8722)
                                    in
                                 bind e.FStar_Syntax_Syntax.pos env
                                   (FStar_Pervasives_Native.Some e)
                                   uu____8720 uu____8721
                                  in
                               ((let uu____8726 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env)
                                     FStar_Options.Extreme
                                    in
                                 if uu____8726
                                 then
                                   let uu____8730 =
                                     FStar_Syntax_Print.term_to_string e  in
                                   let uu____8732 =
                                     FStar_Syntax_Print.comp_to_string c  in
                                   let uu____8734 =
                                     FStar_Syntax_Print.term_to_string t  in
                                   let uu____8736 =
                                     FStar_TypeChecker_Common.lcomp_to_string
                                       lc1
                                      in
                                   FStar_Util.print4
                                     "weaken_result_type::strengthen_trivial: inserting a return for e: %s, c: %s, t: %s, and then post return lc: %s\n"
                                     uu____8730 uu____8732 uu____8734
                                     uu____8736
                                 else ());
                                (let uu____8741 =
                                   FStar_TypeChecker_Common.lcomp_comp lc1
                                    in
                                 match uu____8741 with
                                 | (c1,g_lc) ->
                                     let uu____8752 = set_result_typ1 c1  in
                                     let uu____8753 =
                                       FStar_TypeChecker_Env.conj_guard g_c
                                         g_lc
                                        in
                                     (uu____8752, uu____8753)))
                             else
                               ((let uu____8757 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env)
                                     FStar_Options.Extreme
                                    in
                                 if uu____8757
                                 then
                                   let uu____8761 =
                                     FStar_Syntax_Print.term_to_string res_t
                                      in
                                   let uu____8763 =
                                     FStar_Syntax_Print.comp_to_string c  in
                                   FStar_Util.print2
                                     "weaken_result_type::strengthen_trivial: res_t:%s is not a refinement, leaving c:%s as is\n"
                                     uu____8761 uu____8763
                                 else ());
                                (let uu____8768 = set_result_typ1 c  in
                                 (uu____8768, g_c))))
                       in
                    let lc1 =
                      FStar_TypeChecker_Common.mk_lcomp
                        lc.FStar_TypeChecker_Common.eff_name t
                        lc.FStar_TypeChecker_Common.cflags strengthen_trivial
                       in
                    (e, lc1, g)
                | FStar_TypeChecker_Common.NonTrivial f ->
                    let g1 =
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                      let uu___1057_8678 = g  in
=======
                      let uu___796_5502 = g  in
>>>>>>> snap
=======
                      let uu___1090_8771 = g  in
>>>>>>> snap
=======
                      let uu___797_5502 = g  in
>>>>>>> snap
=======
                      let uu___1090_8772 = g  in
>>>>>>> cp
                      {
                        FStar_TypeChecker_Common.guard_f =
                          FStar_TypeChecker_Common.Trivial;
<<<<<<< HEAD
                        FStar_TypeChecker_Common.deferred =
<<<<<<< HEAD
<<<<<<< HEAD
                          (uu___1057_8678.FStar_TypeChecker_Common.deferred);
                        FStar_TypeChecker_Common.univ_ineqs =
                          (uu___1057_8678.FStar_TypeChecker_Common.univ_ineqs);
                        FStar_TypeChecker_Common.implicits =
                          (uu___1057_8678.FStar_TypeChecker_Common.implicits)
=======
                        FStar_TypeChecker_Env.deferred =
                          (uu___797_5502.FStar_TypeChecker_Env.deferred);
                        FStar_TypeChecker_Env.univ_ineqs =
                          (uu___797_5502.FStar_TypeChecker_Env.univ_ineqs);
                        FStar_TypeChecker_Env.implicits =
<<<<<<< HEAD
                          (uu___796_5502.FStar_TypeChecker_Env.implicits)
>>>>>>> snap
=======
                          (uu___1090_8771.FStar_TypeChecker_Common.deferred);
=======
                          (uu___1090_8772.FStar_TypeChecker_Common.deferred);
>>>>>>> cp
                        FStar_TypeChecker_Common.univ_ineqs =
                          (uu___1090_8772.FStar_TypeChecker_Common.univ_ineqs);
                        FStar_TypeChecker_Common.implicits =
<<<<<<< HEAD
                          (uu___1090_8771.FStar_TypeChecker_Common.implicits)
>>>>>>> snap
=======
                          (uu___797_5502.FStar_TypeChecker_Env.implicits)
>>>>>>> snap
=======
                          (uu___1090_8772.FStar_TypeChecker_Common.implicits)
>>>>>>> cp
                      }  in
                    let strengthen uu____8782 =
                      let uu____8783 =
                        env.FStar_TypeChecker_Env.lax &&
                          (FStar_Options.ml_ish ())
                         in
                      if uu____8783
                      then FStar_TypeChecker_Common.lcomp_comp lc
                      else
                        (let f1 =
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.Eager_unfolding;
                             FStar_TypeChecker_Env.Simplify;
                             FStar_TypeChecker_Env.Primops] env f
                            in
                         let uu____8793 =
                           let uu____8794 = FStar_Syntax_Subst.compress f1
                              in
                           uu____8794.FStar_Syntax_Syntax.n  in
                         match uu____8793 with
                         | FStar_Syntax_Syntax.Tm_abs
                             (uu____8801,{
                                           FStar_Syntax_Syntax.n =
                                             FStar_Syntax_Syntax.Tm_fvar fv;
                                           FStar_Syntax_Syntax.pos =
                                             uu____8803;
                                           FStar_Syntax_Syntax.vars =
                                             uu____8804;_},uu____8805)
                             when
                             FStar_Syntax_Syntax.fv_eq_lid fv
                               FStar_Parser_Const.true_lid
                             ->
                             let lc1 =
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                               let uu___1073_8737 = lc  in
                               {
                                 FStar_TypeChecker_Common.eff_name =
                                   (uu___1073_8737.FStar_TypeChecker_Common.eff_name);
                                 FStar_TypeChecker_Common.res_typ = t;
                                 FStar_TypeChecker_Common.cflags =
                                   (uu___1073_8737.FStar_TypeChecker_Common.cflags);
                                 FStar_TypeChecker_Common.comp_thunk =
                                   (uu___1073_8737.FStar_TypeChecker_Common.comp_thunk)
=======
                               let uu___1106_8830 = lc  in
=======
                               let uu___1106_8831 = lc  in
>>>>>>> cp
                               {
                                 FStar_TypeChecker_Common.eff_name =
                                   (uu___1106_8831.FStar_TypeChecker_Common.eff_name);
                                 FStar_TypeChecker_Common.res_typ = t;
                                 FStar_TypeChecker_Common.cflags =
                                   (uu___1106_8831.FStar_TypeChecker_Common.cflags);
                                 FStar_TypeChecker_Common.comp_thunk =
<<<<<<< HEAD
                                   (uu___1106_8830.FStar_TypeChecker_Common.comp_thunk)
>>>>>>> snap
=======
                                   (uu___1106_8831.FStar_TypeChecker_Common.comp_thunk)
>>>>>>> cp
                               }  in
                             FStar_TypeChecker_Common.lcomp_comp lc1
                         | uu____8832 ->
                             let uu____8833 =
                               FStar_TypeChecker_Common.lcomp_comp lc  in
                             (match uu____8833 with
                              | (c,g_c) ->
                                  ((let uu____8845 =
                                      FStar_All.pipe_left
                                        (FStar_TypeChecker_Env.debug env)
                                        FStar_Options.Extreme
                                       in
                                    if uu____8845
                                    then
                                      let uu____8849 =
                                        FStar_TypeChecker_Normalize.term_to_string
                                          env
                                          lc.FStar_TypeChecker_Common.res_typ
                                         in
                                      let uu____8851 =
                                        FStar_TypeChecker_Normalize.term_to_string
                                          env t
                                         in
                                      let uu____8853 =
                                        FStar_TypeChecker_Normalize.comp_to_string
                                          env c
                                         in
                                      let uu____8855 =
                                        FStar_TypeChecker_Normalize.term_to_string
                                          env f1
                                         in
                                      FStar_Util.print4
                                        "Weakened from %s to %s\nStrengthening %s with guard %s\n"
                                        uu____8849 uu____8851 uu____8853
                                        uu____8855
                                    else ());
                                   (let u_t_opt = comp_univ_opt c  in
                                    let x =
                                      FStar_Syntax_Syntax.new_bv
                                        (FStar_Pervasives_Native.Some
                                           (t.FStar_Syntax_Syntax.pos)) t
                                       in
                                    let xexp =
                                      FStar_Syntax_Syntax.bv_to_name x  in
                                    let cret =
                                      return_value env u_t_opt t xexp  in
                                    let guard =
                                      if apply_guard1
                                      then
                                        let uu____8868 =
                                          let uu____8873 =
                                            let uu____8874 =
                                              FStar_Syntax_Syntax.as_arg xexp
                                               in
                                            [uu____8874]  in
                                          FStar_Syntax_Syntax.mk_Tm_app f1
                                            uu____8873
                                           in
                                        uu____8868
                                          FStar_Pervasives_Native.None
                                          f1.FStar_Syntax_Syntax.pos
                                      else f1  in
                                    let uu____8901 =
                                      let uu____8906 =
                                        FStar_All.pipe_left
                                          (fun _8927  ->
                                             FStar_Pervasives_Native.Some
                                               _8927)
                                          (FStar_TypeChecker_Err.subtyping_failed
                                             env
                                             lc.FStar_TypeChecker_Common.res_typ
                                             t)
                                         in
                                      let uu____8928 =
                                        FStar_TypeChecker_Env.set_range env
                                          e.FStar_Syntax_Syntax.pos
                                         in
                                      let uu____8929 =
                                        FStar_TypeChecker_Common.lcomp_of_comp
                                          cret
                                         in
                                      let uu____8930 =
                                        FStar_All.pipe_left
                                          FStar_TypeChecker_Env.guard_of_guard_formula
                                          (FStar_TypeChecker_Common.NonTrivial
                                             guard)
                                         in
                                      strengthen_precondition uu____8906
                                        uu____8928 e uu____8929 uu____8930
                                       in
                                    match uu____8901 with
                                    | (eq_ret,_trivial_so_ok_to_discard) ->
                                        let x1 =
<<<<<<< HEAD
<<<<<<< HEAD
                                          let uu___1091_8844 = x  in
                                          {
                                            FStar_Syntax_Syntax.ppname =
                                              (uu___1091_8844.FStar_Syntax_Syntax.ppname);
                                            FStar_Syntax_Syntax.index =
                                              (uu___1091_8844.FStar_Syntax_Syntax.index);
=======
                                          let uu___1124_8937 = x  in
=======
                                          let uu___1124_8938 = x  in
>>>>>>> cp
                                          {
                                            FStar_Syntax_Syntax.ppname =
                                              (uu___1124_8938.FStar_Syntax_Syntax.ppname);
                                            FStar_Syntax_Syntax.index =
<<<<<<< HEAD
                                              (uu___1124_8937.FStar_Syntax_Syntax.index);
>>>>>>> snap
=======
                                              (uu___1124_8938.FStar_Syntax_Syntax.index);
>>>>>>> cp
                                            FStar_Syntax_Syntax.sort =
                                              (lc.FStar_TypeChecker_Common.res_typ)
                                          }  in
                                        let c1 =
                                          let uu____8940 =
                                            FStar_TypeChecker_Common.lcomp_of_comp
                                              c
                                             in
                                          bind e.FStar_Syntax_Syntax.pos env
                                            (FStar_Pervasives_Native.Some e)
                                            uu____8940
                                            ((FStar_Pervasives_Native.Some x1),
                                              eq_ret)
                                           in
                                        let uu____8943 =
                                          FStar_TypeChecker_Common.lcomp_comp
                                            c1
                                           in
                                        (match uu____8943 with
                                         | (c2,g_lc) ->
                                             ((let uu____8955 =
                                                 FStar_All.pipe_left
                                                   (FStar_TypeChecker_Env.debug
                                                      env)
                                                   FStar_Options.Extreme
                                                  in
                                               if uu____8955
                                               then
                                                 let uu____8959 =
                                                   FStar_TypeChecker_Normalize.comp_to_string
                                                     env c2
                                                    in
                                                 FStar_Util.print1
                                                   "Strengthened to %s\n"
                                                   uu____8959
                                               else ());
                                              (let uu____8964 =
                                                 FStar_TypeChecker_Env.conj_guard
                                                   g_c g_lc
                                                  in
<<<<<<< HEAD
<<<<<<< HEAD
                                               (c2, uu____8870))))))))
=======
                               let uu___812_5549 = lc  in
=======
                               let uu___813_5549 = lc  in
>>>>>>> snap
                               {
                                 FStar_Syntax_Syntax.eff_name =
                                   (uu___813_5549.FStar_Syntax_Syntax.eff_name);
                                 FStar_Syntax_Syntax.res_typ = t;
                                 FStar_Syntax_Syntax.cflags =
                                   (uu___813_5549.FStar_Syntax_Syntax.cflags);
                                 FStar_Syntax_Syntax.comp_thunk =
                                   (uu___813_5549.FStar_Syntax_Syntax.comp_thunk)
                               }  in
                             FStar_Syntax_Syntax.lcomp_comp lc1
                         | uu____5550 ->
                             let c = FStar_Syntax_Syntax.lcomp_comp lc  in
                             ((let uu____5553 =
                                 FStar_All.pipe_left
                                   (FStar_TypeChecker_Env.debug env)
                                   FStar_Options.Extreme
                                  in
                               if uu____5553
                               then
                                 let uu____5557 =
                                   FStar_TypeChecker_Normalize.term_to_string
                                     env lc.FStar_Syntax_Syntax.res_typ
                                    in
                                 let uu____5559 =
                                   FStar_TypeChecker_Normalize.term_to_string
                                     env t
                                    in
                                 let uu____5561 =
                                   FStar_TypeChecker_Normalize.comp_to_string
                                     env c
                                    in
                                 let uu____5563 =
                                   FStar_TypeChecker_Normalize.term_to_string
                                     env f1
                                    in
                                 FStar_Util.print4
                                   "Weakened from %s to %s\nStrengthening %s with guard %s\n"
                                   uu____5557 uu____5559 uu____5561
                                   uu____5563
                               else ());
                              (let u_t_opt = comp_univ_opt c  in
                               let x =
                                 FStar_Syntax_Syntax.new_bv
                                   (FStar_Pervasives_Native.Some
                                      (t.FStar_Syntax_Syntax.pos)) t
                                  in
                               let xexp = FStar_Syntax_Syntax.bv_to_name x
                                  in
                               let cret = return_value env u_t_opt t xexp  in
                               let guard =
                                 if apply_guard1
                                 then
                                   let uu____5576 =
                                     let uu____5581 =
                                       let uu____5582 =
                                         FStar_Syntax_Syntax.as_arg xexp  in
                                       [uu____5582]  in
                                     FStar_Syntax_Syntax.mk_Tm_app f1
                                       uu____5581
                                      in
                                   uu____5576 FStar_Pervasives_Native.None
                                     f1.FStar_Syntax_Syntax.pos
                                 else f1  in
                               let uu____5609 =
                                 let uu____5614 =
                                   FStar_All.pipe_left
                                     (fun _5635  ->
                                        FStar_Pervasives_Native.Some _5635)
                                     (FStar_TypeChecker_Err.subtyping_failed
                                        env lc.FStar_Syntax_Syntax.res_typ t)
                                    in
                                 let uu____5636 =
                                   FStar_TypeChecker_Env.set_range env
                                     e.FStar_Syntax_Syntax.pos
                                    in
                                 let uu____5637 =
                                   FStar_Syntax_Util.lcomp_of_comp cret  in
                                 let uu____5638 =
                                   FStar_All.pipe_left
                                     FStar_TypeChecker_Env.guard_of_guard_formula
                                     (FStar_TypeChecker_Common.NonTrivial
                                        guard)
                                    in
                                 strengthen_precondition uu____5614
                                   uu____5636 e uu____5637 uu____5638
                                  in
                               match uu____5609 with
                               | (eq_ret,_trivial_so_ok_to_discard) ->
                                   let x1 =
                                     let uu___829_5642 = x  in
                                     {
                                       FStar_Syntax_Syntax.ppname =
                                         (uu___829_5642.FStar_Syntax_Syntax.ppname);
                                       FStar_Syntax_Syntax.index =
                                         (uu___829_5642.FStar_Syntax_Syntax.index);
                                       FStar_Syntax_Syntax.sort =
                                         (lc.FStar_Syntax_Syntax.res_typ)
                                     }  in
                                   let c1 =
                                     let uu____5644 =
                                       FStar_Syntax_Util.lcomp_of_comp c  in
                                     bind e.FStar_Syntax_Syntax.pos env
                                       (FStar_Pervasives_Native.Some e)
                                       uu____5644
                                       ((FStar_Pervasives_Native.Some x1),
                                         eq_ret)
                                      in
                                   let c2 = FStar_Syntax_Syntax.lcomp_comp c1
                                      in
                                   ((let uu____5649 =
                                       FStar_All.pipe_left
                                         (FStar_TypeChecker_Env.debug env)
                                         FStar_Options.Extreme
                                        in
                                     if uu____5649
                                     then
                                       let uu____5653 =
                                         FStar_TypeChecker_Normalize.comp_to_string
                                           env c2
                                          in
                                       FStar_Util.print1
                                         "Strengthened to %s\n" uu____5653
                                     else ());
                                    c2))))
>>>>>>> snap
=======
                                               (c2, uu____8963))))))))
>>>>>>> snap
=======
                                               (c2, uu____8964))))))))
>>>>>>> cp
                       in
                    let flags =
                      FStar_All.pipe_right lc.FStar_TypeChecker_Common.cflags
                        (FStar_List.collect
                           (fun uu___6_8973  ->
                              match uu___6_8973 with
                              | FStar_Syntax_Syntax.RETURN  ->
                                  [FStar_Syntax_Syntax.PARTIAL_RETURN]
                              | FStar_Syntax_Syntax.PARTIAL_RETURN  ->
                                  [FStar_Syntax_Syntax.PARTIAL_RETURN]
                              | FStar_Syntax_Syntax.CPS  ->
                                  [FStar_Syntax_Syntax.CPS]
                              | uu____8976 -> []))
                       in
                    let lc1 =
                      let uu____8978 =
                        FStar_TypeChecker_Env.norm_eff_name env
                          lc.FStar_TypeChecker_Common.eff_name
                         in
                      FStar_TypeChecker_Common.mk_lcomp uu____8978 t flags
                        strengthen
                       in
                    let g2 =
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                      let uu___1107_8886 = g1  in
=======
                      let uu___842_5673 = g1  in
>>>>>>> snap
=======
                      let uu___1140_8979 = g1  in
>>>>>>> snap
=======
                      let uu___843_5673 = g1  in
>>>>>>> snap
=======
                      let uu___1140_8980 = g1  in
>>>>>>> cp
                      {
                        FStar_TypeChecker_Common.guard_f =
                          FStar_TypeChecker_Common.Trivial;
<<<<<<< HEAD
                        FStar_TypeChecker_Common.deferred =
<<<<<<< HEAD
<<<<<<< HEAD
                          (uu___1107_8886.FStar_TypeChecker_Common.deferred);
                        FStar_TypeChecker_Common.univ_ineqs =
                          (uu___1107_8886.FStar_TypeChecker_Common.univ_ineqs);
                        FStar_TypeChecker_Common.implicits =
                          (uu___1107_8886.FStar_TypeChecker_Common.implicits)
=======
                        FStar_TypeChecker_Env.deferred =
                          (uu___843_5673.FStar_TypeChecker_Env.deferred);
                        FStar_TypeChecker_Env.univ_ineqs =
                          (uu___843_5673.FStar_TypeChecker_Env.univ_ineqs);
                        FStar_TypeChecker_Env.implicits =
<<<<<<< HEAD
                          (uu___842_5673.FStar_TypeChecker_Env.implicits)
>>>>>>> snap
=======
                          (uu___1140_8979.FStar_TypeChecker_Common.deferred);
=======
                          (uu___1140_8980.FStar_TypeChecker_Common.deferred);
>>>>>>> cp
                        FStar_TypeChecker_Common.univ_ineqs =
                          (uu___1140_8980.FStar_TypeChecker_Common.univ_ineqs);
                        FStar_TypeChecker_Common.implicits =
<<<<<<< HEAD
                          (uu___1140_8979.FStar_TypeChecker_Common.implicits)
>>>>>>> snap
=======
                          (uu___843_5673.FStar_TypeChecker_Env.implicits)
>>>>>>> snap
=======
                          (uu___1140_8980.FStar_TypeChecker_Common.implicits)
>>>>>>> cp
                      }  in
                    (e, lc1, g2)))
  
let (pure_or_ghost_pre_and_post :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      (FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option *
        FStar_Syntax_Syntax.typ))
  =
  fun env  ->
    fun comp  ->
      let mk_post_type res_t ens =
        let x = FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None res_t
           in
        let uu____9016 =
          let uu____9019 =
            let uu____9024 =
              let uu____9025 =
                let uu____9034 = FStar_Syntax_Syntax.bv_to_name x  in
                FStar_Syntax_Syntax.as_arg uu____9034  in
              [uu____9025]  in
            FStar_Syntax_Syntax.mk_Tm_app ens uu____9024  in
          uu____9019 FStar_Pervasives_Native.None
            res_t.FStar_Syntax_Syntax.pos
           in
        FStar_Syntax_Util.refine x uu____9016  in
      let norm1 t =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.Eager_unfolding;
          FStar_TypeChecker_Env.EraseUniverses] env t
         in
      let uu____9057 = FStar_Syntax_Util.is_tot_or_gtot_comp comp  in
      if uu____9057
      then
        (FStar_Pervasives_Native.None, (FStar_Syntax_Util.comp_result comp))
      else
        (match comp.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.GTotal uu____9076 -> failwith "Impossible"
         | FStar_Syntax_Syntax.Total uu____9092 -> failwith "Impossible"
         | FStar_Syntax_Syntax.Comp ct ->
             let uu____9109 =
               (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
                  FStar_Parser_Const.effect_Pure_lid)
                 ||
                 (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
                    FStar_Parser_Const.effect_Ghost_lid)
                in
             if uu____9109
             then
               (match ct.FStar_Syntax_Syntax.effect_args with
                | (req,uu____9125)::(ens,uu____9127)::uu____9128 ->
                    let uu____9171 =
                      let uu____9174 = norm1 req  in
                      FStar_Pervasives_Native.Some uu____9174  in
                    let uu____9175 =
                      let uu____9176 =
                        mk_post_type ct.FStar_Syntax_Syntax.result_typ ens
                         in
                      FStar_All.pipe_left norm1 uu____9176  in
                    (uu____9171, uu____9175)
                | uu____9179 ->
                    let uu____9190 =
                      let uu____9196 =
                        let uu____9198 =
                          FStar_Syntax_Print.comp_to_string comp  in
                        FStar_Util.format1
                          "Effect constructor is not fully applied; got %s"
                          uu____9198
                         in
                      (FStar_Errors.Fatal_EffectConstructorNotFullyApplied,
                        uu____9196)
                       in
                    FStar_Errors.raise_error uu____9190
                      comp.FStar_Syntax_Syntax.pos)
             else
               (let ct1 = FStar_TypeChecker_Env.unfold_effect_abbrev env comp
                   in
                match ct1.FStar_Syntax_Syntax.effect_args with
                | (wp,uu____9218)::uu____9219 ->
                    let uu____9246 =
                      let uu____9251 =
                        FStar_TypeChecker_Env.lookup_lid env
                          FStar_Parser_Const.as_requires
                         in
                      FStar_All.pipe_left FStar_Pervasives_Native.fst
                        uu____9251
                       in
                    (match uu____9246 with
                     | (us_r,uu____9283) ->
                         let uu____9284 =
                           let uu____9289 =
                             FStar_TypeChecker_Env.lookup_lid env
                               FStar_Parser_Const.as_ensures
                              in
                           FStar_All.pipe_left FStar_Pervasives_Native.fst
                             uu____9289
                            in
                         (match uu____9284 with
                          | (us_e,uu____9321) ->
                              let r =
                                (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
                                 in
                              let as_req =
                                let uu____9324 =
                                  let uu____9325 =
                                    FStar_Ident.set_lid_range
                                      FStar_Parser_Const.as_requires r
                                     in
                                  FStar_Syntax_Syntax.fvar uu____9325
                                    FStar_Syntax_Syntax.delta_equational
                                    FStar_Pervasives_Native.None
                                   in
                                FStar_Syntax_Syntax.mk_Tm_uinst uu____9324
                                  us_r
                                 in
                              let as_ens =
                                let uu____9327 =
                                  let uu____9328 =
                                    FStar_Ident.set_lid_range
                                      FStar_Parser_Const.as_ensures r
                                     in
                                  FStar_Syntax_Syntax.fvar uu____9328
                                    FStar_Syntax_Syntax.delta_equational
                                    FStar_Pervasives_Native.None
                                   in
                                FStar_Syntax_Syntax.mk_Tm_uinst uu____9327
                                  us_e
                                 in
                              let req =
                                let uu____9332 =
                                  let uu____9337 =
                                    let uu____9338 =
                                      let uu____9349 =
                                        FStar_Syntax_Syntax.as_arg wp  in
                                      [uu____9349]  in
                                    ((ct1.FStar_Syntax_Syntax.result_typ),
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag))
                                      :: uu____9338
                                     in
                                  FStar_Syntax_Syntax.mk_Tm_app as_req
                                    uu____9337
                                   in
                                uu____9332 FStar_Pervasives_Native.None
                                  (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
                                 in
                              let ens =
                                let uu____9389 =
                                  let uu____9394 =
                                    let uu____9395 =
                                      let uu____9406 =
                                        FStar_Syntax_Syntax.as_arg wp  in
                                      [uu____9406]  in
                                    ((ct1.FStar_Syntax_Syntax.result_typ),
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag))
                                      :: uu____9395
                                     in
                                  FStar_Syntax_Syntax.mk_Tm_app as_ens
                                    uu____9394
                                   in
                                uu____9389 FStar_Pervasives_Native.None
                                  (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
                                 in
                              let uu____9443 =
                                let uu____9446 = norm1 req  in
                                FStar_Pervasives_Native.Some uu____9446  in
                              let uu____9447 =
                                let uu____9448 =
                                  mk_post_type
                                    ct1.FStar_Syntax_Syntax.result_typ ens
                                   in
                                norm1 uu____9448  in
                              (uu____9443, uu____9447)))
                | uu____9451 -> failwith "Impossible"))
  
let (reify_body :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      let tm = FStar_Syntax_Util.mk_reify t  in
      let tm' =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.Reify;
          FStar_TypeChecker_Env.Eager_unfolding;
          FStar_TypeChecker_Env.EraseUniverses;
          FStar_TypeChecker_Env.AllowUnboundUniverses] env tm
         in
      (let uu____9485 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "SMTEncodingReify")
          in
       if uu____9485
       then
         let uu____9490 = FStar_Syntax_Print.term_to_string tm  in
         let uu____9492 = FStar_Syntax_Print.term_to_string tm'  in
         FStar_Util.print2 "Reified body %s \nto %s\n" uu____9490 uu____9492
       else ());
      tm'
  
let (reify_body_with_arg :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.arg -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun head1  ->
      fun arg  ->
        let tm =
          FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (head1, [arg]))
            FStar_Pervasives_Native.None head1.FStar_Syntax_Syntax.pos
           in
        let tm' =
          FStar_TypeChecker_Normalize.normalize
            [FStar_TypeChecker_Env.Beta;
            FStar_TypeChecker_Env.Reify;
            FStar_TypeChecker_Env.Eager_unfolding;
            FStar_TypeChecker_Env.EraseUniverses;
            FStar_TypeChecker_Env.AllowUnboundUniverses] env tm
           in
        (let uu____9546 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "SMTEncodingReify")
            in
         if uu____9546
         then
           let uu____9551 = FStar_Syntax_Print.term_to_string tm  in
           let uu____9553 = FStar_Syntax_Print.term_to_string tm'  in
           FStar_Util.print2 "Reified body %s \nto %s\n" uu____9551
             uu____9553
         else ());
        tm'
  
let (remove_reify : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t  ->
    let uu____9564 =
      let uu____9566 =
        let uu____9567 = FStar_Syntax_Subst.compress t  in
        uu____9567.FStar_Syntax_Syntax.n  in
      match uu____9566 with
      | FStar_Syntax_Syntax.Tm_app uu____9571 -> false
      | uu____9589 -> true  in
    if uu____9564
    then t
    else
      (let uu____9594 = FStar_Syntax_Util.head_and_args t  in
       match uu____9594 with
       | (head1,args) ->
           let uu____9637 =
             let uu____9639 =
               let uu____9640 = FStar_Syntax_Subst.compress head1  in
               uu____9640.FStar_Syntax_Syntax.n  in
             match uu____9639 with
             | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify ) ->
                 true
             | uu____9645 -> false  in
           if uu____9637
           then
             (match args with
              | x::[] -> FStar_Pervasives_Native.fst x
              | uu____9677 ->
                  failwith
                    "Impossible : Reify applied to multiple arguments after normalization.")
           else t)
  
let (maybe_instantiate :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ ->
        (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.typ *
          FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun e  ->
      fun t  ->
        let torig = FStar_Syntax_Subst.compress t  in
        if Prims.op_Negation env.FStar_TypeChecker_Env.instantiate_imp
        then (e, torig, FStar_TypeChecker_Env.trivial_guard)
        else
          ((let uu____9724 =
              FStar_TypeChecker_Env.debug env FStar_Options.High  in
            if uu____9724
            then
              let uu____9727 = FStar_Syntax_Print.term_to_string e  in
              let uu____9729 = FStar_Syntax_Print.term_to_string t  in
              let uu____9731 =
                let uu____9733 = FStar_TypeChecker_Env.expected_typ env  in
                FStar_Common.string_of_option
                  FStar_Syntax_Print.term_to_string uu____9733
                 in
              FStar_Util.print3
                "maybe_instantiate: starting check for (%s) of type (%s), expected type is %s\n"
                uu____9727 uu____9729 uu____9731
            else ());
           (let number_of_implicits t1 =
              let t2 = FStar_TypeChecker_Normalize.unfold_whnf env t1  in
              let uu____9746 = FStar_Syntax_Util.arrow_formals t2  in
              match uu____9746 with
              | (formals,uu____9762) ->
                  let n_implicits =
                    let uu____9784 =
                      FStar_All.pipe_right formals
                        (FStar_Util.prefix_until
                           (fun uu____9862  ->
                              match uu____9862 with
                              | (uu____9870,imp) ->
                                  (FStar_Option.isNone imp) ||
                                    (let uu____9877 =
                                       FStar_Syntax_Util.eq_aqual imp
                                         (FStar_Pervasives_Native.Some
                                            FStar_Syntax_Syntax.Equality)
                                        in
                                     uu____9877 = FStar_Syntax_Util.Equal)))
                       in
                    match uu____9784 with
                    | FStar_Pervasives_Native.None  ->
                        FStar_List.length formals
                    | FStar_Pervasives_Native.Some
                        (implicits,_first_explicit,_rest) ->
                        FStar_List.length implicits
                     in
                  n_implicits
               in
            let inst_n_binders t1 =
              let uu____10002 = FStar_TypeChecker_Env.expected_typ env  in
              match uu____10002 with
              | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
              | FStar_Pervasives_Native.Some expected_t ->
                  let n_expected = number_of_implicits expected_t  in
                  let n_available = number_of_implicits t1  in
                  if n_available < n_expected
                  then
                    let uu____10016 =
                      let uu____10022 =
                        let uu____10024 = FStar_Util.string_of_int n_expected
                           in
                        let uu____10026 = FStar_Syntax_Print.term_to_string e
                           in
                        let uu____10028 =
                          FStar_Util.string_of_int n_available  in
                        FStar_Util.format3
                          "Expected a term with %s implicit arguments, but %s has only %s"
                          uu____10024 uu____10026 uu____10028
                         in
                      (FStar_Errors.Fatal_MissingImplicitArguments,
                        uu____10022)
                       in
                    let uu____10032 = FStar_TypeChecker_Env.get_range env  in
                    FStar_Errors.raise_error uu____10016 uu____10032
                  else
                    FStar_Pervasives_Native.Some (n_available - n_expected)
               in
            let decr_inst uu___7_10050 =
              match uu___7_10050 with
              | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
              | FStar_Pervasives_Native.Some i ->
                  FStar_Pervasives_Native.Some (i - Prims.int_one)
               in
            let t1 = FStar_TypeChecker_Normalize.unfold_whnf env t  in
            match t1.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                let uu____10093 = FStar_Syntax_Subst.open_comp bs c  in
                (match uu____10093 with
                 | (bs1,c1) ->
                     let rec aux subst1 inst_n bs2 =
                       match (inst_n, bs2) with
                       | (FStar_Pervasives_Native.Some _10224,uu____10211)
                           when _10224 = Prims.int_zero ->
                           ([], bs2, subst1,
                             FStar_TypeChecker_Env.trivial_guard)
                       | (uu____10257,(x,FStar_Pervasives_Native.Some
                                       (FStar_Syntax_Syntax.Implicit
                                       uu____10259))::rest)
                           ->
                           let t2 =
                             FStar_Syntax_Subst.subst subst1
                               x.FStar_Syntax_Syntax.sort
                              in
                           let uu____10293 =
                             new_implicit_var
                               "Instantiation of implicit argument"
                               e.FStar_Syntax_Syntax.pos env t2
                              in
                           (match uu____10293 with
                            | (v1,uu____10334,g) ->
                                ((let uu____10349 =
                                    FStar_TypeChecker_Env.debug env
                                      FStar_Options.High
                                     in
                                  if uu____10349
                                  then
                                    let uu____10352 =
                                      FStar_Syntax_Print.term_to_string v1
                                       in
                                    FStar_Util.print1
                                      "maybe_instantiate: Instantiating implicit with %s\n"
                                      uu____10352
                                  else ());
                                 (let subst2 =
                                    (FStar_Syntax_Syntax.NT (x, v1)) ::
                                    subst1  in
                                  let uu____10362 =
                                    aux subst2 (decr_inst inst_n) rest  in
                                  match uu____10362 with
                                  | (args,bs3,subst3,g') ->
                                      let uu____10455 =
                                        FStar_TypeChecker_Env.conj_guard g g'
                                         in
                                      (((v1,
                                          (FStar_Pervasives_Native.Some
                                             FStar_Syntax_Syntax.imp_tag)) ::
                                        args), bs3, subst3, uu____10455))))
                       | (uu____10482,(x,FStar_Pervasives_Native.Some
                                       (FStar_Syntax_Syntax.Meta tau))::rest)
                           ->
                           let t2 =
                             FStar_Syntax_Subst.subst subst1
                               x.FStar_Syntax_Syntax.sort
                              in
                           let uu____10519 =
                             let uu____10532 =
                               let uu____10539 =
                                 let uu____10544 = FStar_Dyn.mkdyn env  in
                                 (uu____10544, tau)  in
                               FStar_Pervasives_Native.Some uu____10539  in
                             FStar_TypeChecker_Env.new_implicit_var_aux
                               "Instantiation of meta argument"
                               e.FStar_Syntax_Syntax.pos env t2
                               FStar_Syntax_Syntax.Strict uu____10532
                              in
                           (match uu____10519 with
                            | (v1,uu____10577,g) ->
                                ((let uu____10592 =
                                    FStar_TypeChecker_Env.debug env
                                      FStar_Options.High
                                     in
                                  if uu____10592
                                  then
                                    let uu____10595 =
                                      FStar_Syntax_Print.term_to_string v1
                                       in
                                    FStar_Util.print1
                                      "maybe_instantiate: Instantiating meta argument with %s\n"
                                      uu____10595
                                  else ());
                                 (let subst2 =
                                    (FStar_Syntax_Syntax.NT (x, v1)) ::
                                    subst1  in
                                  let uu____10605 =
                                    aux subst2 (decr_inst inst_n) rest  in
                                  match uu____10605 with
                                  | (args,bs3,subst3,g') ->
                                      let uu____10698 =
                                        FStar_TypeChecker_Env.conj_guard g g'
                                         in
                                      (((v1,
                                          (FStar_Pervasives_Native.Some
                                             FStar_Syntax_Syntax.imp_tag)) ::
                                        args), bs3, subst3, uu____10698))))
                       | (uu____10725,bs3) ->
                           ([], bs3, subst1,
                             FStar_TypeChecker_Env.trivial_guard)
                        in
                     let uu____10773 =
                       let uu____10800 = inst_n_binders t1  in
                       aux [] uu____10800 bs1  in
                     (match uu____10773 with
                      | (args,bs2,subst1,guard) ->
                          (match (args, bs2) with
                           | ([],uu____10872) -> (e, torig, guard)
                           | (uu____10903,[]) when
                               let uu____10934 =
                                 FStar_Syntax_Util.is_total_comp c1  in
                               Prims.op_Negation uu____10934 ->
                               (e, torig,
                                 FStar_TypeChecker_Env.trivial_guard)
                           | uu____10936 ->
                               let t2 =
                                 match bs2 with
                                 | [] -> FStar_Syntax_Util.comp_result c1
                                 | uu____10964 ->
                                     FStar_Syntax_Util.arrow bs2 c1
                                  in
                               let t3 = FStar_Syntax_Subst.subst subst1 t2
                                  in
                               let e1 =
                                 FStar_Syntax_Syntax.mk_Tm_app e args
                                   FStar_Pervasives_Native.None
                                   e.FStar_Syntax_Syntax.pos
                                  in
                               (e1, t3, guard))))
            | uu____10977 -> (e, torig, FStar_TypeChecker_Env.trivial_guard)))
  
let (string_of_univs :
  FStar_Syntax_Syntax.universe_uvar FStar_Util.set -> Prims.string) =
  fun univs1  ->
    let uu____10989 =
      let uu____10993 = FStar_Util.set_elements univs1  in
      FStar_All.pipe_right uu____10993
        (FStar_List.map
           (fun u  ->
              let uu____11005 = FStar_Syntax_Unionfind.univ_uvar_id u  in
              FStar_All.pipe_right uu____11005 FStar_Util.string_of_int))
       in
    FStar_All.pipe_right uu____10989 (FStar_String.concat ", ")
  
let (gen_univs :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe_uvar FStar_Util.set ->
      FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun env  ->
    fun x  ->
      let uu____11033 = FStar_Util.set_is_empty x  in
      if uu____11033
      then []
      else
        (let s =
           let uu____11051 =
             let uu____11054 = FStar_TypeChecker_Env.univ_vars env  in
             FStar_Util.set_difference x uu____11054  in
           FStar_All.pipe_right uu____11051 FStar_Util.set_elements  in
         (let uu____11070 =
            FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
              (FStar_Options.Other "Gen")
             in
          if uu____11070
          then
            let uu____11075 =
              let uu____11077 = FStar_TypeChecker_Env.univ_vars env  in
              string_of_univs uu____11077  in
            FStar_Util.print1 "univ_vars in env: %s\n" uu____11075
          else ());
         (let r =
            let uu____11086 = FStar_TypeChecker_Env.get_range env  in
            FStar_Pervasives_Native.Some uu____11086  in
          let u_names =
            FStar_All.pipe_right s
              (FStar_List.map
                 (fun u  ->
                    let u_name = FStar_Syntax_Syntax.new_univ_name r  in
                    (let uu____11125 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "Gen")
                        in
                     if uu____11125
                     then
                       let uu____11130 =
                         let uu____11132 =
                           FStar_Syntax_Unionfind.univ_uvar_id u  in
                         FStar_All.pipe_left FStar_Util.string_of_int
                           uu____11132
                          in
                       let uu____11136 =
                         FStar_Syntax_Print.univ_to_string
                           (FStar_Syntax_Syntax.U_unif u)
                          in
                       let uu____11138 =
                         FStar_Syntax_Print.univ_to_string
                           (FStar_Syntax_Syntax.U_name u_name)
                          in
                       FStar_Util.print3 "Setting ?%s (%s) to %s\n"
                         uu____11130 uu____11136 uu____11138
                     else ());
                    FStar_Syntax_Unionfind.univ_change u
                      (FStar_Syntax_Syntax.U_name u_name);
                    u_name))
             in
          u_names))
  
let (gather_free_univnames :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun env  ->
    fun t  ->
      let ctx_univnames = FStar_TypeChecker_Env.univnames env  in
      let tm_univnames = FStar_Syntax_Free.univnames t  in
      let univnames1 =
        let uu____11168 =
          FStar_Util.set_difference tm_univnames ctx_univnames  in
        FStar_All.pipe_right uu____11168 FStar_Util.set_elements  in
      univnames1
  
let (check_universe_generalization :
  FStar_Syntax_Syntax.univ_name Prims.list ->
    FStar_Syntax_Syntax.univ_name Prims.list ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun explicit_univ_names  ->
    fun generalized_univ_names  ->
      fun t  ->
        match (explicit_univ_names, generalized_univ_names) with
        | ([],uu____11207) -> generalized_univ_names
        | (uu____11214,[]) -> explicit_univ_names
        | uu____11221 ->
            let uu____11230 =
              let uu____11236 =
                let uu____11238 = FStar_Syntax_Print.term_to_string t  in
                Prims.op_Hat
                  "Generalized universe in a term containing explicit universe annotation : "
                  uu____11238
                 in
              (FStar_Errors.Fatal_UnexpectedGeneralizedUniverse, uu____11236)
               in
            FStar_Errors.raise_error uu____11230 t.FStar_Syntax_Syntax.pos
  
let (generalize_universes :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.tscheme)
  =
  fun env  ->
    fun t0  ->
      let t =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.NoFullNorm;
          FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.DoNotUnfoldPureLets] env t0
         in
      let univnames1 = gather_free_univnames env t  in
      (let uu____11260 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "Gen")
          in
       if uu____11260
       then
         let uu____11265 = FStar_Syntax_Print.term_to_string t  in
         let uu____11267 = FStar_Syntax_Print.univ_names_to_string univnames1
            in
         FStar_Util.print2
           "generalizing universes in the term (post norm): %s with univnames: %s\n"
           uu____11265 uu____11267
       else ());
      (let univs1 = FStar_Syntax_Free.univs t  in
       (let uu____11276 =
          FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
            (FStar_Options.Other "Gen")
           in
        if uu____11276
        then
          let uu____11281 = string_of_univs univs1  in
          FStar_Util.print1 "univs to gen : %s\n" uu____11281
        else ());
       (let gen1 = gen_univs env univs1  in
        (let uu____11290 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Gen")
            in
         if uu____11290
         then
           let uu____11295 = FStar_Syntax_Print.term_to_string t  in
           let uu____11297 = FStar_Syntax_Print.univ_names_to_string gen1  in
           FStar_Util.print2 "After generalization, t: %s and univs: %s\n"
             uu____11295 uu____11297
         else ());
        (let univs2 = check_universe_generalization univnames1 gen1 t0  in
         let t1 = FStar_TypeChecker_Normalize.reduce_uvar_solutions env t  in
         let ts = FStar_Syntax_Subst.close_univ_vars univs2 t1  in
         (univs2, ts))))
  
let (gen :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.term *
        FStar_Syntax_Syntax.comp) Prims.list ->
        (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.univ_name
          Prims.list * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.comp *
          FStar_Syntax_Syntax.binder Prims.list) Prims.list
          FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun is_rec  ->
      fun lecs  ->
        let uu____11381 =
          let uu____11383 =
            FStar_Util.for_all
              (fun uu____11397  ->
                 match uu____11397 with
                 | (uu____11407,uu____11408,c) ->
                     FStar_Syntax_Util.is_pure_or_ghost_comp c) lecs
             in
          FStar_All.pipe_left Prims.op_Negation uu____11383  in
        if uu____11381
        then FStar_Pervasives_Native.None
        else
          (let norm1 c =
             (let uu____11460 =
                FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
              if uu____11460
              then
                let uu____11463 = FStar_Syntax_Print.comp_to_string c  in
                FStar_Util.print1 "Normalizing before generalizing:\n\t %s\n"
                  uu____11463
              else ());
             (let c1 =
                FStar_TypeChecker_Normalize.normalize_comp
                  [FStar_TypeChecker_Env.Beta;
                  FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
                  FStar_TypeChecker_Env.NoFullNorm;
                  FStar_TypeChecker_Env.DoNotUnfoldPureLets] env c
                 in
              (let uu____11470 =
                 FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
               if uu____11470
               then
                 let uu____11473 = FStar_Syntax_Print.comp_to_string c1  in
                 FStar_Util.print1 "Normalized to:\n\t %s\n" uu____11473
               else ());
              c1)
              in
           let env_uvars = FStar_TypeChecker_Env.uvars_in_env env  in
           let gen_uvars uvs =
             let uu____11491 = FStar_Util.set_difference uvs env_uvars  in
             FStar_All.pipe_right uu____11491 FStar_Util.set_elements  in
           let univs_and_uvars_of_lec uu____11525 =
             match uu____11525 with
             | (lbname,e,c) ->
                 let c1 = norm1 c  in
                 let t = FStar_Syntax_Util.comp_result c1  in
                 let univs1 = FStar_Syntax_Free.univs t  in
                 let uvt = FStar_Syntax_Free.uvars t  in
                 ((let uu____11562 =
                     FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                       (FStar_Options.Other "Gen")
                      in
                   if uu____11562
                   then
                     let uu____11567 =
                       let uu____11569 =
                         let uu____11573 = FStar_Util.set_elements univs1  in
                         FStar_All.pipe_right uu____11573
                           (FStar_List.map
                              (fun u  ->
                                 FStar_Syntax_Print.univ_to_string
                                   (FStar_Syntax_Syntax.U_unif u)))
                          in
                       FStar_All.pipe_right uu____11569
                         (FStar_String.concat ", ")
                        in
                     let uu____11621 =
                       let uu____11623 =
                         let uu____11627 = FStar_Util.set_elements uvt  in
                         FStar_All.pipe_right uu____11627
                           (FStar_List.map
                              (fun u  ->
                                 let uu____11640 =
                                   FStar_Syntax_Print.uvar_to_string
                                     u.FStar_Syntax_Syntax.ctx_uvar_head
                                    in
                                 let uu____11642 =
                                   FStar_Syntax_Print.term_to_string
                                     u.FStar_Syntax_Syntax.ctx_uvar_typ
                                    in
                                 FStar_Util.format2 "(%s : %s)" uu____11640
                                   uu____11642))
                          in
                       FStar_All.pipe_right uu____11623
                         (FStar_String.concat ", ")
                        in
                     FStar_Util.print2
                       "^^^^\n\tFree univs = %s\n\tFree uvt=%s\n" uu____11567
                       uu____11621
                   else ());
                  (let univs2 =
                     let uu____11656 = FStar_Util.set_elements uvt  in
                     FStar_List.fold_left
                       (fun univs2  ->
                          fun uv  ->
                            let uu____11668 =
                              FStar_Syntax_Free.univs
                                uv.FStar_Syntax_Syntax.ctx_uvar_typ
                               in
                            FStar_Util.set_union univs2 uu____11668) univs1
                       uu____11656
                      in
                   let uvs = gen_uvars uvt  in
                   (let uu____11675 =
                      FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                        (FStar_Options.Other "Gen")
                       in
                    if uu____11675
                    then
                      let uu____11680 =
                        let uu____11682 =
                          let uu____11686 = FStar_Util.set_elements univs2
                             in
                          FStar_All.pipe_right uu____11686
                            (FStar_List.map
                               (fun u  ->
                                  FStar_Syntax_Print.univ_to_string
                                    (FStar_Syntax_Syntax.U_unif u)))
                           in
                        FStar_All.pipe_right uu____11682
                          (FStar_String.concat ", ")
                         in
                      let uu____11734 =
                        let uu____11736 =
                          FStar_All.pipe_right uvs
                            (FStar_List.map
                               (fun u  ->
                                  let uu____11750 =
                                    FStar_Syntax_Print.uvar_to_string
                                      u.FStar_Syntax_Syntax.ctx_uvar_head
                                     in
                                  let uu____11752 =
                                    FStar_TypeChecker_Normalize.term_to_string
                                      env u.FStar_Syntax_Syntax.ctx_uvar_typ
                                     in
                                  FStar_Util.format2 "(%s : %s)" uu____11750
                                    uu____11752))
                           in
                        FStar_All.pipe_right uu____11736
                          (FStar_String.concat ", ")
                         in
                      FStar_Util.print2
                        "^^^^\n\tFree univs = %s\n\tgen_uvars =%s"
                        uu____11680 uu____11734
                    else ());
                   (univs2, uvs, (lbname, e, c1))))
              in
           let uu____11773 =
             let uu____11790 = FStar_List.hd lecs  in
             univs_and_uvars_of_lec uu____11790  in
           match uu____11773 with
           | (univs1,uvs,lec_hd) ->
               let force_univs_eq lec2 u1 u2 =
                 let uu____11880 =
                   (FStar_Util.set_is_subset_of u1 u2) &&
                     (FStar_Util.set_is_subset_of u2 u1)
                    in
                 if uu____11880
                 then ()
                 else
                   (let uu____11885 = lec_hd  in
                    match uu____11885 with
                    | (lb1,uu____11893,uu____11894) ->
                        let uu____11895 = lec2  in
                        (match uu____11895 with
                         | (lb2,uu____11903,uu____11904) ->
                             let msg =
                               let uu____11907 =
                                 FStar_Syntax_Print.lbname_to_string lb1  in
                               let uu____11909 =
                                 FStar_Syntax_Print.lbname_to_string lb2  in
                               FStar_Util.format2
                                 "Generalizing the types of these mutually recursive definitions requires an incompatible set of universes for %s and %s"
                                 uu____11907 uu____11909
                                in
                             let uu____11912 =
                               FStar_TypeChecker_Env.get_range env  in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_IncompatibleSetOfUniverse,
                                 msg) uu____11912))
                  in
               let force_uvars_eq lec2 u1 u2 =
                 let uvars_subseteq u11 u21 =
                   FStar_All.pipe_right u11
                     (FStar_Util.for_all
                        (fun u  ->
                           FStar_All.pipe_right u21
                             (FStar_Util.for_some
                                (fun u'  ->
                                   FStar_Syntax_Unionfind.equiv
                                     u.FStar_Syntax_Syntax.ctx_uvar_head
                                     u'.FStar_Syntax_Syntax.ctx_uvar_head))))
                    in
                 let uu____11980 =
                   (uvars_subseteq u1 u2) && (uvars_subseteq u2 u1)  in
                 if uu____11980
                 then ()
                 else
                   (let uu____11985 = lec_hd  in
                    match uu____11985 with
                    | (lb1,uu____11993,uu____11994) ->
                        let uu____11995 = lec2  in
                        (match uu____11995 with
                         | (lb2,uu____12003,uu____12004) ->
                             let msg =
                               let uu____12007 =
                                 FStar_Syntax_Print.lbname_to_string lb1  in
                               let uu____12009 =
                                 FStar_Syntax_Print.lbname_to_string lb2  in
                               FStar_Util.format2
                                 "Generalizing the types of these mutually recursive definitions requires an incompatible number of types for %s and %s"
                                 uu____12007 uu____12009
                                in
                             let uu____12012 =
                               FStar_TypeChecker_Env.get_range env  in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_IncompatibleNumberOfTypes,
                                 msg) uu____12012))
                  in
               let lecs1 =
                 let uu____12023 = FStar_List.tl lecs  in
                 FStar_List.fold_right
                   (fun this_lec  ->
                      fun lecs1  ->
                        let uu____12076 = univs_and_uvars_of_lec this_lec  in
                        match uu____12076 with
                        | (this_univs,this_uvs,this_lec1) ->
                            (force_univs_eq this_lec1 univs1 this_univs;
                             force_uvars_eq this_lec1 uvs this_uvs;
                             this_lec1
                             ::
                             lecs1)) uu____12023 []
                  in
               let lecs2 = lec_hd :: lecs1  in
               let gen_types uvs1 =
                 let fail1 k =
                   let uu____12181 = lec_hd  in
                   match uu____12181 with
                   | (lbname,e,c) ->
                       let uu____12191 =
                         let uu____12197 =
                           let uu____12199 =
                             FStar_Syntax_Print.term_to_string k  in
                           let uu____12201 =
                             FStar_Syntax_Print.lbname_to_string lbname  in
                           let uu____12203 =
                             FStar_Syntax_Print.term_to_string
                               (FStar_Syntax_Util.comp_result c)
                              in
                           FStar_Util.format3
                             "Failed to resolve implicit argument of type '%s' in the type of %s (%s)"
                             uu____12199 uu____12201 uu____12203
                            in
                         (FStar_Errors.Fatal_FailToResolveImplicitArgument,
                           uu____12197)
                          in
                       let uu____12207 = FStar_TypeChecker_Env.get_range env
                          in
                       FStar_Errors.raise_error uu____12191 uu____12207
                    in
                 FStar_All.pipe_right uvs1
                   (FStar_List.map
                      (fun u  ->
                         let uu____12226 =
                           FStar_Syntax_Unionfind.find
                             u.FStar_Syntax_Syntax.ctx_uvar_head
                            in
                         match uu____12226 with
                         | FStar_Pervasives_Native.Some uu____12235 ->
                             failwith
                               "Unexpected instantiation of mutually recursive uvar"
                         | uu____12243 ->
                             let k =
                               FStar_TypeChecker_Normalize.normalize
                                 [FStar_TypeChecker_Env.Beta;
                                 FStar_TypeChecker_Env.Exclude
                                   FStar_TypeChecker_Env.Zeta] env
                                 u.FStar_Syntax_Syntax.ctx_uvar_typ
                                in
                             let uu____12247 =
                               FStar_Syntax_Util.arrow_formals k  in
                             (match uu____12247 with
                              | (bs,kres) ->
                                  ((let uu____12291 =
                                      let uu____12292 =
                                        let uu____12295 =
                                          FStar_TypeChecker_Normalize.unfold_whnf
                                            env kres
                                           in
                                        FStar_Syntax_Util.unrefine
                                          uu____12295
                                         in
                                      uu____12292.FStar_Syntax_Syntax.n  in
                                    match uu____12291 with
                                    | FStar_Syntax_Syntax.Tm_type uu____12296
                                        ->
                                        let free =
                                          FStar_Syntax_Free.names kres  in
                                        let uu____12300 =
                                          let uu____12302 =
                                            FStar_Util.set_is_empty free  in
                                          Prims.op_Negation uu____12302  in
                                        if uu____12300
                                        then fail1 kres
                                        else ()
                                    | uu____12307 -> fail1 kres);
                                   (let a =
                                      let uu____12309 =
                                        let uu____12312 =
                                          FStar_TypeChecker_Env.get_range env
                                           in
                                        FStar_All.pipe_left
                                          (fun _12315  ->
                                             FStar_Pervasives_Native.Some
                                               _12315) uu____12312
                                         in
                                      FStar_Syntax_Syntax.new_bv uu____12309
                                        kres
                                       in
                                    let t =
                                      match bs with
                                      | [] ->
                                          FStar_Syntax_Syntax.bv_to_name a
                                      | uu____12323 ->
                                          let uu____12332 =
                                            FStar_Syntax_Syntax.bv_to_name a
                                             in
                                          FStar_Syntax_Util.abs bs
                                            uu____12332
                                            (FStar_Pervasives_Native.Some
                                               (FStar_Syntax_Util.residual_tot
                                                  kres))
                                       in
                                    FStar_Syntax_Util.set_uvar
                                      u.FStar_Syntax_Syntax.ctx_uvar_head t;
                                    (a,
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag)))))))
                  in
               let gen_univs1 = gen_univs env univs1  in
               let gen_tvars = gen_types uvs  in
               let ecs =
                 FStar_All.pipe_right lecs2
                   (FStar_List.map
                      (fun uu____12435  ->
                         match uu____12435 with
                         | (lbname,e,c) ->
                             let uu____12481 =
                               match (gen_tvars, gen_univs1) with
                               | ([],[]) -> (e, c, [])
                               | uu____12542 ->
                                   let uu____12555 = (e, c)  in
                                   (match uu____12555 with
                                    | (e0,c0) ->
                                        let c1 =
                                          FStar_TypeChecker_Normalize.normalize_comp
                                            [FStar_TypeChecker_Env.Beta;
                                            FStar_TypeChecker_Env.DoNotUnfoldPureLets;
                                            FStar_TypeChecker_Env.CompressUvars;
                                            FStar_TypeChecker_Env.NoFullNorm;
                                            FStar_TypeChecker_Env.Exclude
                                              FStar_TypeChecker_Env.Zeta] env
                                            c
                                           in
                                        let e1 =
                                          FStar_TypeChecker_Normalize.reduce_uvar_solutions
                                            env e
                                           in
                                        let e2 =
                                          if is_rec
                                          then
                                            let tvar_args =
                                              FStar_List.map
                                                (fun uu____12595  ->
                                                   match uu____12595 with
                                                   | (x,uu____12601) ->
                                                       let uu____12602 =
                                                         FStar_Syntax_Syntax.bv_to_name
                                                           x
                                                          in
                                                       FStar_Syntax_Syntax.iarg
                                                         uu____12602)
                                                gen_tvars
                                               in
                                            let instantiate_lbname_with_app
                                              tm fv =
                                              let uu____12620 =
                                                let uu____12622 =
                                                  FStar_Util.right lbname  in
                                                FStar_Syntax_Syntax.fv_eq fv
                                                  uu____12622
                                                 in
                                              if uu____12620
                                              then
                                                FStar_Syntax_Syntax.mk_Tm_app
                                                  tm tvar_args
                                                  FStar_Pervasives_Native.None
                                                  tm.FStar_Syntax_Syntax.pos
                                              else tm  in
                                            FStar_Syntax_InstFV.inst
                                              instantiate_lbname_with_app e1
                                          else e1  in
                                        let t =
                                          let uu____12631 =
                                            let uu____12632 =
                                              FStar_Syntax_Subst.compress
                                                (FStar_Syntax_Util.comp_result
                                                   c1)
                                               in
                                            uu____12632.FStar_Syntax_Syntax.n
                                             in
                                          match uu____12631 with
                                          | FStar_Syntax_Syntax.Tm_arrow
                                              (bs,cod) ->
                                              let uu____12657 =
                                                FStar_Syntax_Subst.open_comp
                                                  bs cod
                                                 in
                                              (match uu____12657 with
                                               | (bs1,cod1) ->
                                                   FStar_Syntax_Util.arrow
                                                     (FStar_List.append
                                                        gen_tvars bs1) cod1)
                                          | uu____12668 ->
                                              FStar_Syntax_Util.arrow
                                                gen_tvars c1
                                           in
                                        let e' =
                                          FStar_Syntax_Util.abs gen_tvars e2
                                            (FStar_Pervasives_Native.Some
                                               (FStar_Syntax_Util.residual_comp_of_comp
                                                  c1))
                                           in
                                        let uu____12672 =
                                          FStar_Syntax_Syntax.mk_Total t  in
                                        (e', uu____12672, gen_tvars))
                                in
                             (match uu____12481 with
                              | (e1,c1,gvs) ->
                                  (lbname, gen_univs1, e1, c1, gvs))))
                  in
               FStar_Pervasives_Native.Some ecs)
  
let (generalize :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.term *
        FStar_Syntax_Syntax.comp) Prims.list ->
        (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.univ_names *
          FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.comp *
          FStar_Syntax_Syntax.binder Prims.list) Prims.list)
  =
  fun env  ->
    fun is_rec  ->
      fun lecs  ->
        (let uu____12819 = FStar_TypeChecker_Env.debug env FStar_Options.Low
            in
         if uu____12819
         then
           let uu____12822 =
             let uu____12824 =
               FStar_List.map
                 (fun uu____12839  ->
                    match uu____12839 with
                    | (lb,uu____12848,uu____12849) ->
                        FStar_Syntax_Print.lbname_to_string lb) lecs
                in
             FStar_All.pipe_right uu____12824 (FStar_String.concat ", ")  in
           FStar_Util.print1 "Generalizing: %s\n" uu____12822
         else ());
        (let univnames_lecs =
           FStar_List.map
             (fun uu____12875  ->
                match uu____12875 with
                | (l,t,c) -> gather_free_univnames env t) lecs
            in
         let generalized_lecs =
           let uu____12904 = gen env is_rec lecs  in
           match uu____12904 with
           | FStar_Pervasives_Native.None  ->
               FStar_All.pipe_right lecs
                 (FStar_List.map
                    (fun uu____13003  ->
                       match uu____13003 with | (l,t,c) -> (l, [], t, c, [])))
           | FStar_Pervasives_Native.Some luecs ->
               ((let uu____13065 =
                   FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
                 if uu____13065
                 then
                   FStar_All.pipe_right luecs
                     (FStar_List.iter
                        (fun uu____13113  ->
                           match uu____13113 with
                           | (l,us,e,c,gvs) ->
                               let uu____13147 =
                                 FStar_Range.string_of_range
                                   e.FStar_Syntax_Syntax.pos
                                  in
                               let uu____13149 =
                                 FStar_Syntax_Print.lbname_to_string l  in
                               let uu____13151 =
                                 FStar_Syntax_Print.term_to_string
                                   (FStar_Syntax_Util.comp_result c)
                                  in
                               let uu____13153 =
                                 FStar_Syntax_Print.term_to_string e  in
                               let uu____13155 =
                                 FStar_Syntax_Print.binders_to_string ", "
                                   gvs
                                  in
                               FStar_Util.print5
                                 "(%s) Generalized %s at type %s\n%s\nVars = (%s)\n"
                                 uu____13147 uu____13149 uu____13151
                                 uu____13153 uu____13155))
                 else ());
                luecs)
            in
         FStar_List.map2
           (fun univnames1  ->
              fun uu____13200  ->
                match uu____13200 with
                | (l,generalized_univs,t,c,gvs) ->
                    let uu____13244 =
                      check_universe_generalization univnames1
                        generalized_univs t
                       in
                    (l, uu____13244, t, c, gvs)) univnames_lecs
           generalized_lecs)
  
let (check_and_ascribe :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun e  ->
      fun t1  ->
        fun t2  ->
          let env1 =
            FStar_TypeChecker_Env.set_range env e.FStar_Syntax_Syntax.pos  in
          let check1 env2 t11 t21 =
            if env2.FStar_TypeChecker_Env.use_eq
            then FStar_TypeChecker_Rel.try_teq true env2 t11 t21
            else
              (let uu____13305 =
                 FStar_TypeChecker_Rel.get_subtyping_predicate env2 t11 t21
                  in
               match uu____13305 with
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
               | FStar_Pervasives_Native.Some f ->
                   let uu____13311 = FStar_TypeChecker_Env.apply_guard f e
                      in
                   FStar_All.pipe_left
                     (fun _13314  -> FStar_Pervasives_Native.Some _13314)
                     uu____13311)
             in
          let is_var e1 =
            let uu____13322 =
              let uu____13323 = FStar_Syntax_Subst.compress e1  in
              uu____13323.FStar_Syntax_Syntax.n  in
            match uu____13322 with
            | FStar_Syntax_Syntax.Tm_name uu____13327 -> true
            | uu____13329 -> false  in
          let decorate e1 t =
            let e2 = FStar_Syntax_Subst.compress e1  in
            match e2.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Tm_name x ->
                FStar_Syntax_Syntax.mk
                  (FStar_Syntax_Syntax.Tm_name
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                     (let uu___1563_13256 = x  in
                      {
                        FStar_Syntax_Syntax.ppname =
                          (uu___1563_13256.FStar_Syntax_Syntax.ppname);
                        FStar_Syntax_Syntax.index =
                          (uu___1563_13256.FStar_Syntax_Syntax.index);
=======
                     (let uu___1298_10043 = x  in
=======
                     (let uu___1299_10043 = x  in
>>>>>>> snap
                      {
                        FStar_Syntax_Syntax.ppname =
                          (uu___1299_10043.FStar_Syntax_Syntax.ppname);
                        FStar_Syntax_Syntax.index =
<<<<<<< HEAD
                          (uu___1298_10043.FStar_Syntax_Syntax.index);
>>>>>>> snap
=======
                     (let uu___1596_13349 = x  in
=======
                     (let uu___1596_13350 = x  in
>>>>>>> cp
                      {
                        FStar_Syntax_Syntax.ppname =
                          (uu___1596_13350.FStar_Syntax_Syntax.ppname);
                        FStar_Syntax_Syntax.index =
<<<<<<< HEAD
                          (uu___1596_13349.FStar_Syntax_Syntax.index);
>>>>>>> snap
=======
                          (uu___1299_10043.FStar_Syntax_Syntax.index);
>>>>>>> snap
=======
                          (uu___1596_13350.FStar_Syntax_Syntax.index);
>>>>>>> cp
                        FStar_Syntax_Syntax.sort = t2
                      })) FStar_Pervasives_Native.None
                  e2.FStar_Syntax_Syntax.pos
            | uu____13351 -> e2  in
          let env2 =
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
            let uu___1566_13259 = env1  in
            let uu____13260 =
=======
            let uu___1301_10046 = env1  in
=======
            let uu___1302_10046 = env1  in
>>>>>>> snap
            let uu____10047 =
>>>>>>> snap
=======
            let uu___1599_13352 = env1  in
            let uu____13353 =
>>>>>>> snap
=======
            let uu___1599_13353 = env1  in
            let uu____13354 =
>>>>>>> cp
              env1.FStar_TypeChecker_Env.use_eq ||
                (env1.FStar_TypeChecker_Env.is_pattern && (is_var e))
               in
            {
              FStar_TypeChecker_Env.solver =
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                (uu___1566_13259.FStar_TypeChecker_Env.solver);
              FStar_TypeChecker_Env.range =
                (uu___1566_13259.FStar_TypeChecker_Env.range);
              FStar_TypeChecker_Env.curmodule =
                (uu___1566_13259.FStar_TypeChecker_Env.curmodule);
              FStar_TypeChecker_Env.gamma =
                (uu___1566_13259.FStar_TypeChecker_Env.gamma);
              FStar_TypeChecker_Env.gamma_sig =
                (uu___1566_13259.FStar_TypeChecker_Env.gamma_sig);
              FStar_TypeChecker_Env.gamma_cache =
                (uu___1566_13259.FStar_TypeChecker_Env.gamma_cache);
              FStar_TypeChecker_Env.modules =
                (uu___1566_13259.FStar_TypeChecker_Env.modules);
              FStar_TypeChecker_Env.expected_typ =
                (uu___1566_13259.FStar_TypeChecker_Env.expected_typ);
              FStar_TypeChecker_Env.sigtab =
                (uu___1566_13259.FStar_TypeChecker_Env.sigtab);
              FStar_TypeChecker_Env.attrtab =
                (uu___1566_13259.FStar_TypeChecker_Env.attrtab);
              FStar_TypeChecker_Env.is_pattern =
                (uu___1566_13259.FStar_TypeChecker_Env.is_pattern);
              FStar_TypeChecker_Env.instantiate_imp =
                (uu___1566_13259.FStar_TypeChecker_Env.instantiate_imp);
              FStar_TypeChecker_Env.effects =
                (uu___1566_13259.FStar_TypeChecker_Env.effects);
              FStar_TypeChecker_Env.generalize =
                (uu___1566_13259.FStar_TypeChecker_Env.generalize);
              FStar_TypeChecker_Env.letrecs =
                (uu___1566_13259.FStar_TypeChecker_Env.letrecs);
              FStar_TypeChecker_Env.top_level =
                (uu___1566_13259.FStar_TypeChecker_Env.top_level);
              FStar_TypeChecker_Env.check_uvars =
                (uu___1566_13259.FStar_TypeChecker_Env.check_uvars);
              FStar_TypeChecker_Env.use_eq = uu____13260;
              FStar_TypeChecker_Env.is_iface =
                (uu___1566_13259.FStar_TypeChecker_Env.is_iface);
              FStar_TypeChecker_Env.admit =
                (uu___1566_13259.FStar_TypeChecker_Env.admit);
              FStar_TypeChecker_Env.lax =
                (uu___1566_13259.FStar_TypeChecker_Env.lax);
              FStar_TypeChecker_Env.lax_universes =
                (uu___1566_13259.FStar_TypeChecker_Env.lax_universes);
              FStar_TypeChecker_Env.phase1 =
                (uu___1566_13259.FStar_TypeChecker_Env.phase1);
              FStar_TypeChecker_Env.failhard =
                (uu___1566_13259.FStar_TypeChecker_Env.failhard);
              FStar_TypeChecker_Env.nosynth =
                (uu___1566_13259.FStar_TypeChecker_Env.nosynth);
              FStar_TypeChecker_Env.uvar_subtyping =
                (uu___1566_13259.FStar_TypeChecker_Env.uvar_subtyping);
              FStar_TypeChecker_Env.tc_term =
                (uu___1566_13259.FStar_TypeChecker_Env.tc_term);
              FStar_TypeChecker_Env.type_of =
                (uu___1566_13259.FStar_TypeChecker_Env.type_of);
              FStar_TypeChecker_Env.universe_of =
                (uu___1566_13259.FStar_TypeChecker_Env.universe_of);
              FStar_TypeChecker_Env.check_type_of =
                (uu___1566_13259.FStar_TypeChecker_Env.check_type_of);
              FStar_TypeChecker_Env.use_bv_sorts =
                (uu___1566_13259.FStar_TypeChecker_Env.use_bv_sorts);
              FStar_TypeChecker_Env.qtbl_name_and_index =
                (uu___1566_13259.FStar_TypeChecker_Env.qtbl_name_and_index);
              FStar_TypeChecker_Env.normalized_eff_names =
                (uu___1566_13259.FStar_TypeChecker_Env.normalized_eff_names);
              FStar_TypeChecker_Env.fv_delta_depths =
                (uu___1566_13259.FStar_TypeChecker_Env.fv_delta_depths);
              FStar_TypeChecker_Env.proof_ns =
                (uu___1566_13259.FStar_TypeChecker_Env.proof_ns);
              FStar_TypeChecker_Env.synth_hook =
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                (uu___1493_12204.FStar_TypeChecker_Env.synth_hook);
=======
                (uu___1486_12242.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___1486_12242.FStar_TypeChecker_Env.try_solve_implicits_hook);
>>>>>>> snap
=======
                (uu___1470_12026.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___1470_12026.FStar_TypeChecker_Env.try_solve_implicits_hook);
>>>>>>> snap
=======
                (uu___1477_12144.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___1477_12144.FStar_TypeChecker_Env.try_solve_implicits_hook);
>>>>>>> snap
=======
                (uu___1487_12280.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___1487_12280.FStar_TypeChecker_Env.try_solve_implicits_hook);
>>>>>>> snap
=======
                (uu___1488_12306.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___1488_12306.FStar_TypeChecker_Env.try_solve_implicits_hook);
>>>>>>> snap
=======
                (uu___1505_12328.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___1505_12328.FStar_TypeChecker_Env.try_solve_implicits_hook);
>>>>>>> snap
=======
                (uu___1497_12138.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___1497_12138.FStar_TypeChecker_Env.try_solve_implicits_hook);
>>>>>>> snap
=======
                (uu___1499_12153.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___1499_12153.FStar_TypeChecker_Env.try_solve_implicits_hook);
>>>>>>> snap
=======
                (uu___1508_12202.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___1508_12202.FStar_TypeChecker_Env.try_solve_implicits_hook);
>>>>>>> snap
=======
                (uu___1566_13259.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___1566_13259.FStar_TypeChecker_Env.try_solve_implicits_hook);
>>>>>>> snap
              FStar_TypeChecker_Env.splice =
                (uu___1566_13259.FStar_TypeChecker_Env.splice);
              FStar_TypeChecker_Env.postprocess =
                (uu___1566_13259.FStar_TypeChecker_Env.postprocess);
              FStar_TypeChecker_Env.is_native_tactic =
                (uu___1566_13259.FStar_TypeChecker_Env.is_native_tactic);
              FStar_TypeChecker_Env.identifier_info =
                (uu___1566_13259.FStar_TypeChecker_Env.identifier_info);
              FStar_TypeChecker_Env.tc_hooks =
                (uu___1566_13259.FStar_TypeChecker_Env.tc_hooks);
              FStar_TypeChecker_Env.dsenv =
                (uu___1566_13259.FStar_TypeChecker_Env.dsenv);
              FStar_TypeChecker_Env.nbe =
                (uu___1566_13259.FStar_TypeChecker_Env.nbe);
              FStar_TypeChecker_Env.strict_args_tab =
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                (uu___1499_12153.FStar_TypeChecker_Env.strict_args_tab)
=======
                (uu___1300_10046.FStar_TypeChecker_Env.strict_args_tab);
              FStar_TypeChecker_Env.erasable_types_tab =
                (uu___1300_10046.FStar_TypeChecker_Env.erasable_types_tab)
>>>>>>> snap
=======
                (uu___1508_12202.FStar_TypeChecker_Env.strict_args_tab)
>>>>>>> snap
=======
                (uu___1566_13259.FStar_TypeChecker_Env.strict_args_tab)
>>>>>>> snap
=======
                (uu___1301_10046.FStar_TypeChecker_Env.solver);
=======
                (uu___1302_10046.FStar_TypeChecker_Env.solver);
>>>>>>> snap
              FStar_TypeChecker_Env.range =
                (uu___1302_10046.FStar_TypeChecker_Env.range);
              FStar_TypeChecker_Env.curmodule =
                (uu___1302_10046.FStar_TypeChecker_Env.curmodule);
              FStar_TypeChecker_Env.gamma =
                (uu___1302_10046.FStar_TypeChecker_Env.gamma);
              FStar_TypeChecker_Env.gamma_sig =
                (uu___1302_10046.FStar_TypeChecker_Env.gamma_sig);
              FStar_TypeChecker_Env.gamma_cache =
                (uu___1302_10046.FStar_TypeChecker_Env.gamma_cache);
              FStar_TypeChecker_Env.modules =
                (uu___1302_10046.FStar_TypeChecker_Env.modules);
              FStar_TypeChecker_Env.expected_typ =
                (uu___1302_10046.FStar_TypeChecker_Env.expected_typ);
              FStar_TypeChecker_Env.sigtab =
                (uu___1302_10046.FStar_TypeChecker_Env.sigtab);
              FStar_TypeChecker_Env.attrtab =
                (uu___1302_10046.FStar_TypeChecker_Env.attrtab);
              FStar_TypeChecker_Env.is_pattern =
                (uu___1302_10046.FStar_TypeChecker_Env.is_pattern);
              FStar_TypeChecker_Env.instantiate_imp =
                (uu___1302_10046.FStar_TypeChecker_Env.instantiate_imp);
              FStar_TypeChecker_Env.effects =
                (uu___1302_10046.FStar_TypeChecker_Env.effects);
              FStar_TypeChecker_Env.generalize =
                (uu___1302_10046.FStar_TypeChecker_Env.generalize);
              FStar_TypeChecker_Env.letrecs =
                (uu___1302_10046.FStar_TypeChecker_Env.letrecs);
              FStar_TypeChecker_Env.top_level =
                (uu___1302_10046.FStar_TypeChecker_Env.top_level);
              FStar_TypeChecker_Env.check_uvars =
                (uu___1302_10046.FStar_TypeChecker_Env.check_uvars);
              FStar_TypeChecker_Env.use_eq = uu____10047;
              FStar_TypeChecker_Env.is_iface =
                (uu___1302_10046.FStar_TypeChecker_Env.is_iface);
              FStar_TypeChecker_Env.admit =
                (uu___1302_10046.FStar_TypeChecker_Env.admit);
              FStar_TypeChecker_Env.lax =
                (uu___1302_10046.FStar_TypeChecker_Env.lax);
              FStar_TypeChecker_Env.lax_universes =
                (uu___1302_10046.FStar_TypeChecker_Env.lax_universes);
              FStar_TypeChecker_Env.phase1 =
                (uu___1302_10046.FStar_TypeChecker_Env.phase1);
              FStar_TypeChecker_Env.failhard =
                (uu___1302_10046.FStar_TypeChecker_Env.failhard);
              FStar_TypeChecker_Env.nosynth =
                (uu___1302_10046.FStar_TypeChecker_Env.nosynth);
              FStar_TypeChecker_Env.uvar_subtyping =
                (uu___1302_10046.FStar_TypeChecker_Env.uvar_subtyping);
              FStar_TypeChecker_Env.tc_term =
                (uu___1302_10046.FStar_TypeChecker_Env.tc_term);
              FStar_TypeChecker_Env.type_of =
                (uu___1302_10046.FStar_TypeChecker_Env.type_of);
              FStar_TypeChecker_Env.universe_of =
                (uu___1302_10046.FStar_TypeChecker_Env.universe_of);
              FStar_TypeChecker_Env.check_type_of =
                (uu___1302_10046.FStar_TypeChecker_Env.check_type_of);
              FStar_TypeChecker_Env.use_bv_sorts =
                (uu___1302_10046.FStar_TypeChecker_Env.use_bv_sorts);
              FStar_TypeChecker_Env.qtbl_name_and_index =
                (uu___1302_10046.FStar_TypeChecker_Env.qtbl_name_and_index);
              FStar_TypeChecker_Env.normalized_eff_names =
                (uu___1302_10046.FStar_TypeChecker_Env.normalized_eff_names);
              FStar_TypeChecker_Env.fv_delta_depths =
                (uu___1302_10046.FStar_TypeChecker_Env.fv_delta_depths);
              FStar_TypeChecker_Env.proof_ns =
                (uu___1302_10046.FStar_TypeChecker_Env.proof_ns);
              FStar_TypeChecker_Env.synth_hook =
                (uu___1302_10046.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.splice =
                (uu___1302_10046.FStar_TypeChecker_Env.splice);
              FStar_TypeChecker_Env.postprocess =
                (uu___1302_10046.FStar_TypeChecker_Env.postprocess);
              FStar_TypeChecker_Env.is_native_tactic =
                (uu___1302_10046.FStar_TypeChecker_Env.is_native_tactic);
              FStar_TypeChecker_Env.identifier_info =
                (uu___1302_10046.FStar_TypeChecker_Env.identifier_info);
              FStar_TypeChecker_Env.tc_hooks =
                (uu___1302_10046.FStar_TypeChecker_Env.tc_hooks);
              FStar_TypeChecker_Env.dsenv =
                (uu___1302_10046.FStar_TypeChecker_Env.dsenv);
              FStar_TypeChecker_Env.nbe =
                (uu___1302_10046.FStar_TypeChecker_Env.nbe);
              FStar_TypeChecker_Env.strict_args_tab =
                (uu___1302_10046.FStar_TypeChecker_Env.strict_args_tab);
              FStar_TypeChecker_Env.erasable_types_tab =
<<<<<<< HEAD
                (uu___1301_10046.FStar_TypeChecker_Env.erasable_types_tab)
>>>>>>> snap
=======
                (uu___1599_13352.FStar_TypeChecker_Env.solver);
=======
                (uu___1599_13353.FStar_TypeChecker_Env.solver);
>>>>>>> cp
              FStar_TypeChecker_Env.range =
                (uu___1599_13353.FStar_TypeChecker_Env.range);
              FStar_TypeChecker_Env.curmodule =
                (uu___1599_13353.FStar_TypeChecker_Env.curmodule);
              FStar_TypeChecker_Env.gamma =
                (uu___1599_13353.FStar_TypeChecker_Env.gamma);
              FStar_TypeChecker_Env.gamma_sig =
                (uu___1599_13353.FStar_TypeChecker_Env.gamma_sig);
              FStar_TypeChecker_Env.gamma_cache =
                (uu___1599_13353.FStar_TypeChecker_Env.gamma_cache);
              FStar_TypeChecker_Env.modules =
                (uu___1599_13353.FStar_TypeChecker_Env.modules);
              FStar_TypeChecker_Env.expected_typ =
                (uu___1599_13353.FStar_TypeChecker_Env.expected_typ);
              FStar_TypeChecker_Env.sigtab =
                (uu___1599_13353.FStar_TypeChecker_Env.sigtab);
              FStar_TypeChecker_Env.attrtab =
                (uu___1599_13353.FStar_TypeChecker_Env.attrtab);
              FStar_TypeChecker_Env.is_pattern =
                (uu___1599_13353.FStar_TypeChecker_Env.is_pattern);
              FStar_TypeChecker_Env.instantiate_imp =
                (uu___1599_13353.FStar_TypeChecker_Env.instantiate_imp);
              FStar_TypeChecker_Env.effects =
                (uu___1599_13353.FStar_TypeChecker_Env.effects);
              FStar_TypeChecker_Env.generalize =
                (uu___1599_13353.FStar_TypeChecker_Env.generalize);
              FStar_TypeChecker_Env.letrecs =
                (uu___1599_13353.FStar_TypeChecker_Env.letrecs);
              FStar_TypeChecker_Env.top_level =
                (uu___1599_13353.FStar_TypeChecker_Env.top_level);
              FStar_TypeChecker_Env.check_uvars =
                (uu___1599_13353.FStar_TypeChecker_Env.check_uvars);
              FStar_TypeChecker_Env.use_eq = uu____13354;
              FStar_TypeChecker_Env.is_iface =
                (uu___1599_13353.FStar_TypeChecker_Env.is_iface);
              FStar_TypeChecker_Env.admit =
                (uu___1599_13353.FStar_TypeChecker_Env.admit);
              FStar_TypeChecker_Env.lax =
                (uu___1599_13353.FStar_TypeChecker_Env.lax);
              FStar_TypeChecker_Env.lax_universes =
                (uu___1599_13353.FStar_TypeChecker_Env.lax_universes);
              FStar_TypeChecker_Env.phase1 =
                (uu___1599_13353.FStar_TypeChecker_Env.phase1);
              FStar_TypeChecker_Env.failhard =
                (uu___1599_13353.FStar_TypeChecker_Env.failhard);
              FStar_TypeChecker_Env.nosynth =
                (uu___1599_13353.FStar_TypeChecker_Env.nosynth);
              FStar_TypeChecker_Env.uvar_subtyping =
                (uu___1599_13353.FStar_TypeChecker_Env.uvar_subtyping);
              FStar_TypeChecker_Env.tc_term =
                (uu___1599_13353.FStar_TypeChecker_Env.tc_term);
              FStar_TypeChecker_Env.type_of =
                (uu___1599_13353.FStar_TypeChecker_Env.type_of);
              FStar_TypeChecker_Env.universe_of =
                (uu___1599_13353.FStar_TypeChecker_Env.universe_of);
              FStar_TypeChecker_Env.check_type_of =
                (uu___1599_13353.FStar_TypeChecker_Env.check_type_of);
              FStar_TypeChecker_Env.use_bv_sorts =
                (uu___1599_13353.FStar_TypeChecker_Env.use_bv_sorts);
              FStar_TypeChecker_Env.qtbl_name_and_index =
                (uu___1599_13353.FStar_TypeChecker_Env.qtbl_name_and_index);
              FStar_TypeChecker_Env.normalized_eff_names =
                (uu___1599_13353.FStar_TypeChecker_Env.normalized_eff_names);
              FStar_TypeChecker_Env.fv_delta_depths =
                (uu___1599_13353.FStar_TypeChecker_Env.fv_delta_depths);
              FStar_TypeChecker_Env.proof_ns =
                (uu___1599_13353.FStar_TypeChecker_Env.proof_ns);
              FStar_TypeChecker_Env.synth_hook =
                (uu___1599_13353.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.try_solve_implicits_hook =
                (uu___1599_13353.FStar_TypeChecker_Env.try_solve_implicits_hook);
              FStar_TypeChecker_Env.splice =
                (uu___1599_13353.FStar_TypeChecker_Env.splice);
              FStar_TypeChecker_Env.postprocess =
                (uu___1599_13353.FStar_TypeChecker_Env.postprocess);
              FStar_TypeChecker_Env.is_native_tactic =
                (uu___1599_13353.FStar_TypeChecker_Env.is_native_tactic);
              FStar_TypeChecker_Env.identifier_info =
                (uu___1599_13353.FStar_TypeChecker_Env.identifier_info);
              FStar_TypeChecker_Env.tc_hooks =
                (uu___1599_13353.FStar_TypeChecker_Env.tc_hooks);
              FStar_TypeChecker_Env.dsenv =
                (uu___1599_13353.FStar_TypeChecker_Env.dsenv);
              FStar_TypeChecker_Env.nbe =
                (uu___1599_13353.FStar_TypeChecker_Env.nbe);
              FStar_TypeChecker_Env.strict_args_tab =
                (uu___1599_13353.FStar_TypeChecker_Env.strict_args_tab);
              FStar_TypeChecker_Env.erasable_types_tab =
<<<<<<< HEAD
                (uu___1599_13352.FStar_TypeChecker_Env.erasable_types_tab)
>>>>>>> snap
=======
                (uu___1302_10046.FStar_TypeChecker_Env.erasable_types_tab)
>>>>>>> snap
=======
                (uu___1599_13353.FStar_TypeChecker_Env.erasable_types_tab)
>>>>>>> cp
            }  in
          let uu____13356 = check1 env2 t1 t2  in
          match uu____13356 with
          | FStar_Pervasives_Native.None  ->
              let uu____13363 =
                FStar_TypeChecker_Err.expected_expression_of_type env2 t2 e
                  t1
                 in
              let uu____13369 = FStar_TypeChecker_Env.get_range env2  in
              FStar_Errors.raise_error uu____13363 uu____13369
          | FStar_Pervasives_Native.Some g ->
              ((let uu____13376 =
                  FStar_All.pipe_left (FStar_TypeChecker_Env.debug env2)
                    (FStar_Options.Other "Rel")
                   in
                if uu____13376
                then
                  let uu____13381 =
                    FStar_TypeChecker_Rel.guard_to_string env2 g  in
                  FStar_All.pipe_left
                    (FStar_Util.print1 "Applied guard is %s\n") uu____13381
                else ());
               (let uu____13387 = decorate e t2  in (uu____13387, g)))
  
let (check_top_level :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.guard_t ->
      FStar_TypeChecker_Common.lcomp ->
        (Prims.bool * FStar_Syntax_Syntax.comp))
  =
  fun env  ->
    fun g  ->
      fun lc  ->
        (let uu____13415 = FStar_TypeChecker_Env.debug env FStar_Options.Low
            in
         if uu____13415
         then
           let uu____13418 = FStar_TypeChecker_Common.lcomp_to_string lc  in
           FStar_Util.print1 "check_top_level, lc = %s\n" uu____13418
         else ());
        (let discharge g1 =
           FStar_TypeChecker_Rel.force_trivial_guard env g1;
           FStar_TypeChecker_Common.is_pure_lcomp lc  in
         let g1 = FStar_TypeChecker_Rel.solve_deferred_constraints env g  in
         let uu____13432 = FStar_TypeChecker_Common.lcomp_comp lc  in
         match uu____13432 with
         | (c,g_c) ->
             let uu____13444 = FStar_TypeChecker_Common.is_total_lcomp lc  in
             if uu____13444
             then
               let uu____13452 =
                 let uu____13454 = FStar_TypeChecker_Env.conj_guard g1 g_c
                    in
                 discharge uu____13454  in
               (uu____13452, c)
             else
               (let steps =
                  [FStar_TypeChecker_Env.Beta;
                  FStar_TypeChecker_Env.NoFullNorm;
                  FStar_TypeChecker_Env.DoNotUnfoldPureLets]  in
                let c1 =
                  let uu____13462 =
                    let uu____13463 =
                      FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
                    FStar_All.pipe_right uu____13463
                      FStar_Syntax_Syntax.mk_Comp
                     in
                  FStar_All.pipe_right uu____13462
                    (FStar_TypeChecker_Normalize.normalize_comp steps env)
                   in
                let uu____13464 = check_trivial_precondition env c1  in
                match uu____13464 with
                | (ct,vc,g_pre) ->
                    ((let uu____13480 =
                        FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                          (FStar_Options.Other "Simplification")
                         in
                      if uu____13480
                      then
                        let uu____13485 =
                          FStar_Syntax_Print.term_to_string vc  in
                        FStar_Util.print1 "top-level VC: %s\n" uu____13485
                      else ());
                     (let uu____13490 =
                        let uu____13492 =
                          let uu____13493 =
                            FStar_TypeChecker_Env.conj_guard g_c g_pre  in
                          FStar_TypeChecker_Env.conj_guard g1 uu____13493  in
                        discharge uu____13492  in
                      let uu____13494 =
                        FStar_All.pipe_right ct FStar_Syntax_Syntax.mk_Comp
                         in
                      (uu____13490, uu____13494)))))
  
let (short_circuit :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.args -> FStar_TypeChecker_Common.guard_formula)
  =
  fun head1  ->
    fun seen_args  ->
      let short_bin_op f uu___8_13528 =
        match uu___8_13528 with
        | [] -> FStar_TypeChecker_Common.Trivial
        | (fst1,uu____13538)::[] -> f fst1
        | uu____13563 -> failwith "Unexpexted args to binary operator"  in
      let op_and_e e =
        let uu____13575 = FStar_Syntax_Util.b2t e  in
        FStar_All.pipe_right uu____13575
          (fun _13576  -> FStar_TypeChecker_Common.NonTrivial _13576)
         in
      let op_or_e e =
        let uu____13587 =
          let uu____13588 = FStar_Syntax_Util.b2t e  in
          FStar_Syntax_Util.mk_neg uu____13588  in
        FStar_All.pipe_right uu____13587
          (fun _13591  -> FStar_TypeChecker_Common.NonTrivial _13591)
         in
      let op_and_t t =
        FStar_All.pipe_right t
          (fun _13598  -> FStar_TypeChecker_Common.NonTrivial _13598)
         in
      let op_or_t t =
        let uu____13609 = FStar_All.pipe_right t FStar_Syntax_Util.mk_neg  in
        FStar_All.pipe_right uu____13609
          (fun _13612  -> FStar_TypeChecker_Common.NonTrivial _13612)
         in
      let op_imp_t t =
        FStar_All.pipe_right t
          (fun _13619  -> FStar_TypeChecker_Common.NonTrivial _13619)
         in
      let short_op_ite uu___9_13625 =
        match uu___9_13625 with
        | [] -> FStar_TypeChecker_Common.Trivial
        | (guard,uu____13635)::[] ->
            FStar_TypeChecker_Common.NonTrivial guard
        | _then::(guard,uu____13662)::[] ->
            let uu____13703 = FStar_Syntax_Util.mk_neg guard  in
            FStar_All.pipe_right uu____13703
              (fun _13704  -> FStar_TypeChecker_Common.NonTrivial _13704)
        | uu____13705 -> failwith "Unexpected args to ITE"  in
      let table =
        let uu____13717 =
          let uu____13725 = short_bin_op op_and_e  in
          (FStar_Parser_Const.op_And, uu____13725)  in
        let uu____13733 =
          let uu____13743 =
            let uu____13751 = short_bin_op op_or_e  in
            (FStar_Parser_Const.op_Or, uu____13751)  in
          let uu____13759 =
            let uu____13769 =
              let uu____13777 = short_bin_op op_and_t  in
              (FStar_Parser_Const.and_lid, uu____13777)  in
            let uu____13785 =
              let uu____13795 =
                let uu____13803 = short_bin_op op_or_t  in
                (FStar_Parser_Const.or_lid, uu____13803)  in
              let uu____13811 =
                let uu____13821 =
                  let uu____13829 = short_bin_op op_imp_t  in
                  (FStar_Parser_Const.imp_lid, uu____13829)  in
                [uu____13821; (FStar_Parser_Const.ite_lid, short_op_ite)]  in
              uu____13795 :: uu____13811  in
            uu____13769 :: uu____13785  in
          uu____13743 :: uu____13759  in
        uu____13717 :: uu____13733  in
      match head1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let lid = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          let uu____13891 =
            FStar_Util.find_map table
              (fun uu____13906  ->
                 match uu____13906 with
                 | (x,mk1) ->
                     let uu____13923 = FStar_Ident.lid_equals x lid  in
                     if uu____13923
                     then
                       let uu____13928 = mk1 seen_args  in
                       FStar_Pervasives_Native.Some uu____13928
                     else FStar_Pervasives_Native.None)
             in
          (match uu____13891 with
           | FStar_Pervasives_Native.None  ->
               FStar_TypeChecker_Common.Trivial
           | FStar_Pervasives_Native.Some g -> g)
      | uu____13932 -> FStar_TypeChecker_Common.Trivial
  
let (short_circuit_head : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun l  ->
    let uu____13940 =
      let uu____13941 = FStar_Syntax_Util.un_uinst l  in
      uu____13941.FStar_Syntax_Syntax.n  in
    match uu____13940 with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Util.for_some (FStar_Syntax_Syntax.fv_eq_lid fv)
          [FStar_Parser_Const.op_And;
          FStar_Parser_Const.op_Or;
          FStar_Parser_Const.and_lid;
          FStar_Parser_Const.or_lid;
          FStar_Parser_Const.imp_lid;
          FStar_Parser_Const.ite_lid]
    | uu____13946 -> false
  
let (maybe_add_implicit_binders :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binders)
  =
  fun env  ->
    fun bs  ->
      let pos bs1 =
        match bs1 with
        | (hd1,uu____13982)::uu____13983 ->
            FStar_Syntax_Syntax.range_of_bv hd1
        | uu____14002 -> FStar_TypeChecker_Env.get_range env  in
      match bs with
      | (uu____14011,FStar_Pervasives_Native.Some
         (FStar_Syntax_Syntax.Implicit uu____14012))::uu____14013 -> bs
      | uu____14031 ->
          let uu____14032 = FStar_TypeChecker_Env.expected_typ env  in
          (match uu____14032 with
           | FStar_Pervasives_Native.None  -> bs
           | FStar_Pervasives_Native.Some t ->
               let uu____14036 =
                 let uu____14037 = FStar_Syntax_Subst.compress t  in
                 uu____14037.FStar_Syntax_Syntax.n  in
               (match uu____14036 with
                | FStar_Syntax_Syntax.Tm_arrow (bs',uu____14041) ->
                    let uu____14062 =
                      FStar_Util.prefix_until
                        (fun uu___10_14102  ->
                           match uu___10_14102 with
                           | (uu____14110,FStar_Pervasives_Native.Some
                              (FStar_Syntax_Syntax.Implicit uu____14111)) ->
                               false
                           | uu____14116 -> true) bs'
                       in
                    (match uu____14062 with
                     | FStar_Pervasives_Native.None  -> bs
                     | FStar_Pervasives_Native.Some
                         ([],uu____14152,uu____14153) -> bs
                     | FStar_Pervasives_Native.Some
                         (imps,uu____14225,uu____14226) ->
                         let uu____14299 =
                           FStar_All.pipe_right imps
                             (FStar_Util.for_all
                                (fun uu____14319  ->
                                   match uu____14319 with
                                   | (x,uu____14328) ->
                                       FStar_Util.starts_with
                                         (x.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                                         "'"))
                            in
                         if uu____14299
                         then
                           let r = pos bs  in
                           let imps1 =
                             FStar_All.pipe_right imps
                               (FStar_List.map
                                  (fun uu____14377  ->
                                     match uu____14377 with
                                     | (x,i) ->
                                         let uu____14396 =
                                           FStar_Syntax_Syntax.set_range_of_bv
                                             x r
                                            in
                                         (uu____14396, i)))
                              in
                           FStar_List.append imps1 bs
                         else bs)
                | uu____14407 -> bs))
  
let (maybe_lift :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Ident.lident ->
        FStar_Ident.lident ->
          FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      fun c1  ->
        fun c2  ->
          fun t  ->
            let m1 = FStar_TypeChecker_Env.norm_eff_name env c1  in
            let m2 = FStar_TypeChecker_Env.norm_eff_name env c2  in
            let uu____14436 =
              ((FStar_Ident.lid_equals m1 m2) ||
                 ((FStar_Syntax_Util.is_pure_effect c1) &&
                    (FStar_Syntax_Util.is_ghost_effect c2)))
                ||
                ((FStar_Syntax_Util.is_pure_effect c2) &&
                   (FStar_Syntax_Util.is_ghost_effect c1))
               in
            if uu____14436
            then e
            else
              FStar_Syntax_Syntax.mk
                (FStar_Syntax_Syntax.Tm_meta
                   (e, (FStar_Syntax_Syntax.Meta_monadic_lift (m1, m2, t))))
                FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
  
let (maybe_monadic :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      fun c  ->
        fun t  ->
          let m = FStar_TypeChecker_Env.norm_eff_name env c  in
          let uu____14467 =
            ((is_pure_or_ghost_effect env m) ||
               (FStar_Ident.lid_equals m FStar_Parser_Const.effect_Tot_lid))
              ||
              (FStar_Ident.lid_equals m FStar_Parser_Const.effect_GTot_lid)
             in
          if uu____14467
          then e
          else
            FStar_Syntax_Syntax.mk
              (FStar_Syntax_Syntax.Tm_meta
                 (e, (FStar_Syntax_Syntax.Meta_monadic (m, t))))
              FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
  
let (d : Prims.string -> unit) =
  fun s  -> FStar_Util.print1 "\027[01;36m%s\027[00m\n" s 
let (mk_toplevel_definition :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.term ->
        (FStar_Syntax_Syntax.sigelt * FStar_Syntax_Syntax.term))
  =
  fun env  ->
    fun lident  ->
      fun def  ->
        (let uu____14510 =
           FStar_TypeChecker_Env.debug env (FStar_Options.Other "ED")  in
         if uu____14510
         then
           ((let uu____14515 = FStar_Ident.text_of_lid lident  in
             d uu____14515);
            (let uu____14517 = FStar_Ident.text_of_lid lident  in
             let uu____14519 = FStar_Syntax_Print.term_to_string def  in
             FStar_Util.print2 "Registering top-level definition: %s\n%s\n"
               uu____14517 uu____14519))
         else ());
        (let fv =
           let uu____14525 = FStar_Syntax_Util.incr_delta_qualifier def  in
           FStar_Syntax_Syntax.lid_as_fv lident uu____14525
             FStar_Pervasives_Native.None
            in
         let lbname = FStar_Util.Inr fv  in
         let lb =
           (false,
             [FStar_Syntax_Util.mk_letbinding lbname []
                FStar_Syntax_Syntax.tun FStar_Parser_Const.effect_Tot_lid def
                [] FStar_Range.dummyRange])
            in
         let sig_ctx =
           FStar_Syntax_Syntax.mk_sigelt
             (FStar_Syntax_Syntax.Sig_let (lb, [lident]))
            in
         let uu____14537 =
           FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_fvar fv)
             FStar_Pervasives_Native.None FStar_Range.dummyRange
            in
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
         ((let uu___1723_14445 = sig_ctx  in
           {
             FStar_Syntax_Syntax.sigel =
               (uu___1723_14445.FStar_Syntax_Syntax.sigel);
             FStar_Syntax_Syntax.sigrng =
               (uu___1723_14445.FStar_Syntax_Syntax.sigrng);
             FStar_Syntax_Syntax.sigquals =
               [FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen];
             FStar_Syntax_Syntax.sigmeta =
               (uu___1723_14445.FStar_Syntax_Syntax.sigmeta);
             FStar_Syntax_Syntax.sigattrs =
               (uu___1723_14445.FStar_Syntax_Syntax.sigattrs)
           }), uu____14443))
=======
         ((let uu___1456_11219 = sig_ctx  in
=======
         ((let uu___1457_11219 = sig_ctx  in
>>>>>>> snap
           {
             FStar_Syntax_Syntax.sigel =
               (uu___1457_11219.FStar_Syntax_Syntax.sigel);
             FStar_Syntax_Syntax.sigrng =
               (uu___1457_11219.FStar_Syntax_Syntax.sigrng);
             FStar_Syntax_Syntax.sigquals =
               [FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen];
             FStar_Syntax_Syntax.sigmeta =
               (uu___1457_11219.FStar_Syntax_Syntax.sigmeta);
             FStar_Syntax_Syntax.sigattrs =
               (uu___1457_11219.FStar_Syntax_Syntax.sigattrs)
           }), uu____11217))
>>>>>>> snap
=======
         ((let uu___1756_14538 = sig_ctx  in
=======
         ((let uu___1756_14539 = sig_ctx  in
>>>>>>> cp
           {
             FStar_Syntax_Syntax.sigel =
               (uu___1756_14539.FStar_Syntax_Syntax.sigel);
             FStar_Syntax_Syntax.sigrng =
               (uu___1756_14539.FStar_Syntax_Syntax.sigrng);
             FStar_Syntax_Syntax.sigquals =
               [FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen];
             FStar_Syntax_Syntax.sigmeta =
               (uu___1756_14539.FStar_Syntax_Syntax.sigmeta);
             FStar_Syntax_Syntax.sigattrs =
<<<<<<< HEAD
               (uu___1756_14538.FStar_Syntax_Syntax.sigattrs)
           }), uu____14536))
>>>>>>> snap
=======
               (uu___1756_14539.FStar_Syntax_Syntax.sigattrs)
           }), uu____14537))
>>>>>>> cp
  
let (check_sigelt_quals :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.sigelt -> unit) =
  fun env  ->
    fun se  ->
      let visibility uu___11_14557 =
        match uu___11_14557 with
        | FStar_Syntax_Syntax.Private  -> true
        | uu____14560 -> false  in
      let reducibility uu___12_14568 =
        match uu___12_14568 with
        | FStar_Syntax_Syntax.Abstract  -> true
        | FStar_Syntax_Syntax.Irreducible  -> true
        | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen  -> true
        | FStar_Syntax_Syntax.Visible_default  -> true
        | FStar_Syntax_Syntax.Inline_for_extraction  -> true
        | uu____14575 -> false  in
      let assumption uu___13_14583 =
        match uu___13_14583 with
        | FStar_Syntax_Syntax.Assumption  -> true
        | FStar_Syntax_Syntax.New  -> true
        | uu____14587 -> false  in
      let reification uu___14_14595 =
        match uu___14_14595 with
        | FStar_Syntax_Syntax.Reifiable  -> true
        | FStar_Syntax_Syntax.Reflectable uu____14598 -> true
        | uu____14600 -> false  in
      let inferred uu___15_14608 =
        match uu___15_14608 with
        | FStar_Syntax_Syntax.Discriminator uu____14610 -> true
        | FStar_Syntax_Syntax.Projector uu____14612 -> true
        | FStar_Syntax_Syntax.RecordType uu____14618 -> true
        | FStar_Syntax_Syntax.RecordConstructor uu____14628 -> true
        | FStar_Syntax_Syntax.ExceptionConstructor  -> true
        | FStar_Syntax_Syntax.HasMaskedEffect  -> true
        | FStar_Syntax_Syntax.Effect  -> true
        | uu____14641 -> false  in
      let has_eq uu___16_14649 =
        match uu___16_14649 with
        | FStar_Syntax_Syntax.Noeq  -> true
        | FStar_Syntax_Syntax.Unopteq  -> true
        | uu____14653 -> false  in
      let quals_combo_ok quals q =
        match q with
        | FStar_Syntax_Syntax.Assumption  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                          (inferred x))
                         || (visibility x))
                        || (assumption x))
                       ||
                       (env.FStar_TypeChecker_Env.is_iface &&
                          (x = FStar_Syntax_Syntax.Inline_for_extraction)))
                      || (x = FStar_Syntax_Syntax.NoExtract)))
        | FStar_Syntax_Syntax.New  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    (((x = q) || (inferred x)) || (visibility x)) ||
                      (assumption x)))
        | FStar_Syntax_Syntax.Inline_for_extraction  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (visibility x))
                           || (reducibility x))
                          || (reification x))
                         || (inferred x))
                        || (has_eq x))
                       ||
                       (env.FStar_TypeChecker_Env.is_iface &&
                          (x = FStar_Syntax_Syntax.Assumption)))
                      || (x = FStar_Syntax_Syntax.NoExtract)))
        | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Visible_default  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Irreducible  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Abstract  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Noeq  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Unopteq  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.TotalEffect  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    (((x = q) || (inferred x)) || (visibility x)) ||
                      (reification x)))
        | FStar_Syntax_Syntax.Logic  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((x = q) || (x = FStar_Syntax_Syntax.Assumption)) ||
                        (inferred x))
                       || (visibility x))
                      || (reducibility x)))
        | FStar_Syntax_Syntax.Reifiable  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((reification x) || (inferred x)) || (visibility x)) ||
                       (x = FStar_Syntax_Syntax.TotalEffect))
                      || (x = FStar_Syntax_Syntax.Visible_default)))
        | FStar_Syntax_Syntax.Reflectable uu____14732 ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((reification x) || (inferred x)) || (visibility x)) ||
                       (x = FStar_Syntax_Syntax.TotalEffect))
                      || (x = FStar_Syntax_Syntax.Visible_default)))
        | FStar_Syntax_Syntax.Private  -> true
<<<<<<< HEAD
<<<<<<< HEAD
        | uu____14738 -> true  in
=======
        | uu____11419 -> true  in
      let check_erasable quals se1 r =
        let lids = FStar_Syntax_Util.lids_of_sigelt se1  in
        let val_exists =
          FStar_All.pipe_right lids
            (FStar_Util.for_some
               (fun l  ->
                  let uu____11452 =
                    FStar_TypeChecker_Env.try_lookup_val_decl env l  in
                  FStar_Option.isSome uu____11452))
           in
        let val_has_erasable_attr =
          FStar_All.pipe_right lids
            (FStar_Util.for_some
               (fun l  ->
                  let attrs_opt =
                    FStar_TypeChecker_Env.lookup_attrs_of_lid env l  in
                  (FStar_Option.isSome attrs_opt) &&
                    (let uu____11483 = FStar_Option.get attrs_opt  in
                     FStar_Syntax_Util.has_attribute uu____11483
                       FStar_Parser_Const.erasable_attr)))
           in
        let se_has_erasable_attr =
          FStar_Syntax_Util.has_attribute se1.FStar_Syntax_Syntax.sigattrs
            FStar_Parser_Const.erasable_attr
           in
        if
          (val_exists && val_has_erasable_attr) &&
            (Prims.op_Negation se_has_erasable_attr)
        then
          FStar_Errors.raise_error
            (FStar_Errors.Fatal_QulifierListNotPermitted,
              "Mismatch of attributes between declaration and definition: Declaration is marked `erasable` but the definition is not")
            r
        else ();
        if
          (val_exists && (Prims.op_Negation val_has_erasable_attr)) &&
            se_has_erasable_attr
        then
          FStar_Errors.raise_error
            (FStar_Errors.Fatal_QulifierListNotPermitted,
              "Mismatch of attributed between declaration and definition: Definition is marked `erasable` but the declaration is not")
            r
        else ();
        if se_has_erasable_attr
        then
          (match se1.FStar_Syntax_Syntax.sigel with
           | FStar_Syntax_Syntax.Sig_bundle uu____11503 ->
               let uu____11512 =
                 let uu____11514 =
                   FStar_All.pipe_right quals
                     (FStar_Util.for_some
                        (fun uu___17_11520  ->
                           match uu___17_11520 with
                           | FStar_Syntax_Syntax.Noeq  -> true
                           | uu____11523 -> false))
                    in
                 Prims.op_Negation uu____11514  in
               if uu____11512
               then
                 FStar_Errors.raise_error
                   (FStar_Errors.Fatal_QulifierListNotPermitted,
                     "Incompatible attributes and qualifiers: erasable types do not support decidable equality and must be marked `noeq`")
                   r
               else ()
           | FStar_Syntax_Syntax.Sig_declare_typ uu____11530 -> ()
           | uu____11537 ->
               FStar_Errors.raise_error
                 (FStar_Errors.Fatal_QulifierListNotPermitted,
                   "Illegal attribute: the `erasable` attribute is only permitted on inductive type definitions")
                 r)
        else ()  in
>>>>>>> snap
=======
        | uu____14739 -> true  in
>>>>>>> cp
      let quals =
        FStar_All.pipe_right (FStar_Syntax_Util.quals_of_sigelt se)
          (FStar_List.filter
             (fun x  -> Prims.op_Negation (x = FStar_Syntax_Syntax.Logic)))
         in
<<<<<<< HEAD
<<<<<<< HEAD
      let uu____14749 =
        let uu____14751 =
=======
      let uu____14750 =
        let uu____14752 =
>>>>>>> cp
          FStar_All.pipe_right quals
            (FStar_Util.for_some
               (fun uu___17_14758  ->
                  match uu___17_14758 with
                  | FStar_Syntax_Syntax.OnlyName  -> true
                  | uu____14761 -> false))
           in
<<<<<<< HEAD
        FStar_All.pipe_right uu____14751 Prims.op_Negation  in
      if uu____14749
=======
      let uu____11551 =
        let uu____11553 =
          FStar_All.pipe_right quals
            (FStar_Util.for_some
               (fun uu___18_11559  ->
                  match uu___18_11559 with
                  | FStar_Syntax_Syntax.OnlyName  -> true
                  | uu____11562 -> false))
           in
        FStar_All.pipe_right uu____11553 Prims.op_Negation  in
      if uu____11551
>>>>>>> snap
=======
        FStar_All.pipe_right uu____14752 Prims.op_Negation  in
      if uu____14750
>>>>>>> cp
      then
        let r = FStar_Syntax_Util.range_of_sigelt se  in
        let no_dup_quals =
          FStar_Util.remove_dups (fun x  -> fun y  -> x = y) quals  in
        let err' msg =
<<<<<<< HEAD
<<<<<<< HEAD
          let uu____14781 =
            let uu____14787 =
              let uu____14789 = FStar_Syntax_Print.quals_to_string quals  in
=======
          let uu____14782 =
            let uu____14788 =
              let uu____14790 = FStar_Syntax_Print.quals_to_string quals  in
>>>>>>> cp
              FStar_Util.format2
                "The qualifier list \"[%s]\" is not permissible for this element%s"
                uu____14790 msg
               in
            (FStar_Errors.Fatal_QulifierListNotPermitted, uu____14788)  in
          FStar_Errors.raise_error uu____14782 r  in
        let err msg = err' (Prims.op_Hat ": " msg)  in
        let err'1 uu____14808 = err' ""  in
        (if (FStar_List.length quals) <> (FStar_List.length no_dup_quals)
         then err "duplicate qualifiers"
         else ();
         (let uu____14816 =
            let uu____14818 =
              FStar_All.pipe_right quals
                (FStar_List.for_all (quals_combo_ok quals))
               in
            Prims.op_Negation uu____14818  in
          if uu____14816 then err "ill-formed combination" else ());
         (match se.FStar_Syntax_Syntax.sigel with
<<<<<<< HEAD
          | FStar_Syntax_Syntax.Sig_let ((is_rec,uu____14827),uu____14828) ->
              ((let uu____14840 =
=======
          let uu____11583 =
            let uu____11589 =
              let uu____11591 = FStar_Syntax_Print.quals_to_string quals  in
              FStar_Util.format2
                "The qualifier list \"[%s]\" is not permissible for this element%s"
                uu____11591 msg
               in
            (FStar_Errors.Fatal_QulifierListNotPermitted, uu____11589)  in
          FStar_Errors.raise_error uu____11583 r  in
        let err msg = err' (Prims.op_Hat ": " msg)  in
        let err'1 uu____11609 = err' ""  in
        (if (FStar_List.length quals) <> (FStar_List.length no_dup_quals)
         then err "duplicate qualifiers"
         else ();
         (let uu____11617 =
            let uu____11619 =
              FStar_All.pipe_right quals
                (FStar_List.for_all (quals_combo_ok quals))
               in
            Prims.op_Negation uu____11619  in
          if uu____11617 then err "ill-formed combination" else ());
         check_erasable quals se r;
         (match se.FStar_Syntax_Syntax.sigel with
          | FStar_Syntax_Syntax.Sig_let ((is_rec,uu____11630),uu____11631) ->
              ((let uu____11643 =
>>>>>>> snap
=======
          | FStar_Syntax_Syntax.Sig_let ((is_rec,uu____14828),uu____14829) ->
              ((let uu____14841 =
>>>>>>> cp
                  is_rec &&
                    (FStar_All.pipe_right quals
                       (FStar_List.contains
                          FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen))
                   in
<<<<<<< HEAD
<<<<<<< HEAD
                if uu____14840
                then err "recursive definitions cannot be marked inline"
                else ());
               (let uu____14849 =
=======
                if uu____11643
                then err "recursive definitions cannot be marked inline"
                else ());
               (let uu____11652 =
>>>>>>> snap
=======
                if uu____14841
                then err "recursive definitions cannot be marked inline"
                else ());
               (let uu____14850 =
>>>>>>> cp
                  FStar_All.pipe_right quals
                    (FStar_Util.for_some
                       (fun x  -> (assumption x) || (has_eq x)))
                   in
<<<<<<< HEAD
<<<<<<< HEAD
                if uu____14849
=======
                if uu____11652
>>>>>>> snap
=======
                if uu____14850
>>>>>>> cp
                then
                  err
                    "definitions cannot be assumed or marked with equality qualifiers"
                else ()))
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
          | FStar_Syntax_Syntax.Sig_bundle uu____14767 ->
              let uu____14776 =
                let uu____14778 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (((((x = FStar_Syntax_Syntax.Abstract) ||
                                (x =
                                   FStar_Syntax_Syntax.Inline_for_extraction))
                               || (x = FStar_Syntax_Syntax.NoExtract))
                              || (inferred x))
                             || (visibility x))
                            || (has_eq x)))
                   in
                Prims.op_Negation uu____14778  in
              if uu____14776 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_declare_typ uu____14788 ->
              let uu____14795 =
                FStar_All.pipe_right quals (FStar_Util.for_some has_eq)  in
              if uu____14795 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_assume uu____14803 ->
              let uu____14810 =
                let uu____14812 =
=======
          | FStar_Syntax_Syntax.Sig_bundle uu____11541 ->
              ((let uu____11551 =
                  let uu____11553 =
=======
          | FStar_Syntax_Syntax.Sig_bundle uu____14860 ->
              ((let uu____14870 =
                  let uu____14872 =
>>>>>>> snap
=======
          | FStar_Syntax_Syntax.Sig_bundle uu____11663 ->
              ((let uu____11673 =
                  let uu____11675 =
>>>>>>> snap
=======
          | FStar_Syntax_Syntax.Sig_bundle uu____14861 ->
              ((let uu____14871 =
                  let uu____14873 =
>>>>>>> cp
                    FStar_All.pipe_right quals
                      (FStar_Util.for_all
                         (fun x  ->
                            (((((x = FStar_Syntax_Syntax.Abstract) ||
                                  (x =
                                     FStar_Syntax_Syntax.Inline_for_extraction))
                                 || (x = FStar_Syntax_Syntax.NoExtract))
                                || (inferred x))
                               || (visibility x))
                              || (has_eq x)))
                     in
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                  Prims.op_Negation uu____11553  in
                if uu____11551 then err'1 () else ());
               (let uu____11563 =
=======
                  Prims.op_Negation uu____11675  in
                if uu____11673 then err'1 () else ());
               (let uu____11685 =
>>>>>>> snap
                  (FStar_All.pipe_right quals
                     (FStar_List.existsb
                        (fun uu___19_11691  ->
                           match uu___19_11691 with
                           | FStar_Syntax_Syntax.Unopteq  -> true
<<<<<<< HEAD
                           | uu____11572 -> false)))
=======
                  Prims.op_Negation uu____14872  in
                if uu____14870 then err'1 () else ());
               (let uu____14882 =
=======
                  Prims.op_Negation uu____14873  in
                if uu____14871 then err'1 () else ());
               (let uu____14883 =
>>>>>>> cp
                  (FStar_All.pipe_right quals
                     (FStar_List.existsb
                        (fun uu___18_14889  ->
                           match uu___18_14889 with
                           | FStar_Syntax_Syntax.Unopteq  -> true
<<<<<<< HEAD
                           | uu____14891 -> false)))
>>>>>>> snap
=======
                           | uu____11694 -> false)))
>>>>>>> snap
=======
                           | uu____14892 -> false)))
>>>>>>> cp
                    &&
                    (FStar_Syntax_Util.has_attribute
                       se.FStar_Syntax_Syntax.sigattrs
                       FStar_Parser_Const.erasable_attr)
                   in
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                if uu____11563
=======
                if uu____14882
>>>>>>> snap
=======
                if uu____11685
>>>>>>> snap
=======
                if uu____14883
>>>>>>> cp
                then
                  err
                    "unopteq is not allowed on an erasable inductives since they don't have decidable equality"
                else ()))
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
          | FStar_Syntax_Syntax.Sig_declare_typ uu____11578 ->
              let uu____11585 =
                FStar_All.pipe_right quals (FStar_Util.for_some has_eq)  in
              if uu____11585 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_assume uu____11593 ->
              let uu____11600 =
                let uu____11602 =
>>>>>>> snap
=======
          | FStar_Syntax_Syntax.Sig_declare_typ uu____14897 ->
              let uu____14904 =
                FStar_All.pipe_right quals (FStar_Util.for_some has_eq)  in
              if uu____14904 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_assume uu____14912 ->
              let uu____14919 =
                let uu____14921 =
>>>>>>> snap
=======
          | FStar_Syntax_Syntax.Sig_declare_typ uu____11700 ->
              let uu____11707 =
                FStar_All.pipe_right quals (FStar_Util.for_some has_eq)  in
              if uu____11707 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_assume uu____11715 ->
              let uu____11722 =
                let uu____11724 =
>>>>>>> snap
=======
          | FStar_Syntax_Syntax.Sig_declare_typ uu____14898 ->
              let uu____14905 =
                FStar_All.pipe_right quals (FStar_Util.for_some has_eq)  in
              if uu____14905 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_assume uu____14913 ->
              let uu____14920 =
                let uu____14922 =
>>>>>>> cp
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (visibility x) ||
                            (x = FStar_Syntax_Syntax.Assumption)))
                   in
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                Prims.op_Negation uu____14812  in
              if uu____14810 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect uu____14822 ->
              let uu____14823 =
                let uu____14825 =
=======
                Prims.op_Negation uu____11602  in
              if uu____11600 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect uu____11612 ->
              let uu____11613 =
                let uu____11615 =
>>>>>>> snap
=======
                Prims.op_Negation uu____14921  in
              if uu____14919 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect uu____14931 ->
              let uu____14932 =
                let uu____14934 =
>>>>>>> snap
=======
                Prims.op_Negation uu____11724  in
              if uu____11722 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect uu____11734 ->
              let uu____11735 =
                let uu____11737 =
>>>>>>> snap
=======
                Prims.op_Negation uu____14922  in
              if uu____14920 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect uu____14932 ->
              let uu____14933 =
                let uu____14935 =
>>>>>>> cp
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (((x = FStar_Syntax_Syntax.TotalEffect) ||
                              (inferred x))
                             || (visibility x))
                            || (reification x)))
                   in
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                Prims.op_Negation uu____14825  in
              if uu____14823 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____14835 ->
              let uu____14836 =
                let uu____14838 =
=======
                Prims.op_Negation uu____11615  in
              if uu____11613 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____11625 ->
              let uu____11626 =
                let uu____11628 =
>>>>>>> snap
=======
                Prims.op_Negation uu____14934  in
              if uu____14932 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____14944 ->
              let uu____14945 =
                let uu____14947 =
>>>>>>> snap
=======
                Prims.op_Negation uu____11737  in
              if uu____11735 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____11747 ->
              let uu____11748 =
                let uu____11750 =
>>>>>>> snap
=======
                Prims.op_Negation uu____14935  in
              if uu____14933 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____14945 ->
              let uu____14946 =
                let uu____14948 =
>>>>>>> cp
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (((x = FStar_Syntax_Syntax.TotalEffect) ||
                              (inferred x))
                             || (visibility x))
                            || (reification x)))
                   in
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                Prims.op_Negation uu____14838  in
              if uu____14836 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_effect_abbrev uu____14848 ->
              let uu____14861 =
                let uu____14863 =
=======
                Prims.op_Negation uu____11628  in
              if uu____11626 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_effect_abbrev uu____11638 ->
              let uu____11651 =
                let uu____11653 =
>>>>>>> snap
=======
                Prims.op_Negation uu____14947  in
              if uu____14945 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_effect_abbrev uu____14957 ->
              let uu____14970 =
                let uu____14972 =
>>>>>>> snap
=======
                Prims.op_Negation uu____11750  in
              if uu____11748 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_effect_abbrev uu____11760 ->
              let uu____11773 =
                let uu____11775 =
>>>>>>> snap
=======
                Prims.op_Negation uu____14948  in
              if uu____14946 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_effect_abbrev uu____14958 ->
              let uu____14971 =
                let uu____14973 =
>>>>>>> cp
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  -> (inferred x) || (visibility x)))
                   in
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
                Prims.op_Negation uu____14863  in
              if uu____14861 then err'1 () else ()
          | uu____14873 -> ()))
=======
                Prims.op_Negation uu____11653  in
              if uu____11651 then err'1 () else ()
          | uu____11663 -> ()))
>>>>>>> snap
=======
                Prims.op_Negation uu____14972  in
              if uu____14970 then err'1 () else ()
          | uu____14982 -> ()))
>>>>>>> snap
=======
                Prims.op_Negation uu____11775  in
              if uu____11773 then err'1 () else ()
          | uu____11785 -> ()))
>>>>>>> snap
=======
                Prims.op_Negation uu____14973  in
              if uu____14971 then err'1 () else ()
          | uu____14983 -> ()))
>>>>>>> cp
      else ()
  
let (must_erase_for_extraction :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun g  ->
    fun t  ->
<<<<<<< HEAD
<<<<<<< HEAD
      let has_erased_for_extraction_attr fv =
        let uu____14896 =
          let uu____14901 =
            FStar_All.pipe_right fv FStar_Syntax_Syntax.lid_of_fv  in
          FStar_All.pipe_right uu____14901
            (FStar_TypeChecker_Env.lookup_attrs_of_lid g)
           in
        FStar_All.pipe_right uu____14896
          (fun l_opt  ->
             (FStar_Util.is_some l_opt) &&
               (let uu____14920 = FStar_All.pipe_right l_opt FStar_Util.must
                   in
                FStar_All.pipe_right uu____14920
                  (FStar_List.existsb
                     (fun t1  ->
                        let uu____14938 =
                          let uu____14939 = FStar_Syntax_Subst.compress t1
                             in
                          uu____14939.FStar_Syntax_Syntax.n  in
                        match uu____14938 with
                        | FStar_Syntax_Syntax.Tm_fvar fv1 when
                            FStar_Ident.lid_equals
                              (fv1.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                              FStar_Parser_Const.must_erase_for_extraction_attr
                            -> true
                        | uu____14945 -> false))))
         in
      let rec aux_whnf env t1 =
        let uu____14971 =
          let uu____14972 = FStar_Syntax_Subst.compress t1  in
          uu____14972.FStar_Syntax_Syntax.n  in
        match uu____14971 with
        | FStar_Syntax_Syntax.Tm_type uu____14976 -> true
        | FStar_Syntax_Syntax.Tm_fvar fv ->
            (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid) ||
              (has_erased_for_extraction_attr fv)
        | FStar_Syntax_Syntax.Tm_arrow uu____14979 ->
            let uu____14994 = FStar_Syntax_Util.arrow_formals_comp t1  in
            (match uu____14994 with
             | (bs,c) ->
                 let env1 = FStar_TypeChecker_Env.push_binders env bs  in
                 let uu____15027 = FStar_Syntax_Util.is_pure_comp c  in
                 if uu____15027
                 then aux env1 (FStar_Syntax_Util.comp_result c)
                 else FStar_Syntax_Util.is_pure_or_ghost_comp c)
        | FStar_Syntax_Syntax.Tm_refine
            ({ FStar_Syntax_Syntax.ppname = uu____15033;
               FStar_Syntax_Syntax.index = uu____15034;
               FStar_Syntax_Syntax.sort = t2;_},uu____15036)
            -> aux env t2
        | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____15045,uu____15046) ->
            aux env t2
        | FStar_Syntax_Syntax.Tm_app (head1,uu____15088::[]) ->
            let uu____15127 =
              let uu____15128 = FStar_Syntax_Util.un_uinst head1  in
              uu____15128.FStar_Syntax_Syntax.n  in
            (match uu____15127 with
             | FStar_Syntax_Syntax.Tm_fvar fv ->
                 (FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.erased_lid)
                   || (has_erased_for_extraction_attr fv)
<<<<<<< HEAD
<<<<<<< HEAD
             | uu____14027 -> false)
        | uu____14029 -> false
=======
      let rec aux_whnf env t1 =
        (FStar_TypeChecker_Env.non_informative env t1) ||
          (let uu____11696 =
             let uu____11697 = FStar_Syntax_Subst.compress t1  in
             uu____11697.FStar_Syntax_Syntax.n  in
           match uu____11696 with
           | FStar_Syntax_Syntax.Tm_arrow uu____11701 ->
               let uu____11716 = FStar_Syntax_Util.arrow_formals_comp t1  in
               (match uu____11716 with
                | (bs,c) ->
                    let env1 = FStar_TypeChecker_Env.push_binders env bs  in
                    (FStar_Syntax_Util.is_pure_or_ghost_comp c) &&
                      (aux env1 (FStar_Syntax_Util.comp_result c)))
           | FStar_Syntax_Syntax.Tm_refine
               ({ FStar_Syntax_Syntax.ppname = uu____11749;
                  FStar_Syntax_Syntax.index = uu____11750;
                  FStar_Syntax_Syntax.sort = t2;_},uu____11752)
               -> aux env t2
           | uu____11760 -> false)
>>>>>>> snap
=======
      let rec descend env t1 =
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        let uu____11702 =
          let uu____11703 = FStar_Syntax_Subst.compress t1  in
          uu____11703.FStar_Syntax_Syntax.n  in
        match uu____11702 with
        | FStar_Syntax_Syntax.Tm_arrow uu____11707 ->
            let uu____11722 = FStar_Syntax_Util.arrow_formals_comp t1  in
            (match uu____11722 with
=======
        let uu____15021 =
          let uu____15022 = FStar_Syntax_Subst.compress t1  in
          uu____15022.FStar_Syntax_Syntax.n  in
        match uu____15021 with
        | FStar_Syntax_Syntax.Tm_arrow uu____15026 ->
            let uu____15041 = FStar_Syntax_Util.arrow_formals_comp t1  in
            (match uu____15041 with
>>>>>>> snap
=======
        let uu____11824 =
          let uu____11825 = FStar_Syntax_Subst.compress t1  in
          uu____11825.FStar_Syntax_Syntax.n  in
        match uu____11824 with
        | FStar_Syntax_Syntax.Tm_arrow uu____11829 ->
            let uu____11844 = FStar_Syntax_Util.arrow_formals_comp t1  in
            (match uu____11844 with
>>>>>>> snap
=======
        let uu____15022 =
          let uu____15023 = FStar_Syntax_Subst.compress t1  in
          uu____15023.FStar_Syntax_Syntax.n  in
        match uu____15022 with
        | FStar_Syntax_Syntax.Tm_arrow uu____15027 ->
            let uu____15042 = FStar_Syntax_Util.arrow_formals_comp t1  in
            (match uu____15042 with
>>>>>>> cp
             | (bs,c) ->
                 let env1 = FStar_TypeChecker_Env.push_binders env bs  in
                 (FStar_Syntax_Util.is_ghost_effect
                    (FStar_Syntax_Util.comp_effect_name c))
                   ||
                   ((FStar_Syntax_Util.is_pure_or_ghost_comp c) &&
                      (aux env1 (FStar_Syntax_Util.comp_result c))))
        | FStar_Syntax_Syntax.Tm_refine
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
            ({ FStar_Syntax_Syntax.ppname = uu____11755;
               FStar_Syntax_Syntax.index = uu____11756;
               FStar_Syntax_Syntax.sort = t2;_},uu____11758)
            -> aux env t2
        | FStar_Syntax_Syntax.Tm_app (head1,uu____11767) -> descend env head1
        | FStar_Syntax_Syntax.Tm_uinst (head1,uu____11793) ->
=======
            ({ FStar_Syntax_Syntax.ppname = uu____15074;
               FStar_Syntax_Syntax.index = uu____15075;
               FStar_Syntax_Syntax.sort = t2;_},uu____15077)
            -> aux env t2
        | FStar_Syntax_Syntax.Tm_app (head1,uu____15086) -> descend env head1
        | FStar_Syntax_Syntax.Tm_uinst (head1,uu____15112) ->
>>>>>>> snap
=======
            ({ FStar_Syntax_Syntax.ppname = uu____11877;
               FStar_Syntax_Syntax.index = uu____11878;
               FStar_Syntax_Syntax.sort = t2;_},uu____11880)
            -> aux env t2
        | FStar_Syntax_Syntax.Tm_app (head1,uu____11889) -> descend env head1
        | FStar_Syntax_Syntax.Tm_uinst (head1,uu____11915) ->
>>>>>>> snap
=======
            ({ FStar_Syntax_Syntax.ppname = uu____15075;
               FStar_Syntax_Syntax.index = uu____15076;
               FStar_Syntax_Syntax.sort = t2;_},uu____15078)
            -> aux env t2
        | FStar_Syntax_Syntax.Tm_app (head1,uu____15087) -> descend env head1
        | FStar_Syntax_Syntax.Tm_uinst (head1,uu____15113) ->
>>>>>>> cp
            descend env head1
        | FStar_Syntax_Syntax.Tm_fvar fv ->
            FStar_TypeChecker_Env.fv_has_attr env fv
              FStar_Parser_Const.must_erase_for_extraction_attr
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        | uu____11783 -> false
>>>>>>> snap
=======
             | uu____14076 -> false)
        | uu____14078 -> false
>>>>>>> snap
=======
             | uu____15133 -> false)
        | uu____15135 -> false
>>>>>>> snap
=======
        | uu____11799 -> false
>>>>>>> snap
=======
        | uu____15118 -> false
>>>>>>> snap
=======
        | uu____11921 -> false
>>>>>>> snap
=======
        | uu____15119 -> false
>>>>>>> cp
      
      and aux env t1 =
        let t2 =
          FStar_TypeChecker_Normalize.normalize
            [FStar_TypeChecker_Env.Primops;
            FStar_TypeChecker_Env.Weak;
            FStar_TypeChecker_Env.HNF;
            FStar_TypeChecker_Env.UnfoldUntil
              FStar_Syntax_Syntax.delta_constant;
            FStar_TypeChecker_Env.Beta;
            FStar_TypeChecker_Env.AllowUnboundUniverses;
            FStar_TypeChecker_Env.Zeta;
            FStar_TypeChecker_Env.Iota;
            FStar_TypeChecker_Env.Unascribe] env t1
           in
<<<<<<< HEAD
        let res = aux_whnf env t2  in
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        (let uu____14039 =
=======
        (let uu____14088 =
>>>>>>> snap
=======
        (let uu____15145 =
>>>>>>> snap
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Extraction")
            in
         if uu____15145
         then
           let uu____15150 = FStar_Syntax_Print.term_to_string t2  in
           FStar_Util.print2 "must_erase=%s: %s\n"
<<<<<<< HEAD
<<<<<<< HEAD
             (if res then "true" else "false") uu____14044
=======
        (let uu____11770 =
=======
        let res =
          (FStar_TypeChecker_Env.non_informative env t2) || (descend env t2)
           in
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        (let uu____11793 =
>>>>>>> snap
=======
        (let uu____11809 =
>>>>>>> snap
=======
        (let uu____11931 =
>>>>>>> snap
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Extraction")
            in
         if uu____11931
         then
           let uu____11936 = FStar_Syntax_Print.term_to_string t2  in
           FStar_Util.print2 "must_erase=%s: %s\n"
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
             (if res then "true" else "false") uu____11775
>>>>>>> snap
=======
             (if res then "true" else "false") uu____11798
>>>>>>> snap
=======
             (if res then "true" else "false") uu____14093
>>>>>>> snap
=======
             (if res then "true" else "false") uu____15150
>>>>>>> snap
=======
             (if res then "true" else "false") uu____11814
>>>>>>> snap
=======
        (let uu____15128 =
=======
        (let uu____15129 =
>>>>>>> cp
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Extraction")
            in
         if uu____15129
         then
           let uu____15134 = FStar_Syntax_Print.term_to_string t2  in
           FStar_Util.print2 "must_erase=%s: %s\n"
<<<<<<< HEAD
             (if res then "true" else "false") uu____15133
>>>>>>> snap
=======
             (if res then "true" else "false") uu____11936
>>>>>>> snap
=======
             (if res then "true" else "false") uu____15134
>>>>>>> cp
         else ());
        res
       in aux g t
  
let (fresh_non_layered_effect_repr :
  FStar_TypeChecker_Env.env ->
    FStar_Range.range ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.universe ->
          FStar_Syntax_Syntax.term ->
            (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun r  ->
      fun eff_name  ->
        fun u  ->
          fun a_tm  ->
            let wp_sort =
              let signature =
                FStar_TypeChecker_Env.lookup_effect_lid env eff_name  in
<<<<<<< HEAD
<<<<<<< HEAD
              let uu____15197 =
                let uu____15198 = FStar_Syntax_Subst.compress signature  in
                uu____15198.FStar_Syntax_Syntax.n  in
              match uu____15197 with
              | FStar_Syntax_Syntax.Tm_arrow (bs,uu____15202) when
                  (FStar_List.length bs) = (Prims.of_int (2)) ->
                  let uu____15231 = FStar_Syntax_Subst.open_binders bs  in
                  (match uu____15231 with
                   | (a,uu____15233)::(wp,uu____15235)::[] ->
                       FStar_All.pipe_right wp.FStar_Syntax_Syntax.sort
                         (FStar_Syntax_Subst.subst
                            [FStar_Syntax_Syntax.NT (a, a_tm)]))
              | uu____15264 ->
                  let uu____15265 =
                    FStar_TypeChecker_Err.unexpected_signature_for_monad env
                      eff_name signature
                     in
                  FStar_Errors.raise_error uu____15265 r
               in
            let uu____15271 =
              let uu____15284 =
                let uu____15286 = FStar_Range.string_of_range r  in
                FStar_Util.format2 "implicit for wp of %s at %s"
                  eff_name.FStar_Ident.str uu____15286
                 in
              new_implicit_var uu____15284 r env wp_sort  in
            match uu____15271 with
            | (wp_uvar,uu____15294,g_wp_uvar) ->
                let eff_c =
                  let uu____15309 =
                    let uu____15310 =
                      let uu____15321 =
                        FStar_All.pipe_right wp_uvar
                          FStar_Syntax_Syntax.as_arg
                         in
                      [uu____15321]  in
=======
              let uu____15180 =
                let uu____15181 = FStar_Syntax_Subst.compress signature  in
                uu____15181.FStar_Syntax_Syntax.n  in
              match uu____15180 with
              | FStar_Syntax_Syntax.Tm_arrow (bs,uu____15185) when
=======
              let uu____15181 =
                let uu____15182 = FStar_Syntax_Subst.compress signature  in
                uu____15182.FStar_Syntax_Syntax.n  in
              match uu____15181 with
              | FStar_Syntax_Syntax.Tm_arrow (bs,uu____15186) when
>>>>>>> cp
                  (FStar_List.length bs) = (Prims.of_int (2)) ->
                  let uu____15215 = FStar_Syntax_Subst.open_binders bs  in
                  (match uu____15215 with
                   | (a,uu____15217)::(wp,uu____15219)::[] ->
                       FStar_All.pipe_right wp.FStar_Syntax_Syntax.sort
                         (FStar_Syntax_Subst.subst
                            [FStar_Syntax_Syntax.NT (a, a_tm)]))
              | uu____15248 ->
                  let uu____15249 =
                    FStar_TypeChecker_Err.unexpected_signature_for_monad env
                      eff_name signature
                     in
                  FStar_Errors.raise_error uu____15249 r
               in
            let uu____15255 =
              let uu____15268 =
                let uu____15270 = FStar_Range.string_of_range r  in
                FStar_Util.format2 "implicit for wp of %s at %s"
                  eff_name.FStar_Ident.str uu____15270
                 in
              new_implicit_var uu____15268 r env wp_sort  in
            match uu____15255 with
            | (wp_uvar,uu____15278,g_wp_uvar) ->
                let eff_c =
                  let uu____15293 =
                    let uu____15294 =
                      let uu____15305 =
                        FStar_All.pipe_right wp_uvar
                          FStar_Syntax_Syntax.as_arg
                         in
<<<<<<< HEAD
                      [uu____15304]  in
>>>>>>> snap
=======
                      [uu____15305]  in
>>>>>>> cp
                    {
                      FStar_Syntax_Syntax.comp_univs = [u];
                      FStar_Syntax_Syntax.effect_name = eff_name;
                      FStar_Syntax_Syntax.result_typ = a_tm;
<<<<<<< HEAD
<<<<<<< HEAD
                      FStar_Syntax_Syntax.effect_args = uu____15310;
                      FStar_Syntax_Syntax.flags = []
                    }  in
                  FStar_Syntax_Syntax.mk_Comp uu____15309  in
                let uu____15354 =
                  let uu____15355 =
                    let uu____15362 =
                      let uu____15363 =
                        let uu____15378 =
                          let uu____15387 =
                            FStar_Syntax_Syntax.null_binder
                              FStar_Syntax_Syntax.t_unit
                             in
                          [uu____15387]  in
                        (uu____15378, eff_c)  in
                      FStar_Syntax_Syntax.Tm_arrow uu____15363  in
                    FStar_Syntax_Syntax.mk uu____15362  in
                  uu____15355 FStar_Pervasives_Native.None r  in
                (uu____15354, g_wp_uvar)
=======
                      FStar_Syntax_Syntax.effect_args = uu____15293;
=======
                      FStar_Syntax_Syntax.effect_args = uu____15294;
>>>>>>> cp
                      FStar_Syntax_Syntax.flags = []
                    }  in
                  FStar_Syntax_Syntax.mk_Comp uu____15293  in
                let uu____15338 =
                  let uu____15339 =
                    let uu____15346 =
                      let uu____15347 =
                        let uu____15362 =
                          let uu____15371 =
                            FStar_Syntax_Syntax.null_binder
                              FStar_Syntax_Syntax.t_unit
                             in
<<<<<<< HEAD
                          [uu____15370]  in
                        (uu____15361, eff_c)  in
                      FStar_Syntax_Syntax.Tm_arrow uu____15346  in
                    FStar_Syntax_Syntax.mk uu____15345  in
                  uu____15338 FStar_Pervasives_Native.None r  in
                (uu____15337, g_wp_uvar)
>>>>>>> snap
=======
                          [uu____15371]  in
                        (uu____15362, eff_c)  in
                      FStar_Syntax_Syntax.Tm_arrow uu____15347  in
                    FStar_Syntax_Syntax.mk uu____15346  in
                  uu____15339 FStar_Pervasives_Native.None r  in
                (uu____15338, g_wp_uvar)
>>>>>>> cp
  
let (fresh_layered_effect_repr :
  FStar_TypeChecker_Env.env ->
    FStar_Range.range ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.tscheme ->
          FStar_Syntax_Syntax.tscheme ->
            FStar_Syntax_Syntax.universe ->
              FStar_Syntax_Syntax.term ->
                (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun r  ->
      fun eff_name  ->
        fun signature_ts  ->
          fun repr_ts  ->
            fun u  ->
              fun a_tm  ->
                let fail1 t =
<<<<<<< HEAD
<<<<<<< HEAD
                  let uu____15466 =
                    FStar_TypeChecker_Err.unexpected_signature_for_monad env
                      eff_name t
                     in
                  FStar_Errors.raise_error uu____15466 r  in
                let uu____15476 =
                  FStar_TypeChecker_Env.inst_tscheme signature_ts  in
                match uu____15476 with
                | (uu____15485,signature) ->
                    let uu____15487 =
                      let uu____15488 = FStar_Syntax_Subst.compress signature
                         in
                      uu____15488.FStar_Syntax_Syntax.n  in
                    (match uu____15487 with
                     | FStar_Syntax_Syntax.Tm_arrow (bs,uu____15496) ->
                         let bs1 = FStar_Syntax_Subst.open_binders bs  in
                         (match bs1 with
                          | a::bs2 ->
                              let uu____15544 =
=======
                  let uu____15449 =
=======
                  let uu____15450 =
>>>>>>> cp
                    FStar_TypeChecker_Err.unexpected_signature_for_monad env
                      eff_name t
                     in
                  FStar_Errors.raise_error uu____15450 r  in
                let uu____15460 =
                  FStar_TypeChecker_Env.inst_tscheme signature_ts  in
                match uu____15460 with
                | (uu____15469,signature) ->
                    let uu____15471 =
                      let uu____15472 = FStar_Syntax_Subst.compress signature
                         in
                      uu____15472.FStar_Syntax_Syntax.n  in
                    (match uu____15471 with
                     | FStar_Syntax_Syntax.Tm_arrow (bs,uu____15480) ->
                         let bs1 = FStar_Syntax_Subst.open_binders bs  in
                         (match bs1 with
                          | a::bs2 ->
<<<<<<< HEAD
                              let uu____15527 =
>>>>>>> snap
=======
                              let uu____15528 =
>>>>>>> cp
                                FStar_TypeChecker_Env.uvars_for_binders env
                                  bs2
                                  [FStar_Syntax_Syntax.NT
                                     ((FStar_Pervasives_Native.fst a), a_tm)]
                                  (fun b  ->
<<<<<<< HEAD
<<<<<<< HEAD
                                     let uu____15559 =
                                       FStar_Syntax_Print.binder_to_string b
                                        in
                                     let uu____15561 =
                                       FStar_Range.string_of_range r  in
                                     FStar_Util.format3
                                       "uvar for binder %s when creating a fresh repr for %s at %s"
                                       uu____15559 eff_name.FStar_Ident.str
                                       uu____15561) r
                                 in
                              (match uu____15544 with
                               | (is,g) ->
                                   let repr =
                                     let uu____15575 =
                                       FStar_TypeChecker_Env.inst_tscheme_with
                                         repr_ts [u]
                                        in
                                     FStar_All.pipe_right uu____15575
                                       FStar_Pervasives_Native.snd
                                      in
                                   let uu____15584 =
                                     let uu____15585 =
                                       let uu____15590 =
=======
                                     let uu____15542 =
=======
                                     let uu____15543 =
>>>>>>> cp
                                       FStar_Syntax_Print.binder_to_string b
                                        in
                                     let uu____15545 =
                                       FStar_Range.string_of_range r  in
                                     FStar_Util.format3
                                       "uvar for binder %s when creating a fresh repr for %s at %s"
                                       uu____15543 eff_name.FStar_Ident.str
                                       uu____15545) r
                                 in
                              (match uu____15528 with
                               | (is,g) ->
                                   let repr =
                                     let uu____15559 =
                                       FStar_TypeChecker_Env.inst_tscheme_with
                                         repr_ts [u]
                                        in
                                     FStar_All.pipe_right uu____15559
                                       FStar_Pervasives_Native.snd
                                      in
<<<<<<< HEAD
                                   let uu____15567 =
                                     let uu____15568 =
                                       let uu____15573 =
>>>>>>> snap
=======
                                   let uu____15568 =
                                     let uu____15569 =
                                       let uu____15574 =
>>>>>>> cp
                                         FStar_List.map
                                           FStar_Syntax_Syntax.as_arg (a_tm
                                           :: is)
                                          in
                                       FStar_Syntax_Syntax.mk_Tm_app repr
<<<<<<< HEAD
<<<<<<< HEAD
                                         uu____15590
                                        in
                                     uu____15585 FStar_Pervasives_Native.None
                                       r
                                      in
                                   (uu____15584, g))
                          | uu____15599 -> fail1 signature)
                     | uu____15600 -> fail1 signature)
=======
                                         uu____15573
=======
                                         uu____15574
>>>>>>> cp
                                        in
                                     uu____15569 FStar_Pervasives_Native.None
                                       r
                                      in
<<<<<<< HEAD
                                   (uu____15567, g))
                          | uu____15582 -> fail1 signature)
                     | uu____15583 -> fail1 signature)
>>>>>>> snap
=======
                                   (uu____15568, g))
                          | uu____15583 -> fail1 signature)
                     | uu____15584 -> fail1 signature)
>>>>>>> cp
  
let (fresh_effect_repr_en :
  FStar_TypeChecker_Env.env ->
    FStar_Range.range ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.universe ->
          FStar_Syntax_Syntax.term ->
            (FStar_Syntax_Syntax.term * FStar_TypeChecker_Common.guard_t))
  =
  fun env  ->
    fun r  ->
      fun eff_name  ->
        fun u  ->
          fun a_tm  ->
<<<<<<< HEAD
<<<<<<< HEAD
            let uu____15631 =
              FStar_All.pipe_right eff_name
                (FStar_TypeChecker_Env.get_effect_decl env)
               in
            FStar_All.pipe_right uu____15631
=======
            let uu____15614 =
              FStar_All.pipe_right eff_name
                (FStar_TypeChecker_Env.get_effect_decl env)
               in
            FStar_All.pipe_right uu____15614
>>>>>>> snap
=======
            let uu____15615 =
              FStar_All.pipe_right eff_name
                (FStar_TypeChecker_Env.get_effect_decl env)
               in
            FStar_All.pipe_right uu____15615
>>>>>>> cp
              (fun ed  ->
                 if ed.FStar_Syntax_Syntax.is_layered
                 then
                   fresh_layered_effect_repr env r eff_name
                     ed.FStar_Syntax_Syntax.signature
                     ed.FStar_Syntax_Syntax.repr u a_tm
                 else fresh_non_layered_effect_repr env r eff_name u a_tm)
  
let (layered_effect_indices_as_binders :
  FStar_TypeChecker_Env.env ->
    FStar_Range.range ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.tscheme ->
          FStar_Syntax_Syntax.universe ->
            FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.binders)
  =
  fun env  ->
    fun r  ->
      fun eff_name  ->
        fun sig_ts  ->
          fun u  ->
            fun a_tm  ->
<<<<<<< HEAD
<<<<<<< HEAD
              let uu____15676 =
                FStar_TypeChecker_Env.inst_tscheme_with sig_ts [u]  in
              match uu____15676 with
              | (uu____15681,sig_tm) ->
                  let fail1 t =
                    let uu____15689 =
                      FStar_TypeChecker_Err.unexpected_signature_for_monad
                        env eff_name t
                       in
                    FStar_Errors.raise_error uu____15689 r  in
                  let uu____15695 =
                    let uu____15696 = FStar_Syntax_Subst.compress sig_tm  in
                    uu____15696.FStar_Syntax_Syntax.n  in
                  (match uu____15695 with
                   | FStar_Syntax_Syntax.Tm_arrow (bs,uu____15700) ->
                       let bs1 = FStar_Syntax_Subst.open_binders bs  in
                       (match bs1 with
                        | (a',uu____15723)::bs2 ->
                            FStar_All.pipe_right bs2
                              (FStar_Syntax_Subst.subst_binders
                                 [FStar_Syntax_Syntax.NT (a', a_tm)])
                        | uu____15745 -> fail1 sig_tm)
                   | uu____15746 -> fail1 sig_tm)
=======
              let uu____15659 =
=======
              let uu____15660 =
>>>>>>> cp
                FStar_TypeChecker_Env.inst_tscheme_with sig_ts [u]  in
              match uu____15660 with
              | (uu____15665,sig_tm) ->
                  let fail1 t =
                    let uu____15673 =
                      FStar_TypeChecker_Err.unexpected_signature_for_monad
                        env eff_name t
                       in
                    FStar_Errors.raise_error uu____15673 r  in
                  let uu____15679 =
                    let uu____15680 = FStar_Syntax_Subst.compress sig_tm  in
                    uu____15680.FStar_Syntax_Syntax.n  in
                  (match uu____15679 with
                   | FStar_Syntax_Syntax.Tm_arrow (bs,uu____15684) ->
                       let bs1 = FStar_Syntax_Subst.open_binders bs  in
                       (match bs1 with
                        | (a',uu____15707)::bs2 ->
                            FStar_All.pipe_right bs2
                              (FStar_Syntax_Subst.subst_binders
                                 [FStar_Syntax_Syntax.NT (a', a_tm)])
<<<<<<< HEAD
                        | uu____15728 -> fail1 sig_tm)
                   | uu____15729 -> fail1 sig_tm)
>>>>>>> snap
=======
                        | uu____15729 -> fail1 sig_tm)
                   | uu____15730 -> fail1 sig_tm)
>>>>>>> cp
  
let (lift_tf_layered_effect :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.tscheme -> FStar_TypeChecker_Env.lift_comp_t)
  =
  fun tgt  ->
    fun lift_ts  ->
      fun env  ->
        fun c  ->
<<<<<<< HEAD
<<<<<<< HEAD
          (let uu____15767 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "LayeredEffects")
              in
           if uu____15767
           then
             let uu____15772 = FStar_Syntax_Print.comp_to_string c  in
             let uu____15774 = FStar_Syntax_Print.lid_to_string tgt  in
             FStar_Util.print2 "Lifting comp %s to layered effect %s {\n"
               uu____15772 uu____15774
           else ());
          (let r = FStar_TypeChecker_Env.get_range env  in
           let effect_args_from_repr repr is_layered =
             let err uu____15804 =
               let uu____15805 =
                 let uu____15811 =
                   let uu____15813 = FStar_Syntax_Print.term_to_string repr
                      in
                   let uu____15815 = FStar_Util.string_of_bool is_layered  in
                   FStar_Util.format2
                     "Could not get effect args from repr %s with is_layered %s"
                     uu____15813 uu____15815
                    in
                 (FStar_Errors.Fatal_UnexpectedEffect, uu____15811)  in
               FStar_Errors.raise_error uu____15805 r  in
=======
          (let uu____15750 =
=======
          (let uu____15751 =
>>>>>>> cp
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "LayeredEffects")
              in
           if uu____15751
           then
             let uu____15756 = FStar_Syntax_Print.comp_to_string c  in
             let uu____15758 = FStar_Syntax_Print.lid_to_string tgt  in
             FStar_Util.print2 "Lifting comp %s to layered effect %s {\n"
               uu____15756 uu____15758
           else ());
          (let r = FStar_TypeChecker_Env.get_range env  in
           let effect_args_from_repr repr is_layered =
             let err uu____15788 =
               let uu____15789 =
                 let uu____15795 =
                   let uu____15797 = FStar_Syntax_Print.term_to_string repr
                      in
                   let uu____15799 = FStar_Util.string_of_bool is_layered  in
                   FStar_Util.format2
                     "Could not get effect args from repr %s with is_layered %s"
                     uu____15797 uu____15799
                    in
<<<<<<< HEAD
                 (FStar_Errors.Fatal_UnexpectedEffect, uu____15794)  in
               FStar_Errors.raise_error uu____15788 r  in
>>>>>>> snap
=======
                 (FStar_Errors.Fatal_UnexpectedEffect, uu____15795)  in
               FStar_Errors.raise_error uu____15789 r  in
>>>>>>> cp
             let repr1 = FStar_Syntax_Subst.compress repr  in
             if is_layered
             then
               match repr1.FStar_Syntax_Syntax.n with
<<<<<<< HEAD
<<<<<<< HEAD
               | FStar_Syntax_Syntax.Tm_app (uu____15827,uu____15828::is) ->
                   FStar_All.pipe_right is
                     (FStar_List.map FStar_Pervasives_Native.fst)
               | uu____15896 -> err ()
             else
               (match repr1.FStar_Syntax_Syntax.n with
                | FStar_Syntax_Syntax.Tm_arrow (uu____15901,c1) ->
                    let uu____15923 =
                      FStar_All.pipe_right c1
                        FStar_Syntax_Util.comp_to_comp_typ
                       in
                    FStar_All.pipe_right uu____15923
=======
               | FStar_Syntax_Syntax.Tm_app (uu____15810,uu____15811::is) ->
=======
               | FStar_Syntax_Syntax.Tm_app (uu____15811,uu____15812::is) ->
>>>>>>> cp
                   FStar_All.pipe_right is
                     (FStar_List.map FStar_Pervasives_Native.fst)
               | uu____15880 -> err ()
             else
               (match repr1.FStar_Syntax_Syntax.n with
                | FStar_Syntax_Syntax.Tm_arrow (uu____15885,c1) ->
                    let uu____15907 =
                      FStar_All.pipe_right c1
                        FStar_Syntax_Util.comp_to_comp_typ
                       in
<<<<<<< HEAD
                    FStar_All.pipe_right uu____15906
>>>>>>> snap
=======
                    FStar_All.pipe_right uu____15907
>>>>>>> cp
                      (fun ct  ->
                         FStar_All.pipe_right
                           ct.FStar_Syntax_Syntax.effect_args
                           (FStar_List.map FStar_Pervasives_Native.fst))
<<<<<<< HEAD
<<<<<<< HEAD
                | uu____15958 -> err ())
              in
           let ct = FStar_Syntax_Util.comp_to_comp_typ c  in
           let uu____15960 =
             let uu____15971 =
               FStar_List.hd ct.FStar_Syntax_Syntax.comp_univs  in
             let uu____15972 =
               FStar_All.pipe_right ct.FStar_Syntax_Syntax.effect_args
                 (FStar_List.map FStar_Pervasives_Native.fst)
                in
             (uu____15971, (ct.FStar_Syntax_Syntax.result_typ), uu____15972)
              in
           match uu____15960 with
           | (u,a,c_is) ->
               let uu____16020 =
                 FStar_TypeChecker_Env.inst_tscheme_with lift_ts [u]  in
               (match uu____16020 with
                | (uu____16029,lift_t) ->
                    let lift_t_shape_error s =
                      let uu____16040 =
                        FStar_Ident.string_of_lid
                          ct.FStar_Syntax_Syntax.effect_name
                         in
                      let uu____16042 = FStar_Ident.string_of_lid tgt  in
                      let uu____16044 =
                        FStar_Syntax_Print.term_to_string lift_t  in
                      FStar_Util.format4
                        "Lift from %s to %s has unexpected shape, reason: %s (lift:%s)"
                        uu____16040 uu____16042 s uu____16044
                       in
                    let uu____16047 =
                      let uu____16080 =
                        let uu____16081 = FStar_Syntax_Subst.compress lift_t
                           in
                        uu____16081.FStar_Syntax_Syntax.n  in
                      match uu____16080 with
                      | FStar_Syntax_Syntax.Tm_arrow (bs,c1) when
                          (FStar_List.length bs) >= (Prims.of_int (2)) ->
                          let uu____16145 =
                            FStar_Syntax_Subst.open_comp bs c1  in
                          (match uu____16145 with
                           | (a_b::bs1,c2) ->
                               let uu____16205 =
=======
                | uu____15941 -> err ())
=======
                | uu____15942 -> err ())
>>>>>>> cp
              in
           let ct = FStar_Syntax_Util.comp_to_comp_typ c  in
           let uu____15944 =
             let uu____15955 =
               FStar_List.hd ct.FStar_Syntax_Syntax.comp_univs  in
             let uu____15956 =
               FStar_All.pipe_right ct.FStar_Syntax_Syntax.effect_args
                 (FStar_List.map FStar_Pervasives_Native.fst)
                in
             (uu____15955, (ct.FStar_Syntax_Syntax.result_typ), uu____15956)
              in
           match uu____15944 with
           | (u,a,c_is) ->
               let uu____16004 =
                 FStar_TypeChecker_Env.inst_tscheme_with lift_ts [u]  in
               (match uu____16004 with
                | (uu____16013,lift_t) ->
                    let lift_t_shape_error s =
                      let uu____16024 =
                        FStar_Ident.string_of_lid
                          ct.FStar_Syntax_Syntax.effect_name
                         in
                      let uu____16026 = FStar_Ident.string_of_lid tgt  in
                      let uu____16028 =
                        FStar_Syntax_Print.term_to_string lift_t  in
                      FStar_Util.format4
                        "Lift from %s to %s has unexpected shape, reason: %s (lift:%s)"
                        uu____16024 uu____16026 s uu____16028
                       in
                    let uu____16031 =
                      let uu____16064 =
                        let uu____16065 = FStar_Syntax_Subst.compress lift_t
                           in
                        uu____16065.FStar_Syntax_Syntax.n  in
                      match uu____16064 with
                      | FStar_Syntax_Syntax.Tm_arrow (bs,c1) when
                          (FStar_List.length bs) >= (Prims.of_int (2)) ->
                          let uu____16129 =
                            FStar_Syntax_Subst.open_comp bs c1  in
                          (match uu____16129 with
                           | (a_b::bs1,c2) ->
<<<<<<< HEAD
                               let uu____16188 =
>>>>>>> snap
=======
                               let uu____16189 =
>>>>>>> cp
                                 FStar_All.pipe_right bs1
                                   (FStar_List.splitAt
                                      ((FStar_List.length bs1) -
                                         Prims.int_one))
                                  in
<<<<<<< HEAD
<<<<<<< HEAD
                               let uu____16267 =
                                 FStar_Syntax_Util.comp_to_comp_typ c2  in
                               (a_b, uu____16205, uu____16267))
                      | uu____16294 ->
                          let uu____16295 =
                            let uu____16301 =
=======
                               let uu____16250 =
                                 FStar_Syntax_Util.comp_to_comp_typ c2  in
                               (a_b, uu____16188, uu____16250))
                      | uu____16277 ->
                          let uu____16278 =
                            let uu____16284 =
>>>>>>> snap
=======
                               let uu____16251 =
                                 FStar_Syntax_Util.comp_to_comp_typ c2  in
                               (a_b, uu____16189, uu____16251))
                      | uu____16278 ->
                          let uu____16279 =
                            let uu____16285 =
>>>>>>> cp
                              lift_t_shape_error
                                "either not an arrow or not enough binders"
                               in
                            (FStar_Errors.Fatal_UnexpectedEffect,
<<<<<<< HEAD
<<<<<<< HEAD
                              uu____16301)
                             in
                          FStar_Errors.raise_error uu____16295 r
                       in
                    (match uu____16047 with
                     | (a_b,(rest_bs,f_b::[]),lift_ct) ->
                         let uu____16419 =
                           let uu____16426 =
                             let uu____16427 =
                               let uu____16428 =
                                 let uu____16435 =
                                   FStar_All.pipe_right a_b
                                     FStar_Pervasives_Native.fst
                                    in
                                 (uu____16435, a)  in
                               FStar_Syntax_Syntax.NT uu____16428  in
                             [uu____16427]  in
                           FStar_TypeChecker_Env.uvars_for_binders env
                             rest_bs uu____16426
                             (fun b  ->
                                let uu____16452 =
                                  FStar_Syntax_Print.binder_to_string b  in
                                let uu____16454 =
                                  FStar_Ident.string_of_lid
                                    ct.FStar_Syntax_Syntax.effect_name
                                   in
                                let uu____16456 =
                                  FStar_Ident.string_of_lid tgt  in
                                let uu____16458 =
                                  FStar_Range.string_of_range r  in
                                FStar_Util.format4
                                  "implicit var for binder %s of %s~>%s at %s"
                                  uu____16452 uu____16454 uu____16456
                                  uu____16458) r
                            in
                         (match uu____16419 with
=======
                              uu____16284)
=======
                              uu____16285)
>>>>>>> cp
                             in
                          FStar_Errors.raise_error uu____16279 r
                       in
                    (match uu____16031 with
                     | (a_b,(rest_bs,f_b::[]),lift_ct) ->
                         let uu____16403 =
                           let uu____16410 =
                             let uu____16411 =
                               let uu____16412 =
                                 let uu____16419 =
                                   FStar_All.pipe_right a_b
                                     FStar_Pervasives_Native.fst
                                    in
                                 (uu____16419, a)  in
                               FStar_Syntax_Syntax.NT uu____16412  in
                             [uu____16411]  in
                           FStar_TypeChecker_Env.uvars_for_binders env
                             rest_bs uu____16410
                             (fun b  ->
                                let uu____16436 =
                                  FStar_Syntax_Print.binder_to_string b  in
                                let uu____16438 =
                                  FStar_Ident.string_of_lid
                                    ct.FStar_Syntax_Syntax.effect_name
                                   in
                                let uu____16440 =
                                  FStar_Ident.string_of_lid tgt  in
                                let uu____16442 =
                                  FStar_Range.string_of_range r  in
                                FStar_Util.format4
                                  "implicit var for binder %s of %s~>%s at %s"
                                  uu____16436 uu____16438 uu____16440
                                  uu____16442) r
                            in
<<<<<<< HEAD
                         (match uu____16402 with
>>>>>>> snap
                          | (rest_bs_uvars,g) ->
                              let substs =
                                FStar_List.map2
                                  (fun b  ->
                                     fun t  ->
<<<<<<< HEAD
                                       let uu____16495 =
                                         let uu____16502 =
                                           FStar_All.pipe_right b
                                             FStar_Pervasives_Native.fst
                                            in
                                         (uu____16502, t)  in
                                       FStar_Syntax_Syntax.NT uu____16495)
=======
                                       let uu____16478 =
                                         let uu____16485 =
                                           FStar_All.pipe_right b
                                             FStar_Pervasives_Native.fst
                                            in
                                         (uu____16485, t)  in
                                       FStar_Syntax_Syntax.NT uu____16478)
>>>>>>> snap
                                  (a_b :: rest_bs) (a :: rest_bs_uvars)
                                 in
                              let guard_f =
                                let f_sort =
<<<<<<< HEAD
                                  let uu____16521 =
=======
                                  let uu____16504 =
>>>>>>> snap
                                    FStar_All.pipe_right
                                      (FStar_Pervasives_Native.fst f_b).FStar_Syntax_Syntax.sort
                                      (FStar_Syntax_Subst.subst substs)
                                     in
<<<<<<< HEAD
                                  FStar_All.pipe_right uu____16521
                                    FStar_Syntax_Subst.compress
                                   in
                                let f_sort_is =
                                  let uu____16527 =
                                    FStar_TypeChecker_Env.is_layered_effect
                                      env ct.FStar_Syntax_Syntax.effect_name
                                     in
                                  effect_args_from_repr f_sort uu____16527
=======
                                  FStar_All.pipe_right uu____16504
                                    FStar_Syntax_Subst.compress
                                   in
                                let f_sort_is =
                                  let uu____16510 =
                                    FStar_TypeChecker_Env.is_layered_effect
                                      env ct.FStar_Syntax_Syntax.effect_name
                                     in
                                  effect_args_from_repr f_sort uu____16510
>>>>>>> snap
                                   in
                                FStar_List.fold_left2
                                  (fun g1  ->
                                     fun i1  ->
                                       fun i2  ->
<<<<<<< HEAD
                                         let uu____16536 =
=======
                                         let uu____16519 =
>>>>>>> snap
                                           FStar_TypeChecker_Rel.teq env i1
                                             i2
                                            in
                                         FStar_TypeChecker_Env.conj_guard g1
<<<<<<< HEAD
                                           uu____16536)
=======
                                           uu____16519)
>>>>>>> snap
                                  FStar_TypeChecker_Env.trivial_guard c_is
                                  f_sort_is
                                 in
                              let is =
<<<<<<< HEAD
                                let uu____16540 =
=======
                                let uu____16523 =
>>>>>>> snap
                                  FStar_TypeChecker_Env.is_layered_effect env
                                    tgt
                                   in
                                effect_args_from_repr
                                  lift_ct.FStar_Syntax_Syntax.result_typ
<<<<<<< HEAD
                                  uu____16540
                                 in
                              let c1 =
                                let uu____16543 =
                                  let uu____16544 =
                                    let uu____16555 =
=======
                                  uu____16523
                                 in
                              let c1 =
                                let uu____16526 =
                                  let uu____16527 =
                                    let uu____16538 =
>>>>>>> snap
                                      FStar_All.pipe_right is
                                        (FStar_List.map
                                           (FStar_Syntax_Subst.subst substs))
                                       in
<<<<<<< HEAD
                                    FStar_All.pipe_right uu____16555
=======
                                    FStar_All.pipe_right uu____16538
>>>>>>> snap
                                      (FStar_List.map
                                         FStar_Syntax_Syntax.as_arg)
                                     in
                                  {
                                    FStar_Syntax_Syntax.comp_univs =
                                      (lift_ct.FStar_Syntax_Syntax.comp_univs);
                                    FStar_Syntax_Syntax.effect_name = tgt;
                                    FStar_Syntax_Syntax.result_typ = a;
                                    FStar_Syntax_Syntax.effect_args =
<<<<<<< HEAD
                                      uu____16544;
                                    FStar_Syntax_Syntax.flags =
                                      (ct.FStar_Syntax_Syntax.flags)
                                  }  in
                                FStar_Syntax_Syntax.mk_Comp uu____16543  in
                              ((let uu____16575 =
=======
                                      uu____16527;
                                    FStar_Syntax_Syntax.flags =
                                      (ct.FStar_Syntax_Syntax.flags)
                                  }  in
                                FStar_Syntax_Syntax.mk_Comp uu____16526  in
                              ((let uu____16558 =
>>>>>>> snap
=======
                         (match uu____16403 with
                          | (rest_bs_uvars,g) ->
                              ((let uu____16456 =
>>>>>>> cp
                                  FStar_All.pipe_left
                                    (FStar_TypeChecker_Env.debug env)
                                    (FStar_Options.Other "LayeredEffects")
                                   in
<<<<<<< HEAD
<<<<<<< HEAD
                                if uu____16575
                                then
                                  let uu____16580 =
                                    FStar_Syntax_Print.comp_to_string c1  in
                                  FStar_Util.print1 "} Lifted comp: %s\n"
                                    uu____16580
                                else ());
                               (let uu____16585 =
                                  FStar_TypeChecker_Env.conj_guard g guard_f
                                   in
                                (c1, uu____16585)))))))
=======
                                if uu____16558
=======
                                if uu____16456
>>>>>>> cp
                                then
                                  let uu____16461 =
                                    FStar_List.fold_left
                                      (fun s  ->
                                         fun u1  ->
                                           let uu____16470 =
                                             let uu____16472 =
                                               FStar_Syntax_Print.term_to_string
                                                 u1
                                                in
                                             Prims.op_Hat ";;;;" uu____16472
                                              in
                                           Prims.op_Hat s uu____16470) ""
                                      rest_bs_uvars
                                     in
                                  FStar_Util.print1 "Introduced uvars: %s\n"
                                    uu____16461
                                else ());
                               (let substs =
                                  FStar_List.map2
                                    (fun b  ->
                                       fun t  ->
                                         let uu____16503 =
                                           let uu____16510 =
                                             FStar_All.pipe_right b
                                               FStar_Pervasives_Native.fst
                                              in
                                           (uu____16510, t)  in
                                         FStar_Syntax_Syntax.NT uu____16503)
                                    (a_b :: rest_bs) (a :: rest_bs_uvars)
                                   in
<<<<<<< HEAD
                                (c1, uu____16568)))))))
>>>>>>> snap
=======
                                let guard_f =
                                  let f_sort =
                                    let uu____16529 =
                                      FStar_All.pipe_right
                                        (FStar_Pervasives_Native.fst f_b).FStar_Syntax_Syntax.sort
                                        (FStar_Syntax_Subst.subst substs)
                                       in
                                    FStar_All.pipe_right uu____16529
                                      FStar_Syntax_Subst.compress
                                     in
                                  let f_sort_is =
                                    let uu____16535 =
                                      FStar_TypeChecker_Env.is_layered_effect
                                        env
                                        ct.FStar_Syntax_Syntax.effect_name
                                       in
                                    effect_args_from_repr f_sort uu____16535
                                     in
                                  FStar_List.fold_left2
                                    (fun g1  ->
                                       fun i1  ->
                                         fun i2  ->
                                           let uu____16544 =
                                             FStar_TypeChecker_Rel.teq env i1
                                               i2
                                              in
                                           FStar_TypeChecker_Env.conj_guard
                                             g1 uu____16544)
                                    FStar_TypeChecker_Env.trivial_guard c_is
                                    f_sort_is
                                   in
                                let is =
                                  let uu____16548 =
                                    FStar_TypeChecker_Env.is_layered_effect
                                      env tgt
                                     in
                                  effect_args_from_repr
                                    lift_ct.FStar_Syntax_Syntax.result_typ
                                    uu____16548
                                   in
                                let c1 =
                                  let uu____16551 =
                                    let uu____16552 =
                                      let uu____16563 =
                                        FStar_All.pipe_right is
                                          (FStar_List.map
                                             (FStar_Syntax_Subst.subst substs))
                                         in
                                      FStar_All.pipe_right uu____16563
                                        (FStar_List.map
                                           FStar_Syntax_Syntax.as_arg)
                                       in
                                    {
                                      FStar_Syntax_Syntax.comp_univs =
                                        (lift_ct.FStar_Syntax_Syntax.comp_univs);
                                      FStar_Syntax_Syntax.effect_name = tgt;
                                      FStar_Syntax_Syntax.result_typ = a;
                                      FStar_Syntax_Syntax.effect_args =
                                        uu____16552;
                                      FStar_Syntax_Syntax.flags =
                                        (ct.FStar_Syntax_Syntax.flags)
                                    }  in
                                  FStar_Syntax_Syntax.mk_Comp uu____16551  in
                                (let uu____16583 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env)
                                     (FStar_Options.Other "LayeredEffects")
                                    in
                                 if uu____16583
                                 then
                                   let uu____16588 =
                                     FStar_Syntax_Print.comp_to_string c1  in
                                   FStar_Util.print1 "} Lifted comp: %s\n"
                                     uu____16588
                                 else ());
                                (let uu____16593 =
                                   FStar_TypeChecker_Env.conj_guard g guard_f
                                    in
                                 (c1, uu____16593))))))))
>>>>>>> cp
  
let (get_field_projector_name :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident -> Prims.int -> FStar_Ident.lident)
  =
  fun env  ->
    fun datacon  ->
      fun index1  ->
<<<<<<< HEAD
<<<<<<< HEAD
        let uu____16604 = FStar_TypeChecker_Env.lookup_datacon env datacon
           in
        match uu____16604 with
        | (uu____16609,t) ->
            let err n1 =
              let uu____16619 =
                let uu____16625 =
                  let uu____16627 = FStar_Ident.string_of_lid datacon  in
                  let uu____16629 = FStar_Util.string_of_int n1  in
                  let uu____16631 = FStar_Util.string_of_int index1  in
                  FStar_Util.format3
                    "Data constructor %s does not have enough binders (has %s, tried %s)"
                    uu____16627 uu____16629 uu____16631
                   in
                (FStar_Errors.Fatal_UnexpectedDataConstructor, uu____16625)
                 in
              let uu____16635 = FStar_TypeChecker_Env.get_range env  in
              FStar_Errors.raise_error uu____16619 uu____16635  in
            let uu____16636 =
              let uu____16637 = FStar_Syntax_Subst.compress t  in
              uu____16637.FStar_Syntax_Syntax.n  in
            (match uu____16636 with
             | FStar_Syntax_Syntax.Tm_arrow (bs,uu____16641) ->
                 let bs1 =
                   FStar_All.pipe_right bs
                     (FStar_List.filter
                        (fun uu____16696  ->
                           match uu____16696 with
                           | (uu____16704,q) ->
=======
        let uu____16587 = FStar_TypeChecker_Env.lookup_datacon env datacon
=======
        let uu____16612 = FStar_TypeChecker_Env.lookup_datacon env datacon
>>>>>>> cp
           in
        match uu____16612 with
        | (uu____16617,t) ->
            let err n1 =
              let uu____16627 =
                let uu____16633 =
                  let uu____16635 = FStar_Ident.string_of_lid datacon  in
                  let uu____16637 = FStar_Util.string_of_int n1  in
                  let uu____16639 = FStar_Util.string_of_int index1  in
                  FStar_Util.format3
                    "Data constructor %s does not have enough binders (has %s, tried %s)"
                    uu____16635 uu____16637 uu____16639
                   in
                (FStar_Errors.Fatal_UnexpectedDataConstructor, uu____16633)
                 in
              let uu____16643 = FStar_TypeChecker_Env.get_range env  in
              FStar_Errors.raise_error uu____16627 uu____16643  in
            let uu____16644 =
              let uu____16645 = FStar_Syntax_Subst.compress t  in
              uu____16645.FStar_Syntax_Syntax.n  in
            (match uu____16644 with
             | FStar_Syntax_Syntax.Tm_arrow (bs,uu____16649) ->
                 let bs1 =
                   FStar_All.pipe_right bs
                     (FStar_List.filter
<<<<<<< HEAD
                        (fun uu____16679  ->
                           match uu____16679 with
                           | (uu____16687,q) ->
>>>>>>> snap
=======
                        (fun uu____16704  ->
                           match uu____16704 with
                           | (uu____16712,q) ->
>>>>>>> cp
                               (match q with
                                | FStar_Pervasives_Native.Some
                                    (FStar_Syntax_Syntax.Implicit (true )) ->
                                    false
<<<<<<< HEAD
<<<<<<< HEAD
                                | uu____16713 -> true)))
=======
                                | uu____16696 -> true)))
>>>>>>> snap
=======
                                | uu____16721 -> true)))
>>>>>>> cp
                    in
                 if (FStar_List.length bs1) <= index1
                 then err (FStar_List.length bs1)
                 else
                   (let b = FStar_List.nth bs1 index1  in
<<<<<<< HEAD
<<<<<<< HEAD
                    let uu____16745 =
                      FStar_Syntax_Util.mk_field_projector_name datacon
                        (FStar_Pervasives_Native.fst b) index1
                       in
                    FStar_All.pipe_right uu____16745
                      FStar_Pervasives_Native.fst)
             | uu____16756 -> err Prims.int_zero)
=======
                    let uu____16728 =
=======
                    let uu____16753 =
>>>>>>> cp
                      FStar_Syntax_Util.mk_field_projector_name datacon
                        (FStar_Pervasives_Native.fst b) index1
                       in
                    FStar_All.pipe_right uu____16753
                      FStar_Pervasives_Native.fst)
<<<<<<< HEAD
             | uu____16739 -> err Prims.int_zero)
>>>>>>> snap
=======
             | uu____16764 -> err Prims.int_zero)
>>>>>>> cp
  