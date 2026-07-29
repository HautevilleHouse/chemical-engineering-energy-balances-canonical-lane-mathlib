import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure ReactorEnergyBalance where
  systemVolume : ℝ
  molarFlowRateIn : ℝ
  molarFlowRateOut : ℝ
  inletEnthalpy : ℝ
  outletEnthalpy : ℝ
  heatTransferRate : ℝ
  shaftWork : ℝ
  reactionRate : ℝ
  reactionEnthalpy : ℝ
  energyAccumulation : ℝ
  energyBalanceEquation : energyAccumulation = (molarFlowRateIn * inletEnthalpy) - (molarFlowRateOut * outletEnthalpy) + heatTransferRate - shaftWork + (reactionRate * reactionEnthalpy)

structure ReactorEnergyBalanceEvidence (R : ReactorEnergyBalance) where
  volumePositive : R.systemVolume > 0
  energyBalanceClosed : R.energyBalanceEquation

def ReactorEnergyBalanceClosed (R : ReactorEnergyBalance) : Prop :=
  R.systemVolume > 0 ∧ R.energyBalanceEquation

theorem reactor_energy_balance_closed_from_evidence (R : ReactorEnergyBalance) (E : ReactorEnergyBalanceEvidence R) : ReactorEnergyBalanceClosed R := by
  exact And.intro E.volumePositive E.energyBalanceClosed

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse