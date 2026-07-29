import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure EnthalpyBalancePackage where
  stream : Type
  inletEnthalpy : stream -> ℝ
  outletEnthalpy : stream -> ℝ
  heatAddition : ℝ
  workShaft : ℝ
  enthalpyChange : ℝ
  steadyFlowEq : ∀ s, inletEnthalpy s - outletEnthalpy s + heatAddition - workShaft = enthalpyChange

structure EnthalpyBalanceEvidence (H : EnthalpyBalancePackage) where
  steadyFlowChecked : H.steadyFlowEq
  nonNegativeHeat : H.heatAddition ≥ 0

def EnthalpyBalanceClosed (H : EnthalpyBalancePackage) : Prop :=
  ∀ s, H.inletEnthalpy s - H.outletEnthalpy s + H.heatAddition - H.workShaft = H.enthalpyChange

theorem enthalpy_balance_closed_from_evidence (H : EnthalpyBalancePackage) (Ev : EnthalpyBalanceEvidence H) :
    EnthalpyBalanceClosed H := by
  intro s
  exact Ev.steadyFlowChecked s

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse