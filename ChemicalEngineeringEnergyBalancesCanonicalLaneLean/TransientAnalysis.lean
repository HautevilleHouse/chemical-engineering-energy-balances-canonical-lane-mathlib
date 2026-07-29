import chemicalEngineeringEnergyBalancesCanonicalLaneLean.SteadyStateAnalysis

/-!
# Transient Analysis Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure TransientPackage {S : ThermodynamicStatePackage}
    {K : ReactionKineticsPackage S} {B : EnergyBalancePackage K}
    (St : SteadyStatePackage B) where
  timeDependentAccumulation : Prop
  transientBoundaryConditions : Prop
  stabilityCondition : Prop
  approachToSteadyState : Prop

structure TransientEvidence {S : ThermodynamicStatePackage}
    {K : ReactionKineticsPackage S} {B : EnergyBalancePackage K}
    {St : SteadyStatePackage B} (T : TransientPackage St) where
  timeDependentAccumulationClosed : T.timeDependentAccumulation
  transientBoundaryConditionsClosed : T.transientBoundaryConditions
  stabilityConditionClosed : T.stabilityCondition
  approachToSteadyStateClosed : T.approachToSteadyState

def TransientClosed {S : ThermodynamicStatePackage}
    {K : ReactionKineticsPackage S} {B : EnergyBalancePackage K}
    {St : SteadyStatePackage B} (T : TransientPackage St) : Prop :=
  T.timeDependentAccumulation ∧ T.transientBoundaryConditions ∧ T.stabilityCondition ∧ T.approachToSteadyState

theorem transient_closed_from_evidence
    {S : ThermodynamicStatePackage} {K : ReactionKineticsPackage S}
    {B : EnergyBalancePackage K} {St : SteadyStatePackage B}
    (T : TransientPackage St) (E : TransientEvidence T) : TransientClosed T := by
  exact And.intro E.timeDependentAccumulationClosed
    (And.intro E.transientBoundaryConditionsClosed
      (And.intro E.stabilityConditionClosed E.approachToSteadyStateClosed))

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse