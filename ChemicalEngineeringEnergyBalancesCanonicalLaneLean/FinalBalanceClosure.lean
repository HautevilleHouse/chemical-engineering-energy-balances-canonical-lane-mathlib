import ChemicalEngineeringEnergyBalancesCanonicalLaneLean.EnergyBalancePackage

/-!
# Final Balance Closure
-/

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure FinalBalanceClosurePackage {G : RiemannianCurvaturePackage}
    {K : ReactionKineticsPackage G} {T : ThermodynamicsPackage K}
    (E : EnergyBalancePackage K T) where
  closureCondition : Prop
  closureConditionClosed : closureCondition

def FinalBalanceClosure {G : RiemannianCurvaturePackage}
    {K : ReactionKineticsPackage G} {T : ThermodynamicsPackage K}
    (E : EnergyBalancePackage K T) : Prop :=
  E.accumulation ∧ E.convection ∧ E.conduction ∧ E.reactionHeat ∧ E.workTerm ∧ True

theorem final_balance_closure_from_package
    {G : RiemannianCurvaturePackage} {K : ReactionKineticsPackage G}
    {T : ThermodynamicsPackage K} (E : EnergyBalancePackage K T)
    (Ev : EnergyBalanceEvidence E) : FinalBalanceClosure E := by
  exact And.intro (energy_balance_closed_from_evidence E Ev) True.intro

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse
