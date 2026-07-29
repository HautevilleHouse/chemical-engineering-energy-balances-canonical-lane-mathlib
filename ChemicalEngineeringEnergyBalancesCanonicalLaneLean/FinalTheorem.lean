import canonicalLaneMathlib.AdmissibleClass
import ChemicalEngineeringEnergyBalancesCanonicalLaneLean.BridgeLemmas
import ChemicalEngineeringEnergyBalancesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

def ConstrainedEnergyBalanceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_energy_balance_endgame (A : AdmissibleClass) :
    ConstrainedEnergyBalanceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse