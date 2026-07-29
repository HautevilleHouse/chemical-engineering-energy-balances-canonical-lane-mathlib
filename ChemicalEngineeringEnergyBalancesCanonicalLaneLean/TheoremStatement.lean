import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure EnergyAdmittedObject where
  system : Type u
  energyBalanceEquation : Prop
  boundaryConditions : Prop
  constitutiveRelations : Prop
  conclusion : energyBalanceEquation ∧ boundaryConditions ∧ constitutiveRelations

def EnergyBalanceClosed (O : EnergyAdmittedObject) : Prop :=
  O.energyBalanceEquation ∧ O.boundaryConditions ∧ O.constitutiveRelations

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse