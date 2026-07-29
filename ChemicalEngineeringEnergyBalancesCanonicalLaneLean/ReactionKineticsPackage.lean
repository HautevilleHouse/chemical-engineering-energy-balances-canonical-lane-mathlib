import ChemicalEngineeringEnergyBalancesCanonicalLaneLean.RiemannianCurvature

/-!
# Reaction Kinetics Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure ReactionKineticsPackage (G : RiemannianCurvaturePackage) where
  reactionRate : Type u
  rateConstant : Type v
  activationEnergy : Prop
  arrheniusLaw : Prop
  reactionOrder : Prop

structure ReactionKineticsEvidence {G : RiemannianCurvaturePackage}
    (K : ReactionKineticsPackage G) where
  activationEnergyClosed : K.activationEnergy
  arrheniusLawClosed : K.arrheniusLaw
  reactionOrderClosed : K.reactionOrder

def ReactionKineticsClosed {G : RiemannianCurvaturePackage}
    (K : ReactionKineticsPackage G) : Prop :=
  K.activationEnergy ∧ K.arrheniusLaw ∧ K.reactionOrder

theorem reaction_kinetics_closed_from_evidence
    {G : RiemannianCurvaturePackage} (K : ReactionKineticsPackage G)
    (E : ReactionKineticsEvidence K) : ReactionKineticsClosed K := by
  exact And.intro E.activationEnergyClosed
    (And.intro E.arrheniusLawClosed E.reactionOrderClosed)

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse
