import canonicalLaneMathlib.AdmissibleClass
import ChemicalEngineeringEnergyBalancesCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  True

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  trivial

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse