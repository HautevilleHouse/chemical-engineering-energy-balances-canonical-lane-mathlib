import ChemicalEngineeringEnergyBalancesCanonicalLaneLean.ThermodynamicsPackage

/-!
# Energy Balance Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure EnergyBalancePackage {G : RiemannianCurvaturePackage}
    {K : ReactionKineticsPackage G} {T : ThermodynamicsPackage K} where
  accumulation : Prop
  convection : Prop
  conduction : Prop
  reactionHeat : Prop
  workTerm : Prop

structure EnergyBalanceEvidence {G : RiemannianCurvaturePackage}
    {K : ReactionKineticsPackage G} {T : ThermodynamicsPackage K}
    (E : EnergyBalancePackage K T) where
  accumulationClosed : E.accumulation
  convectionClosed : E.convection
  conductionClosed : E.conduction
  reactionHeatClosed : E.reactionHeat
  workTermClosed : E.workTerm

def EnergyBalanceClosed {G : RiemannianCurvaturePackage}
    {K : ReactionKineticsPackage G} {T : ThermodynamicsPackage K}
    (E : EnergyBalancePackage K T) : Prop :=
  E.accumulation ∧ E.convection ∧ E.conduction ∧ E.reactionHeat ∧ E.workTerm

theorem energy_balance_closed_from_evidence
    {G : RiemannianCurvaturePackage} {K : ReactionKineticsPackage G}
    {T : ThermodynamicsPackage K} (E : EnergyBalancePackage K T)
    (Ev : EnergyBalanceEvidence E) : EnergyBalanceClosed E := by
  exact And.intro Ev.accumulationClosed
    (And.intro Ev.convectionClosed
      (And.intro Ev.conductionClosed
        (And.intro Ev.reactionHeatClosed Ev.workTermClosed)))

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse
