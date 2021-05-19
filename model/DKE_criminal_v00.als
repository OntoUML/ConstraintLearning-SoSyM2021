module CriminalInvestigationModel

abstract sig Endurant {}
abstract sig Object extends Endurant {}
abstract sig Relator extends Endurant { 
	mediates: some Endurant
} {
	all r: Relator | #r.@mediates>=2
}

sig Person extends Object {} 
sig Detective in Person {}{
	all d: Detective | some InvolvesDetective.d
} 
sig JuniorDetective in Detective {
	TeamsUp: some JuniorDetective //added
} {
	all r: JuniorDetective | one Manages.r
}

sig SeniorDetective in Detective {
	Manages: some JuniorDetective //added
} {
	all r: SeniorDetective | #r.@Manages>=2
}

sig LeadDetective in Detective {}{
	all d: LeadDetective | one IsLedBy.d //added
} 
sig Superintendent in LeadDetective + SeniorDetective {} //added
sig Suspect in Person {}{
	all s: Suspect | some InvolvesSuspect.s
} 
sig Witness in Person {}{
	all w: Witness | some InvolvesWitness.w
	all w: Witness | some Questions.w
} 
sig CriminalInvestigation extends Relator { 
	InvolvesDetective: some Detective,
	InvolvesSuspect: some Suspect,
	InvolvesWitness: set Witness,
	IsLedBy: one LeadDetective
} 
sig Interrogation extends Relator { 
	ConductedBy: one Detective,
	ContributesTo: one CriminalInvestigation,
	Questions: one Witness
} 

fact {
	Detective = JuniorDetective + SeniorDetective
	disj[JuniorDetective,SeniorDetective]
	Questions in mediates
	ContributesTo in mediates
	ConductedBy in mediates
	InvolvesWitness in mediates
	InvolvesDetective in mediates
	InvolvesSuspect in mediates
	IsLedBy in mediates
}

fact {
	~mediates & mediates in iden
	no iden & mediates
	mediates = ConductedBy + ContributesTo + InvolvesDetective + InvolvesSuspect + InvolvesWitness + IsLedBy + Questions
}

run { 
#Interrogation=2
#CriminalInvestigation=2
//#JuniorDetective=2
//#SeniorDetective>0
} for 10


// RelOver 
fact { all x:Interrogation | no x.ConductedBy & x.Questions }
fact { all x:CriminalInvestigation | no x.InvolvesDetective & x.InvolvesSuspect }
fact { all x:CriminalInvestigation | no x.InvolvesDetective & x.InvolvesWitness }
fact { all x:CriminalInvestigation | no x.InvolvesSuspect & x.InvolvesWitness }

// Pseudo_ImpAbs
fact { LeadDetective in SeniorDetective }

// RelSpec
fact { IsLedBy in InvolvesDetective }

// AssCyc
fact { all x:Interrogation | x.Questions = x.ContributesTo.InvolvesWitness }
fact { all x:Interrogation | x.ConductedBy = x.ContributesTo.IsLedBy }

// DecInt
fact { SeniorDetective & LeadDetective in Superintendent }
//fact { no LeadDetective & SeniorDetective }
//fact { SeniorDetective in Superintendent }
//fact { no LeadDetective & JuniorDetective }

// BinOver
fact { ~TeamsUp in TeamsUp }
fact { no iden & TeamsUp }
//fact { no iden & TeamsUp} // IrreflexiveProperty 
//fact { ~TeamsUp  in TeamsUp} // SymmetricProperty 
//fact { ~TeamsUp  & TeamsUp in iden} // AsymmetricProperty 
//fact { all x: JuniorDetective | not(x in x.TeamsUp) }
//fact { all x: JuniorDetective | x in x.TeamsUp implies not(x in JuniorDetective) }
//teamsup(A, B) :- teamsup(B,A), \+teamsup(A,A)
//teamsup(A, B) :- teamsup(B,A) : THIS 
//teamsup(A, B) :- \+teamsup(A,A)
//not_teamsup(A, B) :- teamsup(A,A) : THIS
//fact { all x: JuniorDetective, y: JuniorDetective | y in x.TeamsUp implies x in y.TeamsUp } //these can be learned
//fact { all x: JuniorDetective, y: JuniorDetective | y in y.TeamsUp implies not(x in y.TeamsUp) } //these can be learned
//check { 
//~TeamsUp in TeamsUp // SymmetricProperty 
//no iden & TeamsUp //Irreflexive
//} for 20

// RelComp
fact { all x: JuniorDetective, y: JuniorDetective, z: SeniorDetective | y in x.TeamsUp implies x in z.Manages implies y in z.Manages }
//fact { all x: JuniorDetective, y: JuniorDetective, z: SeniorDetective | y in x.TeamsUp implies x in z.Manages implies not(y in z.Manages) }
