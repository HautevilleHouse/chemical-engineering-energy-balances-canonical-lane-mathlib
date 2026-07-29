import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure SteadyStateFlowEnergy where
  massFlowRate : ℝ
  inletSpecificEnthalpy : ℝ
  outletSpecificEnthalpy : ℝ
  inletVelocity : ℝ
  outletVelocity : ℝ
  inletElevation : ℝ
  outletElevation : ℝ
  heatRate : ℝ
  workRate : ℝ
  gravitationalAcceleration : ℝ := 9.80665
  balanceEquation : massFlowRate * ((outletSpecificEnthalpy - inletSpecificEnthalpy) + (outletVelocity^2 - inletVelocity^2)/2 + gravitationalAcceleration*(outletElevation - inletElevation)) = heatRate - workRate

structure SteadyStateFlowEnergyEvidence (S : SteadyStateFlowEnergy) where
  flowRatePositive : S.massFlowRate > 0
  balanceClosed : S.balanceEquation

def SteadyStateFlowEnergyClosed (S : SteadyStateFlowEnergy) : Prop :=
  S.massFlowRate > 0 ∧ S.balanceEquation

theorem steady_state_flow_energy_closed_from_evidence (S : SteadyStateFlowEnergy) (E : SteadyStateFlowEnergyEvidence S) : SteadyStateFlowEnergyClosed S := by
  exact And.intro E.flowRatePositive E.balanceClosed

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse