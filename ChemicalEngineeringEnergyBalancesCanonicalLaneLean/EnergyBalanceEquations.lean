import chemicalEngineeringEnergyBalancesCanonicalLaneLean.ReactionKinetics

/-!
# Energy Balance Equations Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure EnergyBalancePackage {S : ThermodynamicStatePackage}
    (K : ReactionKineticsPackage S) where
  conductionTerm : Prop
  convectionTerm : Prop
  reactionHeatTerm : Prop
  accumulationTerm : Prop
  totalBalanceEquation : Prop

structure EnergyBalanceEvidence {S : ThermodynamicStatePackage}
    {K : ReactionKineticsPackage S} (B : EnergyBalancePackage K) where
  conductionTermClosed : B.conductionTerm
  convectionTermClosed : B.convectionTerm
  reactionHeatTermClosed : B.reactionHeatTerm
  accumulationTermClosed : B.accumulationTerm
  totalBalanceEquationClosed : B.totalBalanceEquation

def EnergyBalanceClosed {S : ThermodynamicStatePackage}
    {K : ReactionKineticsPackage S} (B : EnergyBalancePackage K) : Prop :=
  B.conductionTerm ∧ B.convectionTerm ∧ B.reactionHeatTerm ∧ B.accumulationTerm ∧ B.totalBalanceEquation

theorem energy_balance_closed_from_evidence
    {S : ThermodynamicStatePackage} {K : ReactionKineticsPackage S}
    (B : EnergyBalancePackage K) (E : EnergyBalanceEvidence B) :
    EnergyBalanceClosed B := by
  exact And.intro E.conductionTermClosed
    (And.intro E.convectionTermClosed
      (And.intro E.reactionHeatTermClosed
        (And.intro E.accumulationTermClosed E.totalBalanceEquationClosed)))

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse