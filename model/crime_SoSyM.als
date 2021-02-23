module mergedDL

abstract sig TOP { 
categorizes : set TOP,
//concernsQualityValue : set TOP, //no
//hasQualityValue : set TOP, //no
//hasValueComponent : set TOP, //leva
isDerivedFrom : set TOP,
isProperPartOf : set TOP,
partitions : set TOP,
standsIn : set Situation,
//preferredNamespaceUri : set TOP
}
sig BOTTOM in TOP {} fact { #BOTTOM = 0 } 

fact {all a:TOP| a.Questions in a.mediates}
fact {all r:Witness | r in Endurant}
fact {all a:TOP | a.ContributesTo in a.mediates}
fact {all r:CrimeInvestigation | r in Endurant}
fact {all a:TOP | a.isSubQuantityOf in a.isObjectProperPartOf}
fact {all r:Quantity | r in Object}
fact {all a:Detective | a.ConductedBy in a.mediates}
fact {all r:Detective | r in Endurant}
fact {all a:Event | a.isEventProperPartOf in a.isProperPartOf}
//fact {all r:Event | r in Thing}
fact {all a:QualityValueAttributionSituation | a.standsInQualifiedAttribution in a.standsIn}
fact {all r:QualityValueAttributionSituation | r in Situation}
fact {all a:Collection | a.isSubCollectionOf in a.isObjectProperPartOf}
fact {all r:Collection | r in Object}
fact {all a:Collection | a.isCollectionMemberOf in a.isObjectProperPartOf}
fact {all r:Collection | r in Object}
fact {all a:TemporaryInstantiationSituation | a.standsInQualifiedInstantiation in a.standsIn}
fact {all r:TemporaryInstantiationSituation | r in Situation}
fact {all r:TemporaryRelationshipSituation | r in Situation}
fact {all a:TemporaryParthoodSituation | a.standsInQualifiedParthood in a.standsIn}
fact {all r:TemporaryParthoodSituation | r in Situation}
fact {all a:Witness | a.InvolvesWitness in a.mediates}
fact {all r:Witness | r in Endurant}
fact {all a:TemporaryConstitutionSituation | a.standsInQualifiedConstitution in a.standsIn}
fact {all r:TemporaryConstitutionSituation | r in Situation}
fact {all a:FunctionalComplex | a.isComponentOf in a.isObjectProperPartOf}
fact {all r:FunctionalComplex | r in Object}
fact {all a:TemporaryRelationshipSituation | a.standsInQualifiedRelationship in a.standsIn}
fact {all a:Object | a.isObjectProperPartOf in a.isProperPartOf}
//fact {all r:Object | r in Thing}
fact {all a:LeadDetective | a.IsLedBy in a.mediates}
fact {all r:LeadDetective | r in Endurant}
fact {all a:Aspect | a.isAspectProperPartOf in a.isProperPartOf}
//fact {all r:Aspect | r in Thing}
fact {all a:Situation | a.isSituationProperPartOf in a.isProperPartOf}
//fact {all r:Situation | r in Thing}
fact {all a:Detective | a.InvolvesDetective in a.mediates}
fact {all r:Detective | r in Endurant}
fact {all a:Suspect | a.InvolvesSuspect in a.mediates}
fact {all r:Suspect | r in Endurant}

//metaProperties
fact { isSubCollectionOf.isSubCollectionOf in isSubCollectionOf } // TransitiveProperty 
fact { isSubQuantityOf.isSubQuantityOf in isSubQuantityOf } // TransitiveProperty 
fact { isAspectProperPartOf.isAspectProperPartOf in isAspectProperPartOf } // TransitiveProperty 
fact {no iden & inheresIn} // IrreflexiveProperty 
fact {no iden & externallyDependsOn} // IrreflexiveProperty 
fact {no iden & mediates} // IrreflexiveProperty 
fact {~mediates  & mediates in iden} // AsymmetricProperty 
fact { isEventProperPartOf.isEventProperPartOf in isEventProperPartOf } // TransitiveProperty 
fact { isProperPartOf.isProperPartOf in isProperPartOf } // TransitiveProperty 
fact {~inheresIn  & inheresIn in iden} // AsymmetricProperty 
fact { isObjectProperPartOf.isObjectProperPartOf in isObjectProperPartOf } // TransitiveProperty
fact { historicallyDependsOn.historicallyDependsOn in historicallyDependsOn } // TransitiveProperty  

// Signatures
//sig Thing in TOP {}
sig CrimeInvestigation in TOP  { 
	InvolvesDetective: set Detective,
	InvolvesSuspect: set Suspect,
	InvolvesWitness: set Witness,
	IsLedBy: set LeadDetective} 
sig Detective in TOP  {} 
sig Interrogation in TOP  { 
	ConductedBy: set Detective,
	ContributesTo: set CrimeInvestigation,
	Questions: set Witness} 
sig JuniorDetective in TOP  {} 
sig LeadDetective in TOP  {} 
sig Person in TOP  {} 
sig SeniorDetective in TOP  {} 
sig Suspect in TOP  {} 
sig Witness in TOP  {} 
sig AbstractIndividual in TOP  {} 
sig AbstractIndividualType in TOP  {} 
sig AntiRigidType in TOP  {} 
sig Aspect in TOP  { 
	inheresIn: set ConcreteIndividual,
	isAspectProperPartOf: set Aspect,
	manifestedIn: set Event} 
sig Category in TOP  {} 
sig Collection in TOP  { 
	isSubCollectionOf: set Collection} 
sig ComparativeRelationshipType in TOP  {} 
sig ConcreteIndividual in TOP  { 
	constitutes: set ConcreteIndividual,
	hasBeginPoint: set Instant,
	hasBeginPointInXSDDate: set date,
	hasBeginPointInXSDDateTimeStamp: set dateTimeStamp,
	hasEndPoint: set Instant,
	hasEndPointInXSDDate: set date,
	hasEndPointInXSDDateTimeStamp: set dateTimeStamp,
	hasReifiedQualityValue: set QualityValue,
	historicallyDependsOn: set ConcreteIndividual} 
sig ConcreteIndividualType in TOP  {} 
sig Endurant in TOP  { 
	standsInQualifiedAttribution: set QualityValueAttributionSituation,
	standsInQualifiedConstitution: set TemporaryConstitutionSituation,
	standsInQualifiedInstantiation: set TemporaryInstantiationSituation,
	standsInQualifiedParthood: set TemporaryParthoodSituation,
	standsInQualifiedRelationship: set TemporaryRelationshipSituation,
	wasCreatedIn: set Event,
	wasTerminatedIn: set Event} 
sig EndurantType in TOP  { 
	hasAssociatedQualityValueType: set AbstractIndividualType} 
sig Event in TOP  { 
	broughtAbout: set Situation,
	isEventProperPartOf: set Event} 
sig EventType in TOP  {} 
sig ExtrinsicAspect in TOP  {} 
sig ExtrinsicMode in TOP  { 
	externallyDependsOn: set Endurant} 
sig FixedCollection in TOP  {} 
sig FunctionalComplex in TOP  {} 
sig Individual in TOP  {} 
sig IntrinsicAspect in TOP  {} 
sig IntrinsicMode in TOP  {} 
sig Kind in TOP  {} 
sig MaterialRelationshipType in TOP  {} 
sig Mixin in TOP  {} 
sig NonRigidType in TOP  {} 
sig NonSortal in TOP  {} 
sig Object in TOP  { 
	isCollectionMemberOf: set Collection,
	isComponentOf: set FunctionalComplex,
	isObjectProperPartOf: set Object,
	participatedIn: set Event} 
sig Participation in TOP  {} 
sig Phase in TOP  {} 
sig PhaseMixin in TOP  {} 
sig Quality in TOP  {} 
sig QualityValue in TOP  {
hasValueComponent: set TOP
} 
sig QualityValueAttributionSituation in TOP  { 
	concernsQualityType: set EndurantType,
	concernsReifiedQualityValue: set QualityValue} 
sig Quantity in TOP  { 
	isSubQuantityOf: set Quantity} 
sig RelationshipType in TOP  {} 
sig Relator in TOP  { 
	mediates: set Endurant} 
sig RigidType in TOP  {} 
sig Role in TOP  {} 
sig RoleMixin in TOP  {} 
sig SemiRigidType in TOP  {} 
sig Situation in TOP  { 
	contributedToTrigger: set Event,
	isSituationProperPartOf: set Situation} 
sig SituationType in TOP  {} 
sig Sortal in TOP  {} 
sig SubKind in TOP  {} 
sig TemporaryConstitutionSituation in TOP  { 
	concernsConstitutedEndurant: set Endurant} 
sig TemporaryInstantiationSituation in TOP  { 
	concernsNonRigidType: set NonRigidType} 
sig TemporaryParthoodSituation in TOP  { 
	concernsTemporaryWhole: set Endurant} 
sig TemporaryRelationshipSituation in TOP  { 
	concernsRelatedEndurant: set Endurant,
	concernsRelationshipType: set RelationshipType} 
sig Type in TOP  {} 
sig VariableCollection in TOP  {} 
sig Instant in TOP  {} 

// Class Axioms
//TBChecked
//fact { QualityValueAttributionSituation  in  (   { a : univ | #( a.(   concernsReifiedQualityValue :> QualityValue  ) ) = 1} + { a : univ | #( a.(   concernsQualityValue :> Literal ) ) = 1}  )  }
//fact { Relator  in  ( { a : univ | #( a.(   mediates :> Endurant ) ) => 2} )  } #this is needed
//
fact { AbstractIndividual  in  (  Individual )  }
fact { AbstractIndividual  in  ( ( univ - ConcreteIndividual )  )  }
fact { AbstractIndividualType  in  (  Type )  }
fact { AbstractIndividualType  in  ( ( univ - ConcreteIndividualType )  )  }
fact { AbstractIndividualType  in  ( ( univ - RelationshipType )  )  }
fact { AntiRigidType  in  (  NonRigidType )  }
fact { AntiRigidType  in  ( ( univ - SemiRigidType )  )  }
fact { Aspect  in  (  Endurant )  }
fact { Aspect  in  ( ( univ - Object )  )  }
fact { Aspect =   ExtrinsicAspect  +  IntrinsicAspect  }
fact { Category  in  (  NonSortal )  }
fact { Category  in  (  RigidType )  }
fact { Collection  in  (  Object )  }
fact { Collection  in  ( ( univ - FunctionalComplex )  )  }
fact { Collection  in  ( ( univ - Quantity )  )  } //added
fact { Collection =   FixedCollection  +  VariableCollection  }
fact { ComparativeRelationshipType  in  (  RelationshipType )  }
fact { ComparativeRelationshipType  in  ( ( univ - MaterialRelationshipType )  )  }
fact { ConcreteIndividual  in  (  Individual )  }
fact { ConcreteIndividual =   Endurant  +  Event  +  Situation  }
fact { ConcreteIndividualType  in  (  Type )  }
fact { ConcreteIndividualType  in  ( ( univ - RelationshipType )  )  }
fact { CrimeInvestigation  in  (   InvolvesDetective.Detective )  }
fact { CrimeInvestigation  in  (   InvolvesSuspect.Suspect )  }
fact { CrimeInvestigation  in  (  Relator )  }
fact { CrimeInvestigation  in  ( ( univ - Interrogation )  )  }
fact { CrimeInvestigation  in  ( { a : univ | #( a.(   IsLedBy :> LeadDetective ) ) = 1} )  }
fact { Detective  in  (  Person )  }
fact { Detective  in  ( ( ~ ConductedBy.Interrogation )  )  }
fact { Detective  in  ( ( ~ InvolvesDetective.CrimeInvestigation )  )  }
fact { Endurant  in  (  ConcreteIndividual )  }
fact { Endurant  in  ( ( univ - Event )  )  }
fact { Endurant  in  ( ( univ - Situation )  )  } //added
fact { Endurant =   Aspect  +  Object  }
fact { EndurantType  in  (  ConcreteIndividualType )  }
fact { EndurantType  in  ( ( univ - EventType )  )  }
fact { EndurantType  in  ( ( univ - SituationType )  )  }
fact { EndurantType =   NonRigidType  +  RigidType  }
fact { EndurantType =   NonSortal  +  Sortal  }
fact { Event  in  (  ConcreteIndividual )  }
fact { Event  in ( ( univ - Situation )  )  } //added
fact { EventType  in  (  ConcreteIndividualType )  }
fact { EventType  in  ( ( univ - SituationType )  )  }
fact { ExtrinsicAspect  in  (  Aspect )  }
fact { ExtrinsicAspect  in  ( ( univ - IntrinsicAspect )  )  }
fact { ExtrinsicAspect =   ExtrinsicMode  +  Relator  }
fact { ExtrinsicMode  in  (   externallyDependsOn.ConcreteIndividual )  }
fact { ExtrinsicMode  in  (  ExtrinsicAspect )  }
fact { ExtrinsicMode  in  ( ( univ - Relator )  )  }
fact { ExtrinsicMode  in  ( { a : univ | #( a.(   inheresIn :> ConcreteIndividual ) ) = 1} )  }
fact { FixedCollection  in  (  Collection )  }
fact { FixedCollection  in  ( ( univ - VariableCollection )  )  }
fact { FunctionalComplex  in  (  Object )  }
fact { FunctionalComplex  in  ( ( univ - Quantity )  )  } //added
fact { Individual  in  ( ( univ - Type )  )  }
fact { Individual =   AbstractIndividual  +  ConcreteIndividual  }
fact { Instant  in  (  AbstractIndividual )  }
fact { Interrogation  in  (  Relator )  }
fact { Interrogation  in  ( { a : univ | #( a.(   ConductedBy :> Detective ) ) = 1} )  }
fact { Interrogation  in  ( { a : univ | #( a.(   ContributesTo :> CrimeInvestigation ) ) = 1} )  }
fact { Interrogation  in  ( { a : univ | #( a.(   Questions :> Witness ) ) = 1} )  }
fact { IntrinsicAspect  in  (  Aspect )  }
fact { IntrinsicAspect  in  ( { a : univ | #( a.(   inheresIn :> ConcreteIndividual ) ) = 1} )  }
fact { IntrinsicAspect =   IntrinsicMode  +  Quality  }
fact { IntrinsicMode  in  (  IntrinsicAspect )  }
fact { IntrinsicMode  in  ( ( univ - Quality )  )  }
fact { JuniorDetective  in  (  Detective )  }
fact { Kind  in  (  RigidType )  }
fact { Kind  in  (  Sortal )  }
fact { Kind  in  ( ( univ - SubKind )  )  }
fact { LeadDetective  in  (  Detective )  }
fact { LeadDetective  in  ( ( ~ IsLedBy.CrimeInvestigation )  )  }
fact { MaterialRelationshipType  in  (  RelationshipType )  }
fact { Mixin  in  (  NonSortal )  }
fact { Mixin  in  (  SemiRigidType )  }
fact { NonRigidType  in  (  EndurantType )  }
fact { NonRigidType  in  ( ( univ - RigidType )  )  }
fact { NonRigidType =   AntiRigidType  +  SemiRigidType  }
fact { NonSortal  in  (  EndurantType )  }
fact { NonSortal  in  ( ( univ - Sortal )  )  }
fact { Object  in  (  Endurant )  }
fact { Participation  in  (  Event )  }
fact { Participation  in  ( ( ~ participatedIn.Object )  )  }
fact { Person  in  (  FunctionalComplex )  }
fact { Phase  in  (  AntiRigidType )  }
fact { Phase  in  (  Sortal )  }
fact { Phase  in  ( ( univ - Role )  )  }
fact { PhaseMixin  in  (  AntiRigidType )  }
fact { PhaseMixin  in  (  NonSortal )  }
fact { PhaseMixin  in  ( ( univ - RoleMixin )  )  }
fact { Quality  in  (  IntrinsicAspect )  }
fact { QualityValue  in  (  AbstractIndividual )  }
fact { QualityValueAttributionSituation  in  (  Situation )  }
fact { QualityValueAttributionSituation  in  ( ( ~ standsInQualifiedAttribution.Endurant )  )  }
fact { QualityValueAttributionSituation  in  ( ( univ - TemporaryConstitutionSituation )  )  }
fact { QualityValueAttributionSituation  in  ( ( univ - TemporaryInstantiationSituation )  )  }
fact { QualityValueAttributionSituation  in  ( ( univ - TemporaryParthoodSituation )  )  }
fact { QualityValueAttributionSituation  in  ( ( univ - TemporaryRelationshipSituation )  )  }
fact { QualityValueAttributionSituation  in  ( { a : univ | #( a.(   concernsQualityType :> EndurantType ) ) = 1} )  }
fact { Quantity  in  (  Object )  }
fact { RelationshipType  in  (  Type )  }
fact { Relator  in  (  ExtrinsicAspect )  }
fact { RigidType  in  (  EndurantType )  }
fact { Role  in  (  AntiRigidType )  }
fact { Role  in  (  Sortal )  }
fact { RoleMixin  in  (  AntiRigidType )  }
fact { RoleMixin  in  (  NonSortal )  }
fact { SemiRigidType  in  (  NonRigidType )  }
fact { SeniorDetective  in  (  Detective )  }
fact { Situation  in  (  ConcreteIndividual )  }
fact { SituationType  in  (  ConcreteIndividualType )  }
fact { Sortal  in  (  EndurantType )  }
fact { SubKind  in  (  RigidType )  }
fact { SubKind  in  (  Sortal )  }
fact { Suspect  in  (  Person )  }
fact { Suspect  in  ( ( ~ InvolvesSuspect.CrimeInvestigation )  )  }
fact { TemporaryConstitutionSituation  in  (  Situation )  }
fact { TemporaryConstitutionSituation  in  ( ( ~ standsInQualifiedConstitution.Object )  )  }
fact { TemporaryConstitutionSituation  in  ( ( univ - TemporaryInstantiationSituation )  )  }
fact { TemporaryConstitutionSituation  in  ( ( univ - TemporaryRelationshipSituation )  )  }
fact { TemporaryConstitutionSituation  in  ( { a : univ | #( a.(   concernsConstitutedEndurant :> Object ) ) = 1} )  }
fact { TemporaryInstantiationSituation  in  (  Situation )  }
fact { TemporaryInstantiationSituation  in  ( ( ~ standsInQualifiedInstantiation.Endurant )  )  }
fact { TemporaryInstantiationSituation  in  ( ( univ - TemporaryParthoodSituation )  )  }
fact { TemporaryInstantiationSituation  in  ( ( univ - TemporaryRelationshipSituation )  )  }
fact { TemporaryInstantiationSituation  in  ( { a : univ | #( a.(   concernsNonRigidType :> NonRigidType ) ) = 1} )  }
fact { TemporaryParthoodSituation  in  (  Situation )  }
fact { TemporaryParthoodSituation  in  ( ( ~ standsInQualifiedParthood.Endurant )  )  }
fact { TemporaryParthoodSituation  in  ( ( univ - TemporaryRelationshipSituation )  )  }
fact { TemporaryParthoodSituation  in  ( { a : univ | #( a.(   concernsTemporaryWhole :> Endurant ) ) = 1} )  }
fact { TemporaryRelationshipSituation  in  (   concernsRelatedEndurant.Endurant )  }
fact { TemporaryRelationshipSituation  in  (  Situation )  }
fact { TemporaryRelationshipSituation  in  ( ( ~ standsInQualifiedRelationship.Endurant )  )  }
fact { TemporaryRelationshipSituation  in  ( { a : univ | #( a.(   concernsRelationshipType :> RelationshipType ) ) = 1} )  }
fact { VariableCollection  in  (  Collection )  }
fact { Witness  in  (  Person )  }
fact { Witness  in  ( ( ~ InvolvesWitness.CrimeInvestigation )  )  }
fact { Witness  in  ( ( ~ Questions.Interrogation )  )  }

//Property axioms
//problems
//fact {  hasBeginPointInXSDDate.TOP  in  (  ConcreteIndividual )  }
//fact {  hasBeginPointInXSDDateTimeStamp.TOP  in  (  ConcreteIndividual )  }
//fact {  hasEndPointInXSDDate.TOP  in  (  ConcreteIndividual )  }
//fact {  hasEndPointInXSDDateTimeStamp.TOP  in  (  ConcreteIndividual )  }
//fact { TOP  in  ( ( univ - externallyDependsOn )  )  }
//fact { TOP  in  ( ( univ - inheresIn )  )  }
//fact { TOP  in  ( ( univ - mediates )  )  }
//
//fact { Questions  in  (  mediates )  }
//
//fact { standsInQualifiedAttribution  in  (  standsIn )  }
//fact { standsInQualifiedConstitution  in  (  standsIn )  }
//fact { standsInQualifiedInstantiation  in  (  standsIn )  }
//fact { standsInQualifiedParthood  in  (  standsIn )  }
//fact { standsInQualifiedRelationship  in  (  standsIn )  }
//
//fact { TOP  in  (  ( univ - (   broughtAbout.( univ - Situation ) ) )  )  }
fact { TOP  in  (  ( univ - (   categorizes.( univ - Type ) ) )  )  }
//fact { TOP  in  (  ( univ - (   concernsConstitutedEndurant.( univ - Endurant ) ) )  )  }
//fact { TOP  in  (  ( univ - (   concernsNonRigidType.( univ - NonRigidType ) ) )  )  }
//fact { TOP  in  (  ( univ - (   concernsQualityType.( univ - EndurantType ) ) )  )  }
//fact { TOP  in  (  ( univ - (   concernsReifiedQualityValue.( univ - QualityValue ) ) )  )  }
//fact { TOP  in  (  ( univ - (   concernsRelatedEndurant.( univ - Endurant ) ) )  )  }
//fact { TOP  in  (  ( univ - (   concernsRelationshipType.( univ - RelationshipType ) ) )  )  }
//fact { TOP  in  (  ( univ - (   concernsTemporaryWhole.( univ - Endurant ) ) )  )  }
//fact { TOP  in  (  ( univ - (   ConductedBy.( univ - Detective ) ) )  )  }
//fact { TOP  in  (  ( univ - (   constitutes.( univ - ConcreteIndividual ) ) )  )  }
//fact { TOP  in  (  ( univ - (   contributedToTrigger.( univ - Event ) ) )  )  }
//fact { TOP  in  (  ( univ - (   ContributesTo.( univ - CrimeInvestigation ) ) )  )  }
//fact { TOP  in  (  ( univ - (   externallyDependsOn.( univ - Endurant ) ) )  )  }
//fact { TOP  in  (  ( univ - (   hasAssociatedQualityValueType.( univ - AbstractIndividualType ) ) )  )  }
//fact { TOP  in  (  ( univ - (   hasBeginPoint.( univ - Instant ) ) )  )  }
//fact { TOP  in  (  ( univ - (   hasBeginPointInXSDDate.( univ - date ) ) )  )  }
//fact { TOP  in  (  ( univ - (   hasBeginPointInXSDDateTimeStamp.( univ - dateTimeStamp ) ) )  )  }
//fact { TOP  in  (  ( univ - (   hasEndPoint.( univ - Instant ) ) )  )  }
//fact { TOP  in  (  ( univ - (   hasEndPointInXSDDate.( univ - date ) ) )  )  }
//fact { TOP  in  (  ( univ - (   hasEndPointInXSDDateTimeStamp.( univ - dateTimeStamp ) ) )  )  }
//fact { TOP  in  (  ( univ - (   hasReifiedQualityValue.( univ - QualityValue ) ) )  )  }
//fact { TOP  in  (  ( univ - (   historicallyDependsOn.( univ - ConcreteIndividual ) ) )  )  }
//fact { TOP  in  (  ( univ - (   inheresIn.( univ - ConcreteIndividual ) ) )  )  }
//fact { TOP  in  (  ( univ - (   InvolvesDetective.( univ - Detective ) ) )  )  }
//fact { TOP  in  (  ( univ - (   InvolvesSuspect.( univ - Suspect ) ) )  )  }
//fact { TOP  in  (  ( univ - (   InvolvesWitness.( univ - Witness ) ) )  )  }
//fact { TOP  in  (  ( univ - (   isAspectProperPartOf.( univ - Aspect ) ) )  )  }
//fact { TOP  in  (  ( univ - (   isCollectionMemberOf.( univ - Collection ) ) )  )  }
//fact { TOP  in  (  ( univ - (   isComponentOf.( univ - FunctionalComplex ) ) )  )  }
fact { TOP  in  (  ( univ - (   isDerivedFrom.( univ - EndurantType ) ) )  )  }
fact { isDerivedFrom.TOP in ( ComparativeRelationshipType + MaterialRelationshipType ) }
//fact { TOP  in  (  ( univ - (   isEventProperPartOf.( univ - Event ) ) )  )  }
//fact { TOP  in  (  ( univ - (   IsLedBy.( univ - LeadDetective ) ) )  )  }
//fact { TOP  in  (  ( univ - (   isObjectProperPartOf.( univ - Object ) ) )  )  }
//fact { TOP  in  (  ( univ - (   isProperPartOf.( univ - TOP ) ) )  )  }
//fact { TOP  in  (  ( univ - (   isSituationProperPartOf.( univ - Situation ) ) )  )  }
//fact { TOP  in  (  ( univ - (   isSubCollectionOf.( univ - Collection ) ) )  )  }
//fact { TOP  in  (  ( univ - (   isSubQuantityOf.( univ - Quantity ) ) )  )  }
//fact { TOP  in  (  ( univ - (   manifestedIn.( univ - Event ) ) )  )  }
//fact { TOP  in  (  ( univ - (   mediates.( univ - Endurant ) ) )  )  }
//fact { TOP  in  (  ( univ - (   participatedIn.( univ - Event ) ) )  )  }
//fact { TOP  in  (  ( univ - (   Questions.( univ - Witness ) ) )  )  } //check sig definition
//fact { TOP  in  (  ( univ - (   standsIn.( univ - Situation ) ) )  )  }
//fact { TOP  in  (  ( univ - (   standsInQualifiedAttribution.( univ - QualityValueAttributionSituation ) ) )  )  }
//fact { TOP  in  (  ( univ - (   standsInQualifiedConstitution.( univ - TemporaryConstitutionSituation ) ) )  )  }
//fact { TOP  in  (  ( univ - (   standsInQualifiedInstantiation.( univ - TemporaryInstantiationSituation ) ) )  )  }
//fact { TOP  in  (  ( univ - (   standsInQualifiedParthood.( univ - TemporaryParthoodSituation ) ) )  )  }
//fact { TOP  in  (  ( univ - (   standsInQualifiedRelationship.( univ - TemporaryRelationshipSituation ) ) )  )  }
//fact { TOP  in  (  ( univ - (   wasCreatedIn.( univ - Event ) ) )  )  }
//fact { TOP  in  (  ( univ - (   wasTerminatedIn.( univ - Event ) ) )  )  }
//fact { TOP  in  ( { a : univ | #( a.(   concernsNonRigidType ) ) =< 1} )  }
//fact { TOP  in  ( { a : univ | #( a.(   concernsQualityType ) ) =< 1} )  }
//fact { TOP  in  ( { a : univ | #( a.(   concernsReifiedQualityValue ) ) =< 1} )  }
//fact { TOP  in  ( { a : univ | #( a.(   concernsRelatedEndurant ) ) =< 1} )  }
//fact { TOP  in  ( { a : univ | #( a.(   concernsRelationshipType ) ) =< 1} )  }
//fact { TOP  in  ( { a : univ | #( a.(   concernsTemporaryWhole ) ) =< 1} )  }
//fact { TOP  in  ( { a : univ | #( a.(   hasBeginPointInXSDDate ) ) =< 1} )  }
//fact { TOP  in  ( { a : univ | #( a.(   hasBeginPointInXSDDateTimeStamp ) ) =< 1} )  }
//fact { TOP  in  ( { a : univ | #( a.(   hasEndPointInXSDDate ) ) =< 1} )  }
//fact { TOP  in  ( { a : univ | #( a.(   hasEndPointInXSDDateTimeStamp ) ) =< 1} )  }
//fact { TOP  in  ( { a : univ | #( a.(   inheresIn ) ) =< 1} )  }
//
//fact {  standsIn.TOP  in  (  TOP )  }
//fact {  standsInQualifiedAttribution.TOP  in  (  Endurant )  }
//fact {  standsInQualifiedConstitution.TOP  in  (  Endurant )  }
//fact {  standsInQualifiedInstantiation.TOP  in  (  Endurant )  }
//fact {  standsInQualifiedParthood.TOP  in  (  Endurant )  }
//fact {  standsInQualifiedRelationship.TOP  in  (  Endurant )  }
//fact {  wasCreatedIn.TOP  in  (  Endurant )  }
//fact {  wasTerminatedIn.TOP  in  (  Endurant )  }
//
//fact {  broughtAbout.TOP  in  (  Event )  }
fact {  categorizes.TOP  in  (    Type  & ( univ - AbstractIndividualType )  & ( univ - ConcreteIndividualType )   )  }
//fact {  concernsConstitutedEndurant.TOP  in  (  TemporaryConstitutionSituation )  }
//fact {  concernsNonRigidType.TOP  in  (  TemporaryInstantiationSituation )  }
//fact {  concernsQualityType.TOP  in  (  QualityValueAttributionSituation )  }
//fact {  concernsQualityValue.TOP  in  (  QualityValueAttributionSituation )  }
//fact {  concernsReifiedQualityValue.TOP  in  (  QualityValueAttributionSituation )  }
//fact {  concernsRelatedEndurant.TOP  in  (  TemporaryRelationshipSituation )  }
//fact {  concernsRelationshipType.TOP  in  (  TemporaryRelationshipSituation )  }
//fact {  concernsTemporaryWhole.TOP  in  (  TemporaryParthoodSituation )  }
//fact {  ConductedBy.TOP  in  (  Interrogation )  }
//fact {  constitutes.TOP  in  (  ConcreteIndividual )  }
//fact {  contributedToTrigger.TOP  in  (  Situation )  }
//fact {  ContributesTo.TOP  in  (  Interrogation )  }
//fact {  externallyDependsOn.TOP  in  (  ExtrinsicMode )  }
//fact {  hasAssociatedQualityValueType.TOP  in  (  EndurantType )  }
//fact {  hasBeginPoint.TOP  in  (  ConcreteIndividual )  }
//fact {  hasEndPoint.TOP  in  (  ConcreteIndividual )  }
//fact {  hasQualityValue.TOP  in  (  ConcreteIndividual )  }
//fact {  hasReifiedQualityValue.TOP  in  (  ConcreteIndividual )  }
//fact {  hasValueComponent.TOP  in  (  QualityValue )  }
//fact {  historicallyDependsOn.TOP  in  (  ConcreteIndividual )  }
//fact {  inheresIn.TOP  in  (  Aspect )  }
//fact {  InvolvesDetective.TOP  in  (  CrimeInvestigation )  }
//fact {  InvolvesSuspect.TOP  in  (  CrimeInvestigation )  }
//fact {  InvolvesWitness.TOP  in  (  CrimeInvestigation )  }
//fact {  isAspectProperPartOf.TOP  in  (  Aspect )  }
//fact {  isCollectionMemberOf.TOP  in  (  Object )  }
//fact {  isComponentOf.TOP  in  (  Object )  }
//fact {  isDerivedFrom.TOP  in  (    ComparativeRelationshipType  +  MaterialRelationshipType  )  }
//fact {  isEventProperPartOf.TOP  in  (  Event )  }
//fact {  IsLedBy.TOP  in  (  CrimeInvestigation )  }
//fact {  isObjectProperPartOf.TOP  in  (  Object )  }
//fact {  isProperPartOf.TOP  in  (  TOP )  }
//fact {  isSituationProperPartOf.TOP  in  (  Situation )  }
//fact {  isSubCollectionOf.TOP  in  (  Collection )  }
//fact {  isSubQuantityOf.TOP  in  (  Quantity )  }
//fact {  manifestedIn.TOP  in  (  Aspect )  }
//fact {  mediates.TOP  in  (  Relator )  }
//fact {  participatedIn.TOP  in  (  Object )  }
fact {  partitions.TOP  in  (    Type  & ( univ - AbstractIndividualType )  & ( univ - ConcreteIndividualType )   )  }
//fact {  Questions.TOP  in  (  Interrogation )  }
//
//fact { ConductedBy  in  (  mediates )  }
//fact { ContributesTo  in  (  mediates )  }
//fact { InvolvesDetective  in  (  mediates )  }
//fact { InvolvesSuspect  in  (  mediates )  }
//fact { InvolvesWitness  in  (  mediates )  }
//fact { IsLedBy  in  (  mediates )  }
//fact { partitions  in  (  categorizes )  }
//
//fact { isAspectProperPartOf  in  (  isProperPartOf )  }
//fact { isCollectionMemberOf  in  (  isObjectProperPartOf )  }
//fact { isComponentOf  in  (  isObjectProperPartOf )  }
//fact { isEventProperPartOf  in  (  isProperPartOf )  }
//fact { isObjectProperPartOf  in  (  isProperPartOf )  }
//fact { isSituationProperPartOf  in  (  isProperPartOf )  }
//fact { isSubCollectionOf  in  (  isObjectProperPartOf )  }
//fact { isSubQuantityOf  in  (  isObjectProperPartOf )  }

// Predicates

// OWL Individual , Thing , Nothing definitions ( Individual may be removed if already defined )
//sig Individual {} 
//sig Thing in Individual {} 
//sig Nothing {} 

// XSD Primitive DataTypes

// sig string {}
// sig boolean {}
// sig decimal {}
// sig float {}
// sig double {}
// sig duration {}
//sig dateTime {}
//sig time {}
sig date {}
//sig gYearMonth {}
//sig gYear {}
//sig gMonthDay {}
//sig gDay {}
//sig gMonth {}
//sig hexBinary {}
//sig base64Binary {}
//sig anyURI {}
//sig QName {} 
//sig NOTATION {}

// XSD other BuiltIn DataTypes
//sig normalizedString {}
//sig token {}
//sig language {}
//sig NMTOKEN {}
//sig NMTOKENS {}
//sig Name {}
//sig NCName {}
//sig ID {}
//sig IDREF {}
//sig IDREFS {}
//sig ENTITY {}
//sig ENTITIES {}
//sig integer {}
//sig nonPositiveInteger {}
//sig negativeInteger {}
//sig long {}
// sig int {} // Reserved word
//sig short {}
//sig byte {}
//sig nonNegativeInteger {}
//sig unsignedLong {}
//sig unsignedInt {}
//sig unsignedShort {}
//sig unsignedByte {}
//sig positiveInteger {}
//sig yearMonthDuration {}
sig dayTimeDuration {}
sig dateTimeStamp {}

// RelOver 
//fact { all x:Interrogation | no x.ConductedBy & x.Questions }
//fact { all x:CrimeInvestigation | no x.InvolvesDetective & x.InvolvesSuspect }
//fact { all x:CrimeInvestigation | no x.InvolvesDetective & x.InvolvesWitness }
//fact { all x:CrimeInvestigation | no x.InvolvesSuspect & x.InvolvesWitness }

// ImpAbs
//fact { LeadDetective in SeniorDetective }

// RelSpec
//fact { IsLedBy in InvolvesDetective }

// AssCyc
//fact { all x:Interrogation | x.Questions = x.ContributesTo.InvolvesWitness }
//fact { x:Interrogation | x.ConductedBy = x.ContributesTo.InvolvesDetective }

run {
	// Always add the facts below
	// Why? Empty snapshots are not interesting for validation
	#TOP > 0
	// Why? Snaptshots with only abstracts (e.g. dates) are usually not  not interesting for validation
	#ConcreteIndividual > 0

	// Add the facts below depending on the elements used in the model. 
	// If there is no <<type>> in the OntoUML model (or instance of gufo:Type)
	#Type = 0
	// If there is no <<event>> in the OntoUML model (or subclass of gufo:Event)
	#Event = 0
	// If there is no <<situation>> in the OntoUML model (or subclass of gufo:Situation)
	#Situation = 0
		
	// Add this expression to prevent the generation of instances that are not related to the domain ontology
	TOP = Person + Detective + SeniorDetective + JuniorDetective + LeadDetective + Interrogation + CrimeInvestigation + Witness + Suspect
	
	// For each object property defined in gufo that we extend in our ontology, we add an expression making its extension equal to the union of the extensions of its subsetting properties
	mediates = ConductedBy + ContributesTo + InvolvesDetective + InvolvesSuspect + InvolvesWitness + IsLedBy + Questions

	// For each object property defined in gufo but not extended by our ontology, we add and expression forbidding their occurence
	#broughtAbout=0
	#categorizes=0
	#constitutes=0	
	#contributedToTrigger=0
	#hasReifiedQualityValue=0
	#historicallyDependsOn=0
	#inheresIn=0
	#isProperPartOf=0
	#manifestedIn=0
	#participatedIn=0
	#externallyDependsOn=0
	
	// We are not interested in timepoints for now
	#hasEndPoint=0
	#hasBeginPoint=0
	#date=0
	#dayTimeDuration=0
	#dateTimeStamp=0
	
	// In this model, we are analyzing the possible ways in which a Criminal Investigation can take place.
	// Thus, the all snapshots should have at least 1. In fact, we should generate all possible scenarios in which there is a single investigation.
	#CrimeInvestigation>0

	// We don't want "disconnected" individuals in our snapshots, so I'm adding the rule below:
	Person = Detective + Witness + Suspect

	// We are going to need to change the population size to create more interesting scenarios:
	//#Person=1, #Person=2, ...
	//#Person>0
	//#Interrogation>0
	
	//#Relator < #Object
	// We should go up to 7 instances. Besides that it becomes too complex. Let's assume the small scope hypothesis as well.
	
	//FIXME: Add GS {disjoint, complete} to the original ontology, I "faked it" with the lines below:
 	Detective = JuniorDetective + SeniorDetective
	disj[JuniorDetective,SeniorDetective] 

	//FIXME:
	// fact {all a:CrimeInvestigation | a.ContributesTo in a.mediates} 
	// this fact does not always work. Please replace it with:
	// fact {all a:TOP | a.ContributesTo in a.mediates} 
} for 7




