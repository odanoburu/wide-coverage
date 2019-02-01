concrete ChunkPor of Chunk = CatPor, ExtensionsPor [VPS,VPI] ** 
  ChunkFunctor - [AP_Chunk, SSlash_Chunk]
    with (Syntax = SyntaxPor), (Extensions = ExtensionsPor) **
  open 
    SyntaxPor, (E = ExtensionsPor), Prelude, 
    ResPor, CommonRomance, (P = ParadigmsPor) in {

lin
  AP_Chunk ap = {s = ap.s ! variants{ASg (Masc | Fem) AAttr ; APl (Masc | Fem)}} ;
  SSlash_Chunk s = mkUtt <lin S {s = s.s ! {g = Masc ; n = Sg}} : S> ;

lin
  NP_Acc_Chunk np = ss (np.s ! Acc).ton ;
  NP_Gen_Chunk np = ss (np.s ! genitive).comp ;

  VPI_Chunk vpi = vpi ;

oper
  emptyNP = mkNP (P.mkPN []) ;

lin
  copula_inf_Chunk = ss "ser" | ss "estar" ;

  refl_SgP1_Chunk = ss "eu mesmo" ;
  refl_SgP2_Chunk = ss "você mesmo" ;
  refl_SgP3_Chunk = ss "ele mesmo" ;
  refl_PlP1_Chunk = ss "nós mesmos" ;
  refl_PlP2_Chunk = ss "vocês mesmos" ;
  refl_PlP3_Chunk = ss "eles mesmos" ;
  neg_Chunk = ss "não" ;
  copula_Chunk = ss "é" | ss "está" ;
  copula_neg_Chunk = ss "não é" | ss "não está" ;
  past_copula_Chunk = ss "era" ;
  past_copula_neg_Chunk = ss "não era" ;
  future_Chunk = ss "vai"  ; ----
  future_neg_Chunk = ss "não vai" ; ----
  cond_Chunk = ss ("iria" | "ia") ; ----
  cond_neg_Chunk = ss ("não iria" | "não ia") ; ----
  perfect_Chunk = ss "tinha" ;
  perfect_neg_Chunk = ss "não tinha" ;
  past_perfect_Chunk = ss "havia" ;
  past_perfect_neg_Chunk = ss "não havia" ;

} ;
