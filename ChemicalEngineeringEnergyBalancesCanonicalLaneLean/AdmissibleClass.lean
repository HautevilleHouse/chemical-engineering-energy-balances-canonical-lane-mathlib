import chemicalEngineeringEnergyBalancesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure AdmissibleClass where
  object : EnergyBalanceAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  EnergyBalanceWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse