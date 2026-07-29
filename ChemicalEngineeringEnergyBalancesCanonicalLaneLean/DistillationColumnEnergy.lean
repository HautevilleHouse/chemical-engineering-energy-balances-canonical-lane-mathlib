import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure DistillationColumnEnergy where
  feedFlowRate : ℝ
  feedEnthalpy : ℝ
  distillateFlowRate : ℝ
  distillateEnthalpy : ℝ
  bottomsFlowRate : ℝ
  bottomsEnthalpy : ℝ
  reboilerDuty : ℝ
  condenserDuty : ℝ
  overallBalance : (feedFlowRate * feedEnthalpy) + reboilerDuty = (distillateFlowRate * distillateEnthalpy) + (bottomsFlowRate * bottomsEnthalpy) + condenserDuty
  condenserBalance : condenserDuty = (distillateFlowRate * distillateEnthalpy) - (refluxFlowRate * refluxEnthalpy)  -- simplified
  refluxFlowRate : ℝ
  refluxEnthalpy : ℝ

structure DistillationColumnEnergyEvidence (D : DistillationColumnEnergy) where
  overallClosed : D.overallBalance
  condenserClosed : D.condenserBalance

def DistillationColumnEnergyClosed (D : DistillationColumnEnergy) : Prop :=
  D.overallBalance ∧ D.condenserBalance

theorem distillation_column_energy_closed_from_evidence (D : DistillationColumnEnergy) (E : DistillationColumnEnergyEvidence D) : DistillationColumnEnergyClosed D := by
  exact And.intro E.overallClosed E.condenserClosed

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse