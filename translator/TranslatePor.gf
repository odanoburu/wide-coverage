--# -path=.:../chunk:alltenses

concrete TranslatePor of Translate = 
  TensePor,
  NounPor - [
    PPartNP
    ],
  AdjectivePor,
  NumeralPor,
  SymbolPor [
    PN, Symb, String, CN, Card, NP, MkSymb, SymbPN, CNNumNP
    ],
  ConjunctionPor,
  VerbPor -  [
    UseCopula,  
    PassV2  -- generalized in Extensions
    ],
  AdverbPor,
  PhrasePor,
  SentencePor,
  QuestionPor,
  RelativePor,
  IdiomPor,
  ConstructionPor,
  DocumentationPor,

  ChunkPor,
  ExtensionsPor [
    ListVPS,BaseVPS,ConsVPS,ConjVPS,ListVPI,BaseVPI,ConsVPI,ConjVPI,
    CompoundN,AdAdV,UttAdV,ApposNP,MkVPI, MkVPS, PredVPS, PassVPSlash, PassAgentVPSlash, CompoundAP
    , PastPartAP, PastPartAgentAP, PresPartAP, GerundNP, GerundAdv
    , WithoutVP, InOrderToVP, ByVP
    ],

  DictionaryPor ** 
open MorphoPor, ResPor, ParadigmsPor, SyntaxPor, (E = ExtraPor), (G = GrammarPor), Prelude in {

flags
  literal=Symb ;

} ;

