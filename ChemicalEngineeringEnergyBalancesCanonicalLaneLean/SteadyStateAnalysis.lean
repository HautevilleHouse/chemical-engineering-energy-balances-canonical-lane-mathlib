import chemicalEngineeringEnergyBalancesCanonicalLaneLean.EnergyBalanceEquations

/-!
# Steady-State Analysis Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure SteadyStatePackage {S : ThermodynamicStatePackage}
    {K : ReactionKineticsPackage S} (B : EnergyBalancePackage K) where
  accumulationZero : Prop
  spatialProfileEquation : Prop
  boundaryConditions : Prop
  numericalSolvability : Prop

structure SteadyStateEvidence {S : ThermodynamicStatePackage}
    {K : ReactionKineticsPackage S} {B : EnergyBalancePackage K}
    (St : SteadyStatePackage B) where
  accumulationZeroClosed : St.accumulationZero
  spatialProfileEquationClosed : St.spatialProfileEquation
  boundaryConditionsClosed : St.boundaryConditions
  numericalSolvabilityClosed : St.numericalSolvability

def SteadyStateClosed {S : ThermodynamicStatePackage}
    {K : ReactionKineticsPackage S} {B : EnergyBalancePackage K}
    (St : SteadyStatePackage B) : Prop :=
  St.accumulationZero ∧ St.spatialProfileEquation ∧ St.boundaryConditions ∧ St.numericalSolvability

theorem steady_state_closed_from_evidence
    {S : ThermodynamicStatePackage} {K : ReactionKineticsPackage S}
    {B : EnergyBalancePackage K} (St : SteadyStatePackage B)
    (E : SteadyStateEvidence St) : SteadyStateClosed St := by
  exact And.intro E.accumulationZeroClosed
    (And.intro E.spatialProfileEquationClosed
      (And.intro E.boundaryConditionsClosed E.numericalSolvabilityClosed))

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse