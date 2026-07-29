import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure MassBalancePackage where
  component : Type
  inletFlows : component -> ℝ
  outletFlows : component -> ℝ
  accumulation : component -> ℝ
  reactionRates : component -> ℝ
  balanceEquation : ∀ c, inletFlows c - outletFlows c + reactionRates c = accumulation c

structure MassBalanceEvidence (M : MassBalancePackage) where
  balanceChecked : M.balanceEquation
  positivityAssumption : ∀ c, M.accumulation c ≥ 0

def MassBalanceClosed (M : MassBalancePackage) : Prop :=
  ∀ c, M.inletFlows c - M.outletFlows c + M.reactionRates c = M.accumulation c

theorem mass_balance_closed_from_evidence (M : MassBalancePackage) (E : MassBalanceEvidence M) :
    MassBalanceClosed M := by
  intro c
  exact E.balanceChecked c

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse