--[] compare against Extend
concrete ExtensionsPor of Extensions = 
    CatPor ** 
  open 
    PhonoPor, MorphoPor, ResPor, CommonRomance, ParadigmsPor, SyntaxPor, Prelude, (G = GrammarPor), (E = ExtraPor), (EX = ExtendPor) in {

lincat
 VPI = E.VPI ;
----  ListVPI = E.ListVPI ;
  VPS = E.VPS ;
----  ListVPS = E.ListVPS ;
  
lin
  MkVPI = E.MkVPI ;
----  ConjVPI = E.ConjVPI ;
----  ComplVPIVV = E.ComplVPIVV ;

  MkVPS = E.MkVPS ;
----  ConjVPS = E.ConjVPS ;
  PredVPS = E.PredVPS ;

----  BaseVPI = E.BaseVPI ;
----  ConsVPI = E.ConsVPI ;
----  BaseVPS = E.BaseVPS ;
----  ConsVPS = E.ConsVPS ;

----  GenIP = E.GenIP ;
----  GenRP = E.GenRP ;

  PassVPSlash = E.PassVPSlash ;
  PassAgentVPSlash = E.PassAgentVPSlash ;


lin
  GenNP np = 
    let denp = (np.s ! ResPor.genitive).ton in {
      s = \\_,_,_,_ => [] ; 
      sp = \\_,_,_ => denp ;
      s2 = denp ; 
      isNeg = False ;
    } ;

  EmptyRelSlash slash = mkRCl which_RP (lin ClSlash slash) ;

  that_RP = which_RP ;

  but_Subj = {s = "mas" ; m = Indic} ; ---- strange to have this as Subj



  lin
    CompoundN = EX.CompoundN ;

    CompoundAP = EX.CompoundAP ;

    GerundNP = EX.GerundNP ;
    
    GerundAdv = EX.GerundAdv ;
    
    WithoutVP = EX.WithoutVP ;

    InOrderToVP = EX.InOrderToVP ;

    ByVP = EX.ByVP ;

    PresPartAP = EX.PresPartAP ;
    
    PastPartAP = EX.PastPartAP ;

    PastPartAgentAP = EX.PastPartAgentAP ;

    PositAdVAdj = EX.PositAdVAdj ;

{-
  UseQuantPN q pn = {s = \\c => q.s ! False ! Sg ++ pn.s ! npcase2case c ; a = agrgP3 Sg pn.g} ;

  SlashV2V v ant p vp = insertObjc (\\a => v.c3 ++ ant.s ++ p.s ++
                                           infVP v.typ vp ant.a p.p a)
                                   (predVc v) ;

  SlashVPIV2V v p vpi = insertObjc (\\a => p.s ++ 
                                           v.c3 ++ 
                                           vpi.s ! VVAux ! a)
                                   (predVc v) ;
-}
  ComplVV v a p vp = 
      insertComplement (\\a => prepCase v.c2.c ++ infVP vp a) (predV v) ; ---- a,p

---- TODO: find proper expressions for OSV and OVS in Por
  PredVPosv np vp = mkCl (lin NP np) (lin VP vp) ;
  PredVPovs np vp = mkCl (lin NP np) (lin VP vp) ;


  CompS s = {s = \\_ => "de" ++ "que" ++ s.s ! Indic ; cop = serCopula} ; ---- de ?

{-
  CompQS qs = {s = \\_ => qs.s ! QIndir} ;
  CompVP ant p vp = {s = \\a => ant.s ++ p.s ++ 
                                infVP VVInf vp ant.a p.p a} ;

  VPSlashVS vs vp = 
    insertObj (\\a => infVP VVInf vp Simul CPos a) (predV vs) **
    {c2 = ""; gapInMiddle = False} ;

  PastPartRS ant pol vps = {
    s = \\agr => vps.ad ++ vps.ptp ++ vps.s2 ! agr ;
    c = npNom
    } ;

  PresPartRS ant pol vp = {
    s = \\agr => vp.ad ++ vp.prp ++ vp.s2 ! agr ;
    c = npNom
  } ;

  ApposNP np1 np2 = {
    s = \\c => np1.s ! c ++ "," ++ np2.s ! npNom ;
    a = np1.a
  } ;
  
  AdAdV = cc2 ;
  
  UttAdV adv = adv;
-}

    
} ;
