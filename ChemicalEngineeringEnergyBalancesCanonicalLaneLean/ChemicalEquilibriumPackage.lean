import ChemicalEngineeringEnergyBalancesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure ChemicalEquilibriumPackage where
  equilibriumConstant : Prop
  reactionQuotient : Prop
  leChatelierPrinciple : Prop
  temperatureEffect : Prop
  pressureEffect : Prop

structure ChemicalEquilibriumEvidence (C : ChemicalEquilibriumPackage) where
  equilibriumConstantClosed : C.equilibriumConstant
  reactionQuotientClosed : C.reactionQuotient
  leChatelierPrincipleClosed : C.leChatelierPrinciple
  temperatureEffectClosed : C.temperatureEffect
  pressureEffectClosed : C.pressureEffect

def ChemicalEquilibriumClosed (C : ChemicalEquilibriumPackage) : Prop :=
  C.equilibriumConstant ∧ C.reactionQuotient ∧ C.leChatelierPrinciple ∧ C.temperatureEffect ∧ C.pressureEffect

theorem chemical_equilibrium_closed_from_evidence (C : ChemicalEquilibriumPackage) (E : ChemicalEquilibriumEvidence C) :
    ChemicalEquilibriumClosed C := by
  exact And.intro E.equilibriumConstantClosed
    (And.intro E.reactionQuotientClosed
      (And.intro E.leChatelierPrincipleClosed
        (And.intro E.temperatureEffectClosed E.pressureEffectClosed)))

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse